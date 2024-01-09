#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QFile>
#include <QSqlQueryModel>

#include "databases/big_database.h"

#include "mqtt/log_microservice.h"

QSqlDatabase Database;

QString numRoad_picked = "1"; //Дорога начальная (Октябрьская)

QString Type_picked = "1"; // Тип (Главные, Станционные)

QString name_Direction = ""; // Направление (Москва-Рига)

int km_start, m_start, km_end, m_end;

int id = -1;//Выделяемый индекс

big_database::big_database(QObject *parent) : QObject(parent)
{

}

// Проверка Координаты По Базе Данных
bool check_coord_from_database(QString up_nom, QString put_nom, QString Input_KM, QString Input_M) {

    QString NF= ":/sqlite/ITEMCORRECT.SQL";

    QFile FileSQL(NF);

    FileSQL.open(QFile::ReadOnly);//на чтение

    Database.transaction();

    QSqlQuery query(Database);

    query.clear();

    query.prepare(FileSQL.readAll());

    query.bindValue(":sit", numRoad_picked);
    query.bindValue(":upn", up_nom);
    query.bindValue(":ptn", put_nom);
    query.bindValue(":km", Input_KM);
    query.bindValue(":m", Input_M);

    if (!query.exec()) {

        qDebug()<<"Ошибка запроса проверки координаты"<< query.lastError();
        return false;
    }

    query.first();
    if (query.isValid()) {

        if (query.value("CL").toInt() > 0)
            return true;
        else
            qDebug()<<"Координата произвольной точки: "+ Input_KM +" км "+ Input_M +" м не корректна в границах километража направления " +
                       up_nom + " пути " + put_nom + " дороги "+ numRoad_picked;
    }
}

QSqlQuery create_query(QString sql_file, bool check){

    QString NF= sql_file;

    if(QFile::exists(NF)) {

        QFile FileSQL(NF);

        FileSQL.open(QFile::ReadOnly);//на чтение

        Database.transaction();

        QSqlQuery query(Database);

        query.clear();

        if(check){

            query.prepare(FileSQL.readAll());

        }
        else{

            QString Fl(FileSQL.readAll());

            Fl.remove("\r\n");

            if (numRoad_picked=="") numRoad_picked="-1";
            Fl.replace(":SID",numRoad_picked);

           // qDebug()<<Fl;

           // if (tb->currentIndex()==0) {TYP="1";} else {TYP="2,3,4";} // tb // Это Тулбар Главные И Станционные Пути

            qDebug() <<  "Тип путей: " + Type_picked;

            Fl.replace(":TYP", Type_picked);

            query.exec(Fl);


    }


        return query;

    }


    // qDebug() << "dssd" + FileSQL.readAll() ;
}


void big_database::check_Coordination(QString up_nom, QString name_Direction, QString put_nom, int Input_KM, int Input_M){

    qDebug().nospace() << "\n" << "Проверка направления "  + up_nom + ", номер пути " + put_nom;

    qDebug() << "Входные данные км "  + QString::number(Input_KM) + ", м " + QString::number(Input_M);

    bool result = false;

    if ((km_start * 1000 + m_start <= Input_KM * 1000 + Input_M) and (km_end * 1000 + m_end >= Input_KM * 1000 + Input_M)){

        qDebug()<<"Проверка 1 пройдена";

        result = check_coord_from_database(up_nom, put_nom, QString::number(Input_KM),  QString::number(Input_M));

        qDebug() << "Проверка 2 "  + QVariant(result).toString();

    }
    else{

        qDebug()<<"Проверка не пройдена";

    }

    emit checkResult_signal(result);

    if(result){ // Приёмка Этого Сигнала Будет На Другом Слое

        task_Up_Nom = up_nom;

        task_Name_Direction = name_Direction;

        task_Put_nom = put_nom;

     //   emit newTask_signal(up_nom, name_Direction, put_nom);

    }
}

void big_database::get_Task_Param(){

    emit newTask_signal(task_Up_Nom, task_Name_Direction, task_Put_nom);

}

