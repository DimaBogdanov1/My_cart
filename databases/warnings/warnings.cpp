#include <QDebug>
#include <QSqlRecord>
#include <QSqlError>


#include "warnings.h"
#include "databases/my_database.h"

Warnings::Warnings(QObject *parent) : QObject(parent)
{

    qDebug()<<"Конструктор предупреждений";

    create_table();

}


void Warnings::create_table() {

    My_Database my_database;

    this->Database = my_database.Database;

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

        // query.prepare("CREATE TABLE IF NOT EXISTS " + account_Table + " ( ID INTEGER PRIMARY KEY AUTOINCREMENT, LABEL TEXT  NOT NULL)");

         QSqlQuery query(Database);

         query.prepare("CREATE TABLE IF NOT EXISTS " + name_Table + " ( " + id + " INTEGER PRIMARY KEY AUTOINCREMENT, "

                       +  siteID  + " INTEGER , " + upNom + " INTEGER, " + putNom + " INTEGER, " + begin_Km + " INTEGER, " + begin_M + " INTEGER, "

                       +  end_Km  + " INTEGER , " + end_M + " INTEGER, " + begin_Date + " TEXT, " + end_Date + " TEXT, " + speed + " INTEGER )");

         if (!query.exec()) {

                  qDebug()<<"Ошибка содания таблицы предупреждений "<< query.lastError();
          }


       //  qmlRegisterType<Test>("Core", 1, 0, "Test");

        // qmlRegisterType<Profile_Colors>("org.example", 1, 0, "Profile_Colors_Model");

    }




}

void Warnings::add_Warning(int siteID, int upNom, int putNom, int begin_Km, int begin_M, int end_Km, int end_M, QString begin_Date, QString end_Date, int speed)
{

    bool result;

    My_Database my_database;

    this->Database = my_database.Database;

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

        QSqlQuery query(Database);


        query.prepare("INSERT INTO " + name_Table + "(" + this->siteID + ", " + this->upNom + ", " + this->putNom + ", "

                        +  this->begin_Km + ", " + this->begin_M + ", " + this->end_Km + ", " + this->end_M + ", " + this->begin_Date + ", " + this->end_Date + ", " + this->speed
                        + ") VALUES (:siteID, :upNom, :putNom, :begin_Km, :begin_M, :end_Km, :end_M, :begin_Date, :end_Date, :speed)");

        query.bindValue(":siteID", siteID);
        query.bindValue(":upNom", upNom);
        query.bindValue(":putNom", putNom);
        query.bindValue(":begin_Km", begin_Km);
        query.bindValue(":begin_M", begin_M);
        query.bindValue(":end_Km", end_Km);
        query.bindValue(":end_M", end_M);

        query.bindValue(":begin_Date", begin_Date);
        query.bindValue(":end_Date", end_Date);
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

