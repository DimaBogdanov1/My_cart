#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QStandardPaths>
#include "databases/my_database.h"

my_database::my_database()
{

}

my_database::~my_database()
{
    Database.close();
}



void my_database::create_database()
{

    Database = QSqlDatabase::addDatabase("QSQLITE");

    Database.setDatabaseName("my_cart.db");

   // Database.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/my_cart.db");

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

        QSqlQuery query("CREATE TABLE IF NOT EXISTS Test "
                        "( ID INTEGER PRIMARY KEY AUTOINCREMENT, LABEL TEXT  NOT NULL)");


    }

}

void my_database::add()
{


    /*QSqlQuery query;
    query.prepare("INSERT INTO " TABLE " ( " TABLE_NAME ", "
                                             TABLE_PIC " ) "
                  "VALUES (:Name, :Pic)");
    query.bindValue(":Name",        data[0].toString());
    query.bindValue(":Pic",         data[1].toByteArray());

    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false; */

}
