#ifndef AUTHORIZED_ACCOUNT_H
#define AUTHORIZED_ACCOUNT_H


#include <QObject>
#include <QDebug>

#include "../User_DB_Lib/accounts/accounts.h"

class Authorized_Account : public QObject , public Accounts
{
    Q_OBJECT

//    Q_PROPERTY(QString login READ get_login WRITE set_Login NOTIFY string_changed)

    Q_PROPERTY(QString login MEMBER login NOTIFY string_changed)

   // Q_PROPERTY(int authorized_Password MEMBER authorized_Password WRITE set_Password NOTIFY int_changed)

   // Q_PROPERTY(int authorized_Color MEMBER authorized_Color WRITE set_Color NOTIFY int_changed)

public:

    inline explicit Authorized_Account(QObject *parent = nullptr) : QObject(parent) {

    }

     Q_INVOKABLE void set_Login(const QString value){

        this->login = value;

        emit string_changed(value);

    }

   /* void set_Login(QString value){

       // login = value;



        emit string_changed("sdasdasd");

          qDebug() << "My Loginsetwe = " + value;
    }*/

   // Q_INVOKABLE void set_Password(int value){password = value; emit int_changed(value);}

//    Q_INVOKABLE void set_Color(int value){color = value; emit int_changed(value);}


   // inline static QString login; // = &Accounts::authorized_Login;



private:

    inline static QString login =  Accounts::authorized_Login; //  "aa"; //&Accounts::authorized_Login;


    //inline static int password, color = 0;

    //inline static QString login = "aa"; //&Accounts::authorized_Login;

    // inline static int password, color = 0;


signals:
   void string_changed(const QString &value);
   void int_changed(const int &value);
};

#endif // AUTHORIZED_ACCOUNT_H
