#ifndef CHART_PAGE_H
#define CHART_PAGE_H


#include <QObject>
#include <QDebug>


//#include <QtCharts/QVXYModelMapper>

//#include "models/chartpoints_model.h"

#include "values/moving_values.h"


#include "../Export_Lib/export_lib.h"
#include "../Export_Lib/file/export_db.h"

#include "../Export_Lib/chart/chart_block.h"
#include "../Export_Lib/chart/chart_pick_object.h"


//#include "../Passport_DB_Lib/pages/task_values.h"
#include "../Passport_DB_Lib/task_values/task_km_values.h"

//#include "../Export_Lib/task_values/task_km_values_2.h"
#include "../Passport_DB_Lib/my_database.h"

#include "../Design_Values_Lib/top_bars_and_menu/models/chart_top_bars_models.h"
#include "../Design_Values_Lib/top_bars_and_menu/models/map_models.h"

//#include "../Export_Lib/top_bars_and_menu/models/top_bars_models.h"


class Chart_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Chart_Block* chart_Block MEMBER chart_Block NOTIFY chart_Block_Changed)

    Q_PROPERTY(Chart_Pick_Object* chart_Pick_Object MEMBER chart_Pick_Object NOTIFY chart_Pick_Object_Changed)

    Q_PROPERTY(Moving_Values* moving_Values MEMBER moving_Values NOTIFY moving_Values_Changed)

    Q_PROPERTY(Chart_Top_Bars_Models* top_Bars_Models MEMBER top_Bars_Models NOTIFY top_Bars_Models_Changed)

    Q_PROPERTY(Map_Models* map_top_Bars_Models MEMBER map_top_Bars_Models NOTIFY map_top_Bars_Models_Changed)


