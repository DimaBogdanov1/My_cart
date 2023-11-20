#include <QDebug>
#include <QSqlRecord>
#include <QSqlError>

#include "warnings.h"
#include "databases/accounts/accounts.h"
#include "databases/my_database.h"

Warnings::Warnings(QObject *parent) : QObject(parent)
{

    qDebug()<<"Конструктор предупреждений";

    create_table();

}


void Warnings::create_table() {

   // My_Database my_database;

   // this->Database = My_Database::get_db(); //my_database.Database;

    if (!My_Database::get_db().open())
    {
        qDebug() << My_Database::get_db().lastError().text();
    }
    else{

        // query.prepare("CREATE TABLE IF NOT EXISTS " + account_Table + " ( ID INTEGER PRIMARY KEY AUTOINCREMENT, LABEL TEXT  NOT NULL)");

         QSqlQuery query(My_Database::get_db());

         query.prepare("CREATE TABLE IF NOT EXISTS " + name_Table + " ( " + id + " INTEGER PRIMARY KEY AUTOINCREMENT, "

                       + account_ID + " INTEGER , " +  siteID  + " INTEGER , " + upNom + " INTEGER, " + putNom + " INTEGER, " + begin_Km + " INTEGER, " + begin_M + " INTEGER, "

                       +  end_Km  + " INTEGER , " + end_M + " INTEGER, " + input_Date + " DATE, " + begin_Date + " DATE, " + end_Date + " DATE, " + speed + " INTEGER )");

         if (!query.exec()) {

                  qDebug()<<"Ошибка содания таблицы предупреждений "<< query.lastError();
          }


         remove_Old_Warnings();

       //  qmlRegisterType<Test>("Core", 1, 0, "Test");

        // qmlRegisterType<Profile_Colors>("org.example", 1, 0, "Profile_Colors_Model");

    }




}


QString conver_to_date(QString str, bool isFromDB){

    //qDebug() << "Входная строка " + str;

    QString my_delimiter;

    QStringList list1;

    if(isFromDB){

        list1 = str.split('-');

        my_delimiter = ".";
    }
    else{

        list1 = str.split('.');

        my_delimiter = "-";

    }


    QString answer;

   // qDebug() << "list1 size =  " + QString::number(list1.size());

    if(list1.size() == 3){

        answer = list1.at(2) + my_delimiter + list1.at(1) + my_delimiter + list1.at(0);

       // qDebug() << "answer " + answer;
    }

    return answer;
}

void Warnings::get_All_Warnings(){

   // My_Database my_database;

   // this->Database = my_database.Database;

   // this->Database = My_Database::get_db();

    if (!My_Database::get_db().open())  // if (!Database.open())
    {
        qDebug() << My_Database::get_db().lastError().text();
    }
    else{


       // QSqlQuery query(Database);

        QSqlQuery query("SELECT * FROM " + name_Table, My_Database::get_db());

        //query.prepare("SELECT * FROM " + name_Table);

        if (!query.exec())
        {
            qDebug()<< "Ошибка открытия предупреждений"<< query.lastError();

        }

        //query.prepare("SELECT * FROM " + name_Table + " WHERE "+  end_Date + " > date('now')");

        while (query.next())
        {

          //  Accounts accounts;

           // accounts.get_User(query.value(1).toInt());

            QList account = Accounts::get_User(query.value(1).toInt());

            emit newWarning_signal(account.at(0), account.at(1).toInt(), query.value(3).toInt(), query.value(4).toInt(), query.value(5).toInt(), query.value(6).toInt(), query.value(7).toInt(), query.value(8).toInt(), conver_to_date(query.value(9).toString(), true), conver_to_date(query.value(10).toString(), true), conver_to_date(query.value(11).toString(), true), query.value(12).toInt() );
        }

    }



}


void Warnings::add_Warning(int account_ID, int siteID, int upNom, int putNom, int begin_Km, int begin_M, int end_Km, int end_M, QString input_Date, QString begin_Date, QString end_Date, int speed)
{

    bool result;

    //My_Database my_database;

    //this->Database = My_Database::get_db(); // my_database.Database;

    if (!My_Database::get_db().open())
    {
        qDebug() << My_Database::get_db().lastError().text();
    }
    else{

        QSqlQuery query(My_Database::get_db());

        query.prepare("INSERT INTO " + name_Table + "(" + this->account_ID + ", " + this->siteID + ", " + this->upNom + ", " + this->putNom + ", "

                        +  this->begin_Km + ", " + this->begin_M + ", " + this->end_Km + ", " + this->end_M + ", " + this->input_Date + ", " + this->begin_Date + ", " + this->end_Date + ", " + this->speed
                        + ") VALUES (:account_ID, :siteID, :upNom, :putNom, :begin_Km, :begin_M, :end_Km, :end_M, :input_Date, :begin_Date, :end_Date, :speed)");

        query.bindValue(":account_ID", account_ID);
        query.bindValue(":siteID", siteID);
        query.bindValue(":upNom", upNom);
        query.bindValue(":putNom", putNom);
        query.bindValue(":begin_Km", begin_Km);
        query.bindValue(":begin_M", begin_M);
        query.bindValue(":end_Km", end_Km);
        query.bindValue(":end_M", end_M);

        query.bindValue(":input_Date", conver_to_date(input_Date, false));
        query.bindValue(":begin_Date", conver_to_date(begin_Date, false));
        query.bindValue(":end_Date", conver_to_date(end_Date, false));
        query.bindValue(":speed", speed);


        if (!query.exec()) {

            qDebug()<<"Ошибка добавления предупреждения "<< query.lastError();

            result =  false;

        }
        else{

           // query.prepare("SELECT " + this->password + ", " + this->id + " FROM " + account_Table + " WHERE " + this->login + " = (:login) AND "  + this->color + " = (:color)");

          //  updateUser(login, new_color);

            result = true;

        }
    }





   // emit result_of_Adding_signal(result);


}

void Warnings::remove_Old_Warnings(){

    //QSqlQuery query(Database);

    QSqlQuery query("DELETE FROM " + name_Table + " WHERE " + end_Date + " < date('now')" , My_Database::get_db());

    //DELETE FROM WARNINGS

    //WHERE END_DATE <  date()

   // query.prepare("DELETE FROM " + name_Table + " WHERE " + end_Date + " < date('now')");

    if (!query.exec())
    {
        qDebug()<<"Ошибка удаления старых предупреждений"<< query.lastError();
    }


}
