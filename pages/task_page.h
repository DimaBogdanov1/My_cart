#ifndef TASK_PAGE_H
#define TASK_PAGE_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>

#include "../Passport_DB_Lib/passport_db_lib.h"
#include "../Passport_DB_Lib/fragments/fragments.h"

class Task_Page : public QObject, public Passport_DB_Lib
{
    Q_OBJECT

    Q_PROPERTY(bool flip_card MEMBER flip_card WRITE set_FlipCard NOTIFY flipCardChanged)

    Q_PROPERTY(QString schemePath MEMBER schemePath WRITE set_SchemePath NOTIFY string_changed)

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



    Q_PROPERTY(Sort_Model* My_Sort_Fragments_Model MEMBER My_Sort_Fragments_Model NOTIFY fragmentSort_Model_Changed)

    //Q_PROPERTY(Fragments_Model* My_Fragments_Model MEMBER My_Fragments_Model NOTIFY fragmentModel_Changed)

    Q_PROPERTY(Fragments_Model* My_Picked_Fragments_Model MEMBER My_Picked_Fragments_Model NOTIFY fragmentModel_Changed)

public:

    inline explicit Task_Page(QObject *parent = nullptr) : QObject(parent) {

        Passport_DB_Lib::get_SiteID();

       // Fragments::get_Fragments(1, 14601, 1);
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

    Q_INVOKABLE void set_Filter(int km, int m,  bool isForward_Moving){

        Fragments::fragments_sort_Model.filterselect(Filter(true, km, m, isForward_Moving));

        Fragments::fragments_sort_Model.setStatus(true);
    }


    Q_INVOKABLE void set_Fragments(QString name_siteId, QString name_upNom, QString name_putNom, bool isForwardMoving){

        Fragments::get_Fragments(name_siteId, name_upNom, name_putNom, isForwardMoving);
    }

    Q_INVOKABLE void add_PickedFragment(int index_row, bool isForward_Moving){

        QModelIndex index = My_Sort_Fragments_Model->index(index_row, 0);

        int nomArrow = My_Sort_Fragments_Model->data(index, Fragments_Model::nomArrowRole).value<int>();

        int km = My_Sort_Fragments_Model->data(index, Fragments_Model::kmRole).value<int>();

        int m = My_Sort_Fragments_Model->data(index, Fragments_Model::mRole).value<int>();

        QString name = My_Sort_Fragments_Model->data(index, Fragments_Model::nameRole).value<QString>();


        My_Picked_Fragments_Model->addFragment("name_siteId", "name_upNom", "name_putNom", true, nomArrow, km, m, name);


        //qDebug() << "Picked nomArrow = " + QString::number(nomArrow) + " Picked km = " + QString::number(km) + " Picked m = " + QString::number(m);


        set_Filter(km, m, isForward_Moving);

      //  Fragments::fragments_sort_Model.filterselect(Filter(true, km, m, isForward_Moving));

        //Fragments::fragments_sort_Model.setStatus(true);








        qDebug() << "\n" << "\n" ;

        for(int i = 0; i < My_Picked_Fragments_Model->rowCount(); i++){

            QModelIndex index = My_Picked_Fragments_Model->index(i, 0);

            int nomArrow = My_Picked_Fragments_Model->data(index, Fragments_Model::nomArrowRole).value<int>();

            int km = My_Picked_Fragments_Model->data(index, Fragments_Model::kmRole).value<int>();

            int m = My_Picked_Fragments_Model->data(index, Fragments_Model::mRole).value<int>();




            qDebug() << "i = " + QString::number(i)  +  " NEw nomArrow = " + QString::number(nomArrow) + " NEw km = " + QString::number(km) + " NEw m = " + QString::number(m);

        }
    }


    Q_INVOKABLE void remove_PickedFragment(int index_row, bool isForward_Moving){

        qDebug() << "\n" << "\n" ;

        if(0 < index_row){

            qDebug() << "index = " + QString::number(index_row);

            int last_index = --index_row;

            qDebug() << "Last index = " + QString::number(last_index);

            QModelIndex index = My_Picked_Fragments_Model->index(last_index, 0);

            int nomArrow = My_Picked_Fragments_Model->data(index, Fragments_Model::nomArrowRole).value<int>();

            int km = My_Picked_Fragments_Model->data(index, Fragments_Model::kmRole).value<int>();

            int m = My_Picked_Fragments_Model->data(index, Fragments_Model::mRole).value<int>();


            for(int i = 0; i < My_Picked_Fragments_Model->rowCount(); i++){

                QModelIndex index = My_Picked_Fragments_Model->index(i, 0);

                int nomArrow = My_Picked_Fragments_Model->data(index, Fragments_Model::nomArrowRole).value<int>();

                int km = My_Picked_Fragments_Model->data(index, Fragments_Model::kmRole).value<int>();

                int m = My_Picked_Fragments_Model->data(index, Fragments_Model::mRole).value<int>();

                qDebug() << "i = " + QString::number(i)  +  " Last nomArrow = " + QString::number(nomArrow) + " Last km = " + QString::number(km) + " Last m = " + QString::number(m);

            }



            Fragments::fragments_sort_Model.filterselect(Filter(true, km, m, isForward_Moving));

            Fragments::fragments_sort_Model.setStatus(true);
        }


        My_Picked_Fragments_Model->removeFragment(index_row);


        qDebug() << "\n" << "\n" ;

         qDebug() << "STEP 2"  ;
        for(int i = 0; i < My_Picked_Fragments_Model->rowCount(); i++){

            QModelIndex index = My_Picked_Fragments_Model->index(i, 0);

            int nomArrow = My_Picked_Fragments_Model->data(index, Fragments_Model::nomArrowRole).value<int>();

            int km = My_Picked_Fragments_Model->data(index, Fragments_Model::kmRole).value<int>();

            int m = My_Picked_Fragments_Model->data(index, Fragments_Model::mRole).value<int>();

            qDebug() << "i = " + QString::number(i)  +  " Last nomArrow = " + QString::number(nomArrow) + " Last km = " + QString::number(km) + " Last m = " + QString::number(m);

        }

    }


    Q_INVOKABLE void set_FlipCard(bool value){flip_card = value; emit flipCardChanged(value);}

    Q_INVOKABLE void set_SchemePath(QString value){schemePath = value;}

    Q_INVOKABLE void set_StartKm(QString value){start_Km = value;}

    Q_INVOKABLE void set_StartM(QString value){start_M = value;}

    Q_INVOKABLE void set_pickedindex_SiteIDModel(int value){pickedindex_SiteIDModel = value;}

    Q_INVOKABLE void set_pickedindex_Type_Tracks_Model(int value){pickedindex_Type_Tracks_Model = value;}

    Q_INVOKABLE void set_pickedindex_Up_Nom_Model(int value){pickedindex_Up_Nom_Model = value;}

    Q_INVOKABLE void set_pickedindex_Put_Nom_Model(int value){pickedindex_Put_Nom_Model = value;}

private:

    inline static bool flip_card;

    inline static QString start_Km, start_M;

    inline static QString schemePath;

    inline static int pickedindex_SiteIDModel, pickedindex_Type_Tracks_Model, pickedindex_Up_Nom_Model, pickedindex_Put_Nom_Model;


    inline static My_Model *SiteId_Model = &Passport_DB_Lib::siteid_model;

    inline static My_Model *Type_Tracks_Model = &Passport_DB_Lib::type_Tracks_Model;

    inline static My_Model *Up_Nom_Model = &Passport_DB_Lib::up_Nom_Model;

    inline static My_Model *Put_Nom_Model = &Passport_DB_Lib::put_Nom_Model;


    inline static Sort_Model *My_Sort_Fragments_Model = &Fragments::fragments_sort_Model;

    inline static Fragments_Model *My_Fragments_Model = Fragments::fragments_Model;

    inline static Fragments_Model *My_Picked_Fragments_Model = &Fragments::picked_fragments_Model;



signals:
   void flipCardChanged(const bool &value);
   void string_changed(const QString &value);
   void coordChanged(const QVariantList value);

   void pickedindex_ModelChanged(const int value);
   void model_Changed(const My_Model *value);

   void fragmentSort_Model_Changed(const Sort_Model *value);

   void fragmentModel_Changed(const Fragments_Model *value);

};

#endif // TASK_PAGE_H
