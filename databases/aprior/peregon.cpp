#include "peregon.h"

Peregon::Peregon(QObject *parent) : QObject(parent)
{}

QVector<Station> Peregon::station{};//Наш вектор со станциями

QPair<Station,Station> Peregon::per{Station(),Station()};//собственно результат поиска где мы находимся перегон или какая то станция


//Заполняем вектор со станциями
void Peregon::Inp_station(const int Siteid,const  int Upnom,const  QString Putnom,QSqlDatabase &db)
{
    qDebug()<<QTime::currentTime()<<"Формирование вектора станций начало";
    if (station.size()>0)
        station.clear();
    if (db.open())
    {
        QSqlQuery q(db);
        q.prepare("SELECT "
                  "x1.KMIN2 as BEGIN_KM, "
                  "x1.MMIN as BEGIN_M, "
                  "x2.KMAX2 as END_KM, "
                  "x2.MMAX as END_M, "
                  "c.KM as OSKM, "
                  "c.M as OSM, "
                  "x1.ST_KOD as KOD, "
                  "b.NAME "
                  "FROM "
                  "(SELECT u1.KM AS KMIN2,MIN(u1.M) AS MMIN ,u1.ST_KOD FROM "
                   "(SELECT Min(km) AS KMIN,ST_KOD from STR WHERE SITEID=:SID AND UP_NOM=:NAIM AND PUT_NOM=:PUT group by ST_KOD) t1,STR u1 "
                    "WHERE t1.ST_KOD=u1.ST_KOD AND t1.KMIN=u1.KM AND u1.SITEID=:SID AND u1.UP_NOM=:NAIM AND u1.PUT_NOM=:PUT "
                                    "group by u1.ST_KOD,u1.KM order by u1.KM) x1, "
                   "(SELECT u2.KM AS KMAX2,MAX(u2.M) AS MMAX ,u2.ST_KOD FROM "
                    "(SELECT MAX(km) AS KMAX,ST_KOD from STR WHERE SITEID=:SID AND UP_NOM=:NAIM AND PUT_NOM=:PUT group by ST_KOD) t2,STR u2 "
                     "WHERE t2.ST_KOD=u2.ST_KOD AND t2.KMAX=u2.KM AND u2.SITEID=:SID AND u2.UP_NOM=:NAIM AND u2.PUT_NOM=:PUT "
                                    "group by u2.ST_KOD,u2.KM order by u2.KM) x2, "
                     "UP b,STANKM c "
                   "WHERE "
                   "x1.ST_KOD=x2.ST_KOD and b.SITEID=:SID AND b.SITEID=c.SITEID "
                   "and b.UP_NOM=x1.ST_KOD and x1.ST_KOD=c.CODE AND c.UP_NOM=:NAIM "
                   "ORDER by "
                   "x1.KMIN2, "
                   "x1.MMIN");
        q.bindValue(":SID",Siteid);
        q.bindValue(":NAIM",Upnom);
        q.bindValue(":PUT",Putnom);
        if (!q.exec())
        {
            qWarning()<<q.lastError();
        }
        while (q.next())
        {
            Station t;//Начало станции
            t.NAME=q.value("NAME").toString();
            t.CODE=q.value("KOD").toInt();
            t.KM=q.value("BEGIN_KM").toInt();
            t.M=q.value("BEGIN_M").toInt();
            station<<t;
            Station f;//Конец станции
            f.NAME=q.value("NAME").toString();
            f.CODE=q.value("KOD").toInt();
            f.KM=q.value("END_KM").toInt();
            f.M=q.value("END_M").toInt();
            station<<f;

        }
        qDebug()<<"station.size()"<<station.size();
    } else
        qWarning()<<db.databaseName()<<"Не подключена";
    qDebug()<<QTime::currentTime()<<"Формирование вектора станций конец";
}


//сам процесс поиска
void Peregon::Poisk(const int KM, const int M)
{
    qDebug()<<QTime::currentTime()<<"Поиск старт";
    per={Station(),Station()};//деф  while (curr_id!=end())
    QVector<Station>::ConstIterator i = station.cbegin();
    while (i!=station.cend())
    {
        if (i->KM<KM || (i->KM==KM && i->M<=M))
            per.second=*i;
        else
        {
            per.first=*i;
            break;
        }
        i++;
    }
    qDebug()<<QTime::currentTime()<<"Поиск окончание";
}


//вывод пары данных между которыми мы находимся
QPair<Station,Station> Peregon::Get_DataRezPeregon()
{
    return per;
}


//вывод перегона или станции в готовом виде
QString Peregon::Get_RezPeregon()
{
    if (per.second.CODE==per.first.CODE)
    {
        if (per.second.CODE!=-1)
            return "станция : "+QString::number(per.second.CODE)+" - "+per.second.NAME; //Мы на станции
    } else
        return "перегон : "+per.second.NAME +" - "+per.first.NAME;//мы на перегоне
    return "Не определено";//дефолт
}

