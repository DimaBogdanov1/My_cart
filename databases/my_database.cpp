#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QStandardPaths>

#include "my_database.h"
//#include "accounts/accounts.h"


My_Database::My_Database()
{

    //create_database();

  /*  Database = QSqlDatabase::addDatabase("QSQLITE");

    Database.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/my_cart.db");

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

    } */

}

QSqlDatabase& My_Database::get_db()
{
    static QSqlDatabase db;
    if (!db.isValid()){

        db = QSqlDatabase::addDatabase("QSQLITE");

        db.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/my_cart.db");

    }
    return db;
}

/*My_Database::~My_Database()
{
    //Database.close();
}


Accounts accounts;

void My_Database::create_database()
{
    QSqlDatabase Database;

    Database = QSqlDatabase::addDatabase("QSQLITE");

   // Database.setDatabaseName("my_cart.db");

    Database.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/my_cart.db");

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

       // Accounts accounts_2;

       // accounts = accounts_2;

        //accounts.create_table();
    }
}

void My_Database::get_All_Persons(){

    QList<Accounts::Profile> profiles = accounts.get_All_Persons();

    for(Accounts::Profile var : profiles){

        emit newUser_signal(var.login, var.password, var.color);

    }
}

void My_Database::add_Person(QString login, int password){

    emit result_of_Adding_signal(accounts.add_Person(login, password));

}

void My_Database::delete_Person(int index){

    accounts.delete_Person(index);
}
*/
