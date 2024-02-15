#ifndef REGISTER_PAGE_H
#define REGISTER_PAGE_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>


#include "authorized_account.h"

#include "../User_DB_Lib/user_db_lib.h"

#include "../Log_Lib/log_info.h"

#include "../Log_Lib/log_lib.h"

class Register_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name MEMBER name WRITE set_Name NOTIFY string_changed)

    Q_PROPERTY(QString surname MEMBER surname WRITE set_Surname NOTIFY string_changed)

    Q_PROPERTY(QString password MEMBER password WRITE set_Password NOTIFY string_changed)

    Q_PROPERTY(QString repeatPassword MEMBER repeatPassword WRITE set_RepeatPassword NOTIFY string_changed)

public:

    inline explicit Register_Page(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void set_Name(QString value){name = value;}

    Q_INVOKABLE void set_Surname(QString value){surname = value;}

    Q_INVOKABLE void set_Password(QString value){password = value;}

    Q_INVOKABLE void set_RepeatPassword(QString value){repeatPassword = value;}


    Q_INVOKABLE void add_User(QString login, int password){

        Log_Info log_info = User_DB_Lib::add_User(login, password);

        emit new_notification(log_info.get_Info());

      //  Authorized_Account::login = "dsasad";

      // Authorized_Account a;

      //  a.set_Login("wwwwww");

        Log_Lib::Add_Row(Log_Lib::Tablet_App, log_info);

    }
private:

    inline static QString name, surname, password, repeatPassword;

signals:
   void string_changed(const QString &value);

   void new_notification(const QString &value);

};

#endif // REGISTER_PAGE_H
