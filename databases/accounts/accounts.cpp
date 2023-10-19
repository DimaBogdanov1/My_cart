#include <QDebug>
#include <QSqlRecord>
#include <QSqlError>
#include <QtQml>

#include <random>
#include <list>
#include <algorithm>

#include "accounts.h"
#include "databases/my_database.h"
#include "colors_profile.h"


Accounts::Accounts(QObject *parent) : QObject(parent)
{
    qDebug() << "Конструктор аккаунтов";
    create_table();
}

int new_color = 0;

int randInt(int low, int high)
{
    return qrand() % ((high + 1) - low) + low;
}

bool Accounts::check_identity(QString login){

    qDebug().nospace() << "\n" << "Проверяем на идентичность логин " + login;

    QSqlQuery query(Database);

    query.prepare("SELECT " + this->color +  " FROM " + account_Table + " WHERE " + this->login + " = (:login)");
    query.bindValue(":login", login);

    query.exec();

    bool check_result = true;

    QList<int> tmp_list;

    Colors_Profile a;

    for(int i = 0; i < a.list.size(); i++){

        tmp_list.append(i);
    }

    QList<int> free_colors;

    QList<int> color_list;


    while (query.next())
    {
        color_list.append(query.value(0).toInt());
    }

    if(color_list.size() == 0){

        new_color = randInt(0, tmp_list.size() - 1);

    }
    else{

        std::sort(color_list.begin(), color_list.end());

        for(int i; i < color_list.size(); i++){

            qDebug() << "Занятые цвета =  " + QString::number(color_list[i]);

        }


        std::set_difference(tmp_list.begin(), tmp_list.end(), color_list.begin(), color_list.end(),

        std::inserter(free_colors, free_colors.begin()));


        for(int i; i < free_colors.size(); i++){

            qDebug() << "Cвободные цвет =  " + QString::number( free_colors[i]);


        }

        if(free_colors.size() != 0){

            int randomValue = randInt(0, free_colors.size() - 1);

            new_color = free_colors[randomValue];

            qDebug() << "Новый цвет =  " + QString::number(new_color);

        }
        else{

            check_result = false;

        }

    }

    return check_result;

}

void Accounts::create_table() {

    My_Database my_database;

    this->Database = my_database.Database;

    if (!Database.open())
    {
        qDebug() << Database.lastError().text();
    }
    else{

        // query.prepare("CREATE TABLE IF NOT EXISTS " + account_Table + " ( ID INTEGER PRIMARY KEY AUTOINCREMENT, LABEL TEXT  NOT NULL)");

         QSqlQuery query(Database);

         query.prepare("CREATE TABLE IF NOT EXISTS " + account_Table + " ( " + id + " INTEGER PRIMARY KEY AUTOINCREMENT, "+ login  + " TEXT , " + password + " INTEGER, " + color + " INTEGER )");

         if (!query.exec()) {

                  qDebug()<<"Ошибка содания таблицы аккаунтов "<< query.lastError();
          }

         qmlRegisterType<Colors_Profile>("com.Colors_Profile", 1, 0, "Colors_Profile");


       //  qmlRegisterType<Test>("Core", 1, 0, "Test");

        // qmlRegisterType<Profile_Colors>("org.example", 1, 0, "Profile_Colors_Model");

    }



}

void Accounts::get_All_Users(){

    qDebug() << "get alllllll";

    My_Database my_database;

    this->Database = my_database.Database;


    QSqlQuery query(Database);


    query.prepare("SELECT * FROM " + account_Table);

    if (!query.exec())
    {
        qDebug()<<"Ошибка открытия аккаунтов"<< query.lastError();

        if(!Database.open()){

            qDebug()<<"Пустая бд";

        }
    }
   // query.exec();

    while (query.next())
    {
        //Profile account( query.value(1).toString(),  query.value(2).toInt(),  query.value(3).toInt());

        //d.append(account);

        emit newUser_signal(query.value(0).toInt(), query.value(1).toString(), query.value(2).toInt(), query.value(3).toInt());

        //qDebug() << "Пользователь " << QVariant( query.value(1)).toString();
    }


}

void::Accounts::updateUser(QString login, int color){

   // ID_AuthorizationUser = id;

    emit update_AuthorizationUser_signal(login, color);

}

void Accounts::add_User(QString login, int password) {

    bool result;

    QSqlQuery query(Database);

    if(check_identity(login)){

        query.prepare("INSERT INTO " + account_Table + "(" + this->login + ", " + this->password + ", " + this->color + ") VALUES (:login, :password, :color)");
        query.bindValue(":login", login);
        query.bindValue(":password", password);
        query.bindValue(":color", new_color);

        if (!query.exec()) {

            qDebug()<<"Ошибка добавления аккаунта "<< query.lastError();

            result =  false;

        }
        else{

            query.prepare("SELECT " + this->password + ", " + this->id + " FROM " + account_Table + " WHERE " + this->login + " = (:login) AND "  + this->color + " = (:color)");

            updateUser(login, new_color);

            result = true;

        }

    }
    else{

        qDebug()<<"Проверка на идентичность не пройдена";

        result = false;
    }

    emit result_of_Adding_signal(result);


}

void Accounts::check_Password(QString login, int password, int color){

    bool result;

    QSqlQuery query(Database);

    query.prepare("SELECT " + this->password + ", " + this->id + " FROM " + account_Table + " WHERE " + this->login + " = (:login) AND "  + this->color + " = (:color)");
    query.bindValue(":login", login);
    query.bindValue(":color", color);

    query.exec();

    qDebug() <<"Проверяем Логин = " +  login + " Введённый пароль = " + QVariant(password).toString() + " Цвет = " + QString::number(color);

    while (query.next())
    {

        int account_password = query.value(0).toInt();

        qDebug() << "Пароль аккаунта в базе данных " + QString::number(account_password);

        if(password == account_password){

            result = true;

            // ID_AuthorizationUser = query.value(1).toInt();

            updateUser(login, color);

            qDebug() <<"Пароль подошёл";
        }
        else{

            result = false;

            qDebug() <<"Пароль не подошёл";

        }

    }

    emit result_of_Authorization_signal(result);

}

void Accounts::delete_User(int index) {

    qDebug() << "Id на удаление " +  QString::number(index);

    QSqlQuery query(Database);

    query.prepare("DELETE FROM " + account_Table + " WHERE ID = (:id)");

    query.bindValue(":id", index);

    if (!query.exec()) {

        qDebug()<<"Ошибка удаления аккаунта "<< query.lastError();
    }

}