void big_database::update_numRoad(QString combo_text){

    QRegExp separator(" - ");

    QStringList list = combo_text.split(separator);

    numRoad_picked = list[0];

    qDebug().nospace()  << "\n" <<  "Обновим номер дороги: " + numRoad_picked;

    update_upNom();
}

void big_database::update_Type(int index)
{
    QString last_type = Type_picked;

    if(index == 0){

        Type_picked = "1";

        qDebug().nospace()  << "\n" <<  "Обновим тип: Гланые пути";

    }
    else{

        Type_picked = "2,3,4";

        qDebug().nospace()  << "\n" <<  "Обновим тип: Станционные пути";

    }

    if(last_type != Type_picked){

        update_upNom();
    }

}


// Эта Функция Будет Срабатывать Когда Я Меняю Значение В Таблице С Кодом Дороги
void big_database::update_putNom(QString up_nom){

    qDebug() << "Код направления " + up_nom;

    QSqlQuery query = create_query(":/sqlite/PUT.SQL", true);

    //QString SID = num_Road; // Номер Дороги (Октябрьская)

    query.bindValue(":SID", numRoad_picked);

  //  QModelIndex indt2 = 0;

 //   query.bindValue(":NAIM",upntabl->model()->data(upntabl->model()->index(indt2.row(),0),0).toString());

    query.bindValue(":NAIM", up_nom); // 11532 (2в, 5в)


    query.exec();

    QSqlQueryModel *way = new QSqlQueryModel;
    way->clear();
    way->setQuery(query);//скл модель грузим запрос

    int pick_way = 0;


    for(int i = 0; i < way->rowCount(); i++){

       // qDebug() << way->record(i).value(0).toString() <<  way->record(i).value(1).toString();

        km_start = way->record(pick_way).value(3).toInt();

        m_start = way->record(pick_way).value(4).toInt();

        km_end = way->record(pick_way).value(5).toInt();

        m_end = way->record(pick_way).value(6).toInt();

        emit newPutNom_signal(way->record(i).value(0).toString(), way->record(i).value(1).toString(), QString::number(km_start), QString::number(m_start), QString::number(km_end), QString::number(m_end));

    }

    qDebug() << "км старт = " + QString::number(km_start) + " м старт = " + QString::number(m_start) + " км финиш = " + QString::number(km_end) + " м финиш = " + QString::number(m_end);

}


// Функция Добавления Кода И Направления
void big_database::update_upNom(){

    QSqlQuery query = create_query(":/sqlite/NAIM.SQL", false);

    QSqlQueryModel *nam = new QSqlQueryModel;
    nam->clear();
    nam->setQuery(query);//скл модель грузим запрос

    for(int i = 0; i < nam->rowCount(); i++){

        //qDebug() << "eeee " + nam->record(i).value(0).toString();

        emit newUpNom_signal(nam->record(i).value(0).toString(), nam->record(i).value(1).toString());
    }

    qDebug() << "Количество путей " + QVariant(nam->rowCount()).toString();

    update_putNom(nam->record(0).value(0).toString()); // Обновляем Таблицу С Путями 1-м Значением
}




// Эта Функция Для Заполнения Комбо Бокса
void big_database::set_roads(){

    QSqlQuery query = create_query(":/sqlite/ROAD.SQL", true);

    if (!query.exec()) {

        qDebug() << "ROAD";
        qDebug() << query.lastError();

        return;
    }

    query.first();

    int nom = 0;

    QString nameRoad;

    while (query.isValid())
    {
        nameRoad = query.value("ID").toString() + " - " + query.value("NAME").toString();

      //  qDebug() << nameRoad;

        if (query.value("ID").toString() == numRoad_picked) {id=nom;}
        nom++;

        emit newRoad_signal(nameRoad);

        query.next();
    }

    Database.commit();

    update_upNom();

}

void big_database::openDatabase(QString path_db)
{
    qDebug() << "qqqqqqqq  " +  path_db;

    Database = QSqlDatabase::addDatabase("QSQLITE");

    Database.setDatabaseName(path_db);

    //Database.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/ApBAZE.db");


   // StartTask_Model task_model;

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

       Log_Microservice::create_LogRecord("Открыли базу данных РЖД");

       set_roads();

    }


}
