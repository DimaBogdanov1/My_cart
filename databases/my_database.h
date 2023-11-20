#ifndef MY_DATABASE_H
#define MY_DATABASE_H

#include <QObject>
#include <QSqlDatabase>

class My_Database
{

public:

    My_Database();

    static QSqlDatabase& get_db();


  //  QSqlDatabase Database = QSqlDatabase::addDatabase("QSQLITE") ;//.setDatabaseName("/Users/dimabogdanov/Documents/MyCart_res/my_cart.db");


   // explicit My_Database(QObject *parent = nullptr);

    //~My_Database();

   /* void create_database();

public slots:

    void get_All_Persons();

    void add_Person(QString login, int password);

    void delete_Person(int index);


signals:

    void result_of_Adding_signal(const bool& value);

    void newUser_signal(const QString& login, const int& password, const int& color); */

};



#endif // MY_DATABASE_H
