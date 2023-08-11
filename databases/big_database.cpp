#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>

#include "databases/big_database.h"
#include "models/StartTask_Model.h"

big_database::big_database(QObject *parent) : QObject(parent)
{

}

void big_database::openDatabase(QString path_db)
{
 qDebug() << "qqqqqqqq  " +  path_db;

 QSqlDatabase Database;

 Database = QSqlDatabase::addDatabase("QSQLITE");

 Database.setDatabaseName(path_db);

 //Database.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/ApBAZE.db");


 StartTask_Model task_model;

 if (!Database.open())
 {
     qDebug() << Database.lastError().text();
 }
 else{

     QSqlQuery query("SELECT * FROM Up");

     //int idName = query.record().indexOf("NAME");
     while (query.next())
     {

        QString code = query.value(query.record().indexOf("UP_NOM")).toString();

        QString name = query.value(query.record().indexOf("NAME")).toString();

       // qDebug() << name;

        emit newItem_Database_signal(code, "1", name , "1", "1"); // Отправляем Сигнал


       // task_model.createModel("1", "1", "1", "1" , "1");
     }


   //  emit newItem_Database_signal("1", "1", "1", "1" , "1"); // Отправляем Сигнал

     qDebug() << "openeeeee";



 }



 emit mySignal("AAAAA"); // Отправляем Сигнал


}
