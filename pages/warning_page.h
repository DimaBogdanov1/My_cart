#ifndef WARNING_PAGE_H
#define WARNING_PAGE_H


#include <QObject>
#include <QDebug>
#include <QDate>

#include "../Passport_DB_Lib/passport_db_lib.h"
#include "../User_DB_Lib/warnings/warnings.h"

class Warning_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString start_Km MEMBER start_Km WRITE set_StartKm NOTIFY string_changed)

    Q_PROPERTY(QString start_M MEMBER start_M WRITE set_StartM NOTIFY string_changed)

    Q_PROPERTY(QString end_Km MEMBER end_Km WRITE set_EndKm NOTIFY string_changed)

    Q_PROPERTY(QString end_M MEMBER end_M WRITE set_EndM NOTIFY string_changed)

    Q_PROPERTY(QDate left_date MEMBER left_date WRITE set_LeftDate NOTIFY date_changed)

    Q_PROPERTY(QDate right_date MEMBER right_date WRITE set_RightDate NOTIFY date_changed)


    Q_PROPERTY(int pickedindex_SiteIDModel MEMBER pickedindex_SiteIDModel WRITE set_pickedindex_SiteIDModel NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* SiteId_Model MEMBER SiteId_Model NOTIFY model_Changed)


    Q_PROPERTY(int pickedindex_Type_Tracks_Model MEMBER pickedindex_Type_Tracks_Model WRITE set_pickedindex_Type_Tracks_Model NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* Type_Tracks_Model MEMBER Type_Tracks_Model NOTIFY model_Changed)


    Q_PROPERTY(int pickedindex_Up_Nom_Model MEMBER pickedindex_Up_Nom_Model WRITE set_pickedindex_Up_Nom_Model NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* Up_Nom_Model MEMBER Up_Nom_Model NOTIFY model_Changed)

public:

    inline explicit Warning_Page(QObject *parent = nullptr) : QObject(parent) {

        Passport_DB_Lib::get_SiteID();

    }

    Q_INVOKABLE void set_StartKm(QString value){start_Km = value;}

    Q_INVOKABLE void set_StartM(QString value){start_M = value;}

    Q_INVOKABLE void set_EndKm(QString value){end_Km = value;}

    Q_INVOKABLE void set_EndM(QString value){end_M = value;}

    Q_INVOKABLE void set_LeftDate(QDate value){left_date = value;}

    Q_INVOKABLE void set_RightDate(QDate value){right_date = value;}



    Q_INVOKABLE void set_pickedindex_SiteIDModel(int value){pickedindex_SiteIDModel = value;}

    Q_INVOKABLE void set_pickedindex_Type_Tracks_Model(int value){pickedindex_Type_Tracks_Model = value;}

    Q_INVOKABLE void set_pickedindex_Up_Nom_Model(int value){pickedindex_Up_Nom_Model = value;}



    Q_INVOKABLE void add_Warning(int account_ID, int siteID, int upNom, int putNom, int begin_Km, int begin_M, int end_Km, int end_M, QString input_Date, QString begin_Date, QString end_Date, int speed){

        Warnings::add_Warning(account_ID, siteID, upNom, putNom, begin_Km, begin_M, end_Km, end_M, input_Date, begin_Date, end_Date, speed);
    }

private:

    inline static QString start_Km, start_M, end_Km, end_M;


    inline static QDate date = QDate::currentDate();

    inline static QDate left_date = date, right_date = date.addDays(3);

    inline static int pickedindex_SiteIDModel, pickedindex_Type_Tracks_Model, pickedindex_Up_Nom_Model, pickedindex_Put_Nom_Model;

    inline static My_Model *SiteId_Model = &Passport_DB_Lib::siteid_model;

    inline static My_Model *Type_Tracks_Model = &Passport_DB_Lib::type_Tracks_Model;

    inline static My_Model *Up_Nom_Model = &Passport_DB_Lib::up_Nom_Model;

signals:
    void string_changed(const QString &value);
    void date_changed(const QString &value);

    void pickedindex_ModelChanged(const int value);
    void model_Changed(const My_Model *value);

};

#endif // WARNING_PAGE_H