public:

    inline explicit Chart_Page(QObject *parent = nullptr) : QObject(parent) {

        if(!first_check){

            //chart_Block->get_Task_Values()->set_Road_Values("Московская", 17, "Москва-Ярославль", 10101, 1, "Главный");

            first_check = true;

        }


        //connect(top_Bars_Models, &Top_Bars_Models::menu_Model_Element_Clicked, this, &Chart_Page::slot_m);


      //  connect(top_Bars_Models->get_Menu_Model(Top_Bars::Zoom_Model_Index), &Menu_Model::dataChanged, this, &Chart_Page::slot_w);



        connect(chart_Block->get_Chart_Km_Values(), &Chart_Km_Values::riht_Values_Changed, this, &Chart_Page::add_One_Riht_In_UI);

        connect(moving_Values, &Moving_Values::playChart_Changed, this, &Chart_Page::play_Changed);



        connect(chart_Block, &Chart_Block::new_Line_Signal, this, &Chart_Page::slot_Length_Changed);

        connect(chart_Block, &Chart_Block::new_Area_Signal, this, &Chart_Page::slot_Add_New_Area);

        connect(chart_Block, &Chart_Block::add_New_Km_Signal, this, &Chart_Page::slot_add_New_Km);




        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::Level_Measure), &Chart_Lines_Values::new_Moving_Signal, this, &Chart_Page::slot_Add_New_Moving);



        connect(chart_Block, &Chart_Block::new_BackLine_Signal, this, &Chart_Page::slot_Add_New_BackLine);

        connect(chart_Block->get_Chart_Speed_Values(), &Chart_Speed_Values::new_SpeedLine_Signal, this, &Chart_Page::slot_Add_New_Speed);




        connect(chart_Block->get_Chart_Km_Values(), &Chart_Km_Values::remove_Fisrst_Km_Signal, this, &Chart_Page::slot_Remove_Fisrst_Km);

     //   connect(chart_Pick_Object, &Chart_Top_Bars_Models::end_Route_Signal, this, &Chart_Page::slot_Open_Dialog);




        connect(top_Bars_Models, &Chart_Top_Bars_Models::grid_View_Changed, this, &Chart_Page::slot_change_Grid_View);

        connect(top_Bars_Models, &Chart_Top_Bars_Models::markTable_View_Changed, this, &Chart_Page::slot_change_MarkTable_View);

        connect(top_Bars_Models, &Chart_Top_Bars_Models::additionalMeasure_View_Changed, this, &Chart_Page::slot_change_AdditionalMeasure_View);


        connect(top_Bars_Models, &Chart_Top_Bars_Models::end_Route_Signal, this, &Chart_Page::slot_Open_Dialog);


        connect(chart_Pick_Object, &Chart_Pick_Object::add_New_Object_Signal, this, &Chart_Page::slot_add_New_Object);





    }

    Q_INVOKABLE void set_New_Km(QString name, int finish_y, int sleepers_Type, int picket_position) {

        QList<My_Pdf_Info*> list = {  test_get_My_Pdf_Info(43, "Октябрьская", 1, 1000),
                                     // test_get_My_Pdf_Info(12, "Северная", 18, 600),
                                     // test_get_My_Pdf_Info(8, "Московская", 11, 600),

                                   };

        // test_get_My_Pdf_Info(43, "Октябрьская", 1, 600)

        chart_Block->add_New_Km_List(list);

       // chart_Block->get_Chart_Km_Values()->add_New_Km_List(list);

       // emit chart_Km_Values_Changed(chart_Block->get_Chart_Km_Values());
    }

    Q_INVOKABLE void set_New_Area() {


       /* chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_2_Area, 100, 200,
                                                                                             Type_Picket_Position::Pickets_Descending,
                                                                                             0,
                                                                                             600
                                                                                             ); */

       chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_2_Area, 100, 200, Type_Picket_Position::Pickets_Ascending, 0, 0);

       chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_3_Area, 450, 500, Type_Picket_Position::Pickets_Ascending, 0, 0);

       chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_4_Area, 550, 700, Type_Picket_Position::Pickets_Ascending, 0, 0);
    }

    Q_INVOKABLE void set_New_Speed(int type, float value) {


    }


    Q_INVOKABLE void remove_First_Km() {

        chart_Block->remove_First_Km();
    }

    Q_INVOKABLE void get_DB_Line() {

        //chart_Block->add_New_Km_List(test_get_My_Pdf_Info());


       //My_Pdf_Info my_Pdf_Info = Task_Km_Values::get_My_Pdf_Info_List().at(0);



       chart_Block->add_New_Km_List(Task_Km_Values::get_My_Pdf_Info_List());


    }

    Q_INVOKABLE void add_Pdf_Info() {

        My_Pdf_Info *my_Pdf_Info = Task_Km_Values::get_My_Pdf_Info_List().at(0);


        Export_DB export_DB(Export_Lib::db_path);


        General_Info *general_Info = new General_Info(1.0,
                                                     "2022-10-03",
                                                     "436/р",
                                                     "МДК: МДК-498",
                                                     "Анциферов И.Н.",
                                                     "2022-12-12",
                                                     "Прямой",
                                                     "Базовая",
                                                     "Рабочая",
                                                     "2023-04-12",
                                                     1);

        export_DB.addNew_GeneralInfo(general_Info);

        for(int i = 0; i < QMetaEnum::fromType<Name_Measures::Measures>().keyCount(); i++){

            export_DB.addNew_Params(add_New_CheckMeasure(i));
        }


        Mark_Info *mark_Info = new Mark_Info(20, 2, 5, 15, 14, 7, "Пред: -КрдПЧ");

        export_DB.addNew_Mark_Info(mark_Info, 1);

        export_DB.addNew_My_Pdf_Info(*my_Pdf_Info);

        Export_Lib::createPDF();

    }

    Params add_New_CheckMeasure(int index){

        QPair<float, float> borders = Correct_Points::get_Borders(index);

        qDebug() << "index = " + QString::number(borders.first);

        int offset = Correct_Points::get_Offset(index);

        int multi = Correct_Points::get_Multi(index);

        return Params(index, offset, multi, borders.first, borders.second, Correct_Points::get_null_Line_X(index));

    }



   /* Q_INVOKABLE void open_file() {

        Export_DB export_DB(Export_Lib::db_path);

        chart_Block->add_New_Km_List(export_DB.get_My_Pdf_Info());

        emit chart_Km_Values_Changed(chart_Block->get_Chart_Km_Values());



    }*/

    Q_INVOKABLE void tmp_func() {

       // Task_Km_Values *a = new Task_Km_Values();

        //Task_Km_Values::get_task_km_values("Октябрьская (1)", "СПб [Обухово]-Мурманск (15101)", "2 (Главный)", 124, 0);

        //Task_Km_Values_Export::set_Isolated_Junction(Task_Km_Values::get_query_Isolated_Junction(1, 15101, 2, 124, 0));

        //Task_Km_Values_2 a; // = new Task_Km_Values_2("Октябрьская (1)", "СПб [Обухово]-Мурманск (15101)", "2 (Главный)", 124, 0, My_Database::get_db());

        //QSqlDatabase &_my_Database = My_Database::get_db();
      //  Task_Km_Values_2::get_task_km_values("Октябрьская (1)", "СПб [Обухово]-Мурманск (15101)", "2 (Главный)", 124, 0,
              //                               _my_Database);

        get_DB_Line();
    }


   // inline static float y_0 = 0, y_1 = 0, y_2 = 0, y_3 = 0, y_4 = 0, y_5 = 0;

    static void add_Point_Measure(int index, float value, bool isForwardMoving){

        // Тестовый обыгрыш (поймали пропуск)
        if(index == Name_Measures::Level_Measure && value == -5000){

            chart_Block->add_Measure_Point_Step_2(index, SubTypes_Line::Null_Line, 0, QPoint(0, 0));

        }
        else{

            if(Chart_Page::get_Moving_Values()->get_isPlay_Chart()){

                chart_Block->add_Measure_Point_Step_1(index, value, isForwardMoving);


            }
        }


    }

    static Moving_Values* get_Moving_Values(){

        return moving_Values;
    }

