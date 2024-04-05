#ifndef WARNING_PAGE_H
#define WARNING_PAGE_H


#include <QObject>
#include <QDebug>
#include <QDate>

#include "../Passport_DB_Lib/passport_db_lib.h"

#include "../Passport_DB_Lib/pages/task_passport_db.h"

#include "../User_DB_Lib/warnings/warnings.h"
#include "../Passport_DB_Lib/help_class.h"

class Warning_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QDate left_date MEMBER left_date WRITE set_LeftDate NOTIFY date_changed)

    Q_PROPERTY(QDate right_date MEMBER right_date WRITE set_RightDate NOTIFY date_changed)



    Q_PROPERTY(Task_Passport_DB* task_Passport_DB MEMBER task_Passport_DB NOTIFY task_Passport_DB_Changed)


public:

   // Passport_DB_Lib a;


    inline explicit Warning_Page(QObject *parent = nullptr) : QObject(parent) {


    }


    Q_INVOKABLE void set_LeftDate(QDate value){left_date = value;}

    Q_INVOKABLE void set_RightDate(QDate value){right_date = value;}



    Q_INVOKABLE void add_Warning(int account_ID, int siteID, int upNom, int putNom, int begin_Km, int begin_M, int end_Km, int end_M, QString input_Date, QString begin_Date, QString end_Date, int speed){

        Warnings::add_Warning(account_ID, siteID, upNom, putNom, begin_Km, begin_M, end_Km, end_M, input_Date, begin_Date, end_Date, speed);
    }

private:


    inline static QDate date = QDate::currentDate();

    inline static QDate left_date = date, right_date = date.addDays(3);


    inline static Task_Passport_DB *task_Passport_DB = new Task_Passport_DB;

signals:
    void string_changed(const QString &value);
    void date_changed(const QString &value);

    void task_Passport_DB_Changed(const Task_Passport_DB *value);

   // void pickedindex_ModelChanged(const int value);
   // void model_Changed(const My_Model *value);

};

#endif // WARNING_PAGE_H
