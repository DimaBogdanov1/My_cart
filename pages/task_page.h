#ifndef TASK_PAGE_H
#define TASK_PAGE_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>

#include "../Passport_DB_Lib/passport_db_lib.h"

class Task_Page : public QObject, public Passport_DB_Lib
{
    Q_OBJECT

    Q_PROPERTY(bool flip_card MEMBER flip_card WRITE set_FlipCard NOTIFY flipCardChanged)

    Q_PROPERTY(QString start_Km MEMBER start_Km WRITE set_StartKm NOTIFY string_changed)

    Q_PROPERTY(QString start_M MEMBER start_M WRITE set_StartM NOTIFY string_changed)

    Q_PROPERTY(QVariantList coordList MEMBER coordList NOTIFY coordChanged)

    Q_PROPERTY(int pickedindex_SiteIDModel MEMBER pickedindex_SiteIDModel WRITE set_pickedindex_SiteIDModel NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* SiteId_Model MEMBER SiteId_Model NOTIFY model_Changed)


    Q_PROPERTY(int pickedindex_Type_Tracks_Model MEMBER pickedindex_Type_Tracks_Model WRITE set_pickedindex_Type_Tracks_Model NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* Type_Tracks_Model MEMBER Type_Tracks_Model NOTIFY model_Changed)


    Q_PROPERTY(int pickedindex_Up_Nom_Model MEMBER pickedindex_Up_Nom_Model WRITE set_pickedindex_Up_Nom_Model NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* Up_Nom_Model MEMBER Up_Nom_Model NOTIFY model_Changed)


    Q_PROPERTY(int pickedindex_Put_Nom_Model MEMBER pickedindex_Put_Nom_Model WRITE set_pickedindex_Put_Nom_Model NOTIFY pickedindex_ModelChanged)

    Q_PROPERTY(My_Model* Put_Nom_Model MEMBER Put_Nom_Model NOTIFY model_Changed)



    Q_PROPERTY(Fragments_Model* My_Fragments_Model MEMBER My_Fragments_Model NOTIFY fragmentModel_Changed)

    Q_PROPERTY(Fragments_Model* My_Picked_Fragments_Model MEMBER My_Picked_Fragments_Model NOTIFY fragmentModel_Changed)

public:

    inline explicit Task_Page(QObject *parent = nullptr) : QObject(parent) {

        Passport_DB_Lib::get_SiteID();

    }

    Q_INVOKABLE void set_SiteID(const QString new_SiteId){

        Passport_DB_Lib::set_SiteID(new_SiteId);

        //Passport_DB_Lib::fragments_Model.clear();

        //My_Fragments_Model->clear();

         //qDebug() << "Размер = " + QString::number(My_Fragments_Model->rowCount());

         //My_Fragments_Model->addFragment(1, 1, 2, 230, 3, 340, "Nameeee");

         //qDebug() << "Размер = " + QString::number(My_Fragments_Model->rowCount());

        emit coordChanged(coordList);

    }

    Q_INVOKABLE void set_TypeTrack(const int type){

        pickedindex_Type_Tracks_Model = type;

        Passport_DB_Lib::set_TypeTrack(type);

        emit coordChanged(coordList);

    }

    Q_INVOKABLE void set_UpNom(const QString new_UpNom){

        Passport_DB_Lib::set_UpNom(new_UpNom);

        emit coordChanged(coordList);

    }


    Q_INVOKABLE void set_FlipCard(bool value){flip_card = value; emit flipCardChanged(value);}

    Q_INVOKABLE void set_StartKm(QString value){start_Km = value;}

    Q_INVOKABLE void set_StartM(QString value){start_M = value;}

    Q_INVOKABLE void set_pickedindex_SiteIDModel(int value){pickedindex_SiteIDModel = value;}

    Q_INVOKABLE void set_pickedindex_Type_Tracks_Model(int value){pickedindex_Type_Tracks_Model = value;}

    Q_INVOKABLE void set_pickedindex_Up_Nom_Model(int value){pickedindex_Up_Nom_Model = value;}

    Q_INVOKABLE void set_pickedindex_Put_Nom_Model(int value){pickedindex_Put_Nom_Model = value;}

private:

    inline static bool flip_card;

    inline static QString start_Km, start_M;

    inline static int pickedindex_SiteIDModel, pickedindex_Type_Tracks_Model, pickedindex_Up_Nom_Model, pickedindex_Put_Nom_Model;


    inline static My_Model *SiteId_Model = &Passport_DB_Lib::siteid_model;

    inline static My_Model *Type_Tracks_Model = &Passport_DB_Lib::type_Tracks_Model;

    inline static My_Model *Up_Nom_Model = &Passport_DB_Lib::up_Nom_Model;

    inline static My_Model *Put_Nom_Model = &Passport_DB_Lib::put_Nom_Model;


    inline static Fragments_Model *My_Fragments_Model = &Passport_DB_Lib::fragments_Model;

    inline static Fragments_Model *My_Picked_Fragments_Model = &Passport_DB_Lib::picked_fragments_Model;



signals:
   void flipCardChanged(const bool &value);
   void string_changed(const QString &value);
   void coordChanged(const QVariantList value);

   void pickedindex_ModelChanged(const int value);
   void model_Changed(const My_Model *value);

   void fragmentModel_Changed(const Fragments_Model *value);

};

#endif // TASK_PAGE_H