private:

    //inline static Defect_Model *My_Defect_Model = &Export_Lib::defect_Model;

    //inline static Km_Mark_Model *My_Km_Mark_Model = &Export_Lib::km_Mark_Model;


    inline static Chart_Block *chart_Block = new Chart_Block;

    inline static Chart_Pick_Object *chart_Pick_Object = new Chart_Pick_Object;

    inline static Moving_Values *moving_Values = new Moving_Values;


    inline static Chart_Top_Bars_Models *top_Bars_Models = new Chart_Top_Bars_Models;

    inline static Map_Models *map_top_Bars_Models = new Map_Models;



    inline static bool first_check = false;






    My_Pdf_Info* test_get_My_Pdf_Info(int num_km, QString name_SiteId, int site_Id, int distance){

        QList<Sleepers> sleepers_List = {Sleepers(Type_Sleepers::Wood, 0, 300),
                                        Sleepers(Type_Sleepers::Reinforced_Concrete, 300, distance)
                                        };

        QList<Km_Help_Line> help_Line_List;
        QList<Km_Help_Line> earth_Line_List;

        QList<Km_Help_Line>  сompensation_Line_List = {Km_Help_Line(400, 412)

                                                  };
        QList<Bridge> bridge_List = {
                                      Bridge(300, 350),
                                     // Bridge(50, 100)
                                    };

        QList<Arrow> arrow_List = { Arrow(Type_Arrows::Bottom_left, 250, 50, false, false, "6a"),
                                   // Arrow(Type_Arrows::Bottom_right, 360, 50, false, true, "56"),

                                  //  Arrow(Type_Arrows::Double, 300, true, false, 202),
                                    //Arrow(Type_Arrows::Double, 500, true, true), */

                                   // Arrow(Type_Arrows::Double, 200, 40, false, true, "33"),
                                   // Arrow(Type_Arrows::Double, 550, true, true),

                                  //  Arrow(Type_Arrows::Double, 500, true, false),
                                 //   Arrow(Type_Arrows::Top_right, 440, 0, false, true, "4"),
                                   //Arrow(Type_Arrows::Top_left, 550, 50, false, true, "44")

                                  };


        QList<Km_Help_Line>  railRoad_List = {//Km_Help_Line(200, 210),
                                                 Km_Help_Line(500, 515)

                                                  };

        QList<Chart_Object> chart_Object_List = { //Chart_Object(Type_Object::End_Of_The_Road, 500),
                                                  //Chart_Object(Type_Object::Path_Boundary, 300)

                                                 // Chart_Object(Type_Object::Km_Pillar, 300),

                                                 //  Chart_Object(Type_Object::Km_Mark, 500),

                                                  /*Chart_Object(Type_Object::Km_Pillar, 200),

                                                  Chart_Object(Type_Object::Km_Pillar, 250),
                                                   Chart_Object(Type_Object::Km_Mark, 280) */



                                                };

        QList<Measure_Lines> measure_Lines_List;

        Km_Info *km_Info = new Km_Info(site_Id, //0,
                                       name_SiteId, //"Октябрьская",
                                       "Николаевская ветвь", // направление
                                       10431,
                                       1,
                                       "Главный",
                                       /*22,
                                       43,
                                       22,
                                       11,
                                       70,
                                       80, */
                                       num_km,// 43,
                                       distance, //600,
                                       Types_Picket_Position::Pickets_Ascending,
                                        {"Ромашково", "Васильково"});

        Pch_Info *pch_Info = new Pch_Info(22, 43, 11, 2);

        QList<Km_Help_Line> speed_PassTrain = {Km_Help_Line(0, 300, 80),
                                                  Km_Help_Line(300, distance, 120)

                                                 };

        QList<Km_Help_Line> speed_FreightTrain = {Km_Help_Line(0, distance, 40),
                                                  //Km_Help_Line(300, 500, 60)

                                                 };

        Speed_Info *speed_Info = new Speed_Info(speed_PassTrain, speed_FreightTrain, {},{},{},{},{});

        My_Pdf_Info *my_Pdf_Info = new My_Pdf_Info(
                    km_Info,
                    pch_Info,
                    speed_Info,
                    sleepers_List,
                    bridge_List,
                    arrow_List,
                    chart_Object_List,
                    help_Line_List,
                    earth_Line_List,
                    сompensation_Line_List,
                    railRoad_List,
                    measure_Lines_List
                    );

        return my_Pdf_Info;
    }

    void add_One_Riht_In_UI(){

        emit new_Riht_Signal();
    }

    void play_Changed(){

        emit playChart_Changed(Moving_Values::isPlay_Chart);
    }

    void slot_Length_Changed(int index_measure, int index_list, int subType){

       //qDebug() << "eeeeeeeeeeeeeeeee " + QString::number(index_measure);
       //qDebug() << "eeeeeeeeeeeeeeeee " + QString::number(index_list);

       // qDebug() << "eeeeeeeeeeeeeeeee " + QString::number(subType);

     //   value22;
        emit new_Line_Signal(index_measure, index_list, subType);
    }


    void slot_Add_New_Area(int index){emit new_Area_Signal(index);}

    void slot_Add_New_BackLine(int index, int index_list){emit new_BackLine_Signal(index, index_list);}

    void slot_Add_New_Moving(int value){emit new_Moving_Signal(value);}

    void slot_Add_New_Speed(int index){emit new_SpeedLine_Signal(index);}

    void slot_Remove_Fisrst_Km(){emit remove_Fisrst_Km_Signal();}

    void slot_add_New_Km(){


      //  qDebug() << "eeeeeeeeeeeeeeeeeeeee88888888";

        emit chart_Km_Values_Changed(



                    chart_Block->get_Chart_Km_Values());}


    void slot_change_Grid_View(bool value){ emit grid_View_Changed(value);}

    void slot_change_MarkTable_View(bool value){ emit markTable_View_Changed(value);}

    void slot_change_AdditionalMeasure_View(bool value){ emit additionalMeasure_View_Changed(value);}

    void slot_Open_Dialog(){ emit open_Dialog_Signal();}

    void slot_add_New_Object(const User_Objects *user_Objects){

        qDebug() << "Новый объект = " + user_Objects->get_note_text();

        Export_DB export_DB(Export_Lib::db_path);

        export_DB.addNew_UserObject(user_Objects, 0);
    }

signals:


   void chart_Block_Changed(const Chart_Block *value);

   void chart_Pick_Object_Changed(const Chart_Pick_Object *value);


   void moving_Values_Changed(const Moving_Values *value);


   void top_Bars_Models_Changed(const Chart_Top_Bars_Models *value);

   void map_top_Bars_Models_Changed(const Map_Models *value);


   void chart_Km_Values_Changed(const Chart_Km_Values *value);

   void new_Riht_Signal();

   void playChart_Changed(const bool play);

   void new_Line_Signal(const int index, const int index_list, const int subType);

   void new_Area_Signal(const int index);

   void new_BackLine_Signal(const int index, const int index_list);

   void new_Moving_Signal(const int value);

   void new_SpeedLine_Signal(const int type);

   void remove_Fisrst_Km_Signal();





   void grid_View_Changed(const bool value);

   void markTable_View_Changed(const bool value);

   void additionalMeasure_View_Changed(const bool value);


   void open_Dialog_Signal();

};

#endif // CHART_PAGE_H
