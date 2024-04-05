#ifndef CHART_PAGE_H
#define CHART_PAGE_H


#include <QObject>
#include <QDebug>


//#include <QtCharts/QVXYModelMapper>

//#include "models/chartpoints_model.h"

#include "values/moving_values.h"

/*#include "values/chart_lines_values.h"
#include "values/measure_values.h"
#include "values/chart_km_values.h"
#include "values/chart_objects_values.h" */

#include "../Export_Lib/export_lib.h"
#include "../Export_Lib/chart/chart_block.h"

#include "../Passport_DB_Lib/pages/task_values.h"


class Chart_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Defect_Model* My_Defect_Model MEMBER My_Defect_Model NOTIFY defectModel_Changed)

    Q_PROPERTY(Km_Mark_Model* My_Km_Mark_Model MEMBER My_Km_Mark_Model NOTIFY kmMarkModel_Changed)


    Q_PROPERTY(Chart_Block* chart_Block MEMBER chart_Block NOTIFY chart_Block_Changed)


    Q_PROPERTY(Moving_Values* moving_Values MEMBER moving_Values NOTIFY moving_Values_Changed)

    Q_PROPERTY(Task_Values* task_Values MEMBER task_Values NOTIFY moving_Values_Changed)


public:

    inline explicit Chart_Page(QObject *parent = nullptr) : QObject(parent) {

        if(!first_check){

            task_Values->set_SiteId("Московская", 17);

            task_Values->set_UpNom("Москва-Ярославль", 10101);

            task_Values->set_PutNom(1, "Главный");

            first_check = true;

        }

        connect(chart_Block->get_Chart_Km_Values(), &Chart_Km_Values::riht_Values_Changed, this, &Chart_Page::add_One_Riht_In_UI);

        connect(moving_Values, &Moving_Values::playChart_Changed, this, &Chart_Page::play_Changed);


        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::Level_Measure), &Chart_Lines_Values::length_Measure_List_Changed, this, &Chart_Page::newLength_Changed);

        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure), &Chart_Lines_Values::length_Measure_List_Changed, this, &Chart_Page::newLength_Changed);


        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure), &Chart_Lines_Values::new_area_Signal, this, &Chart_Page::slot_Add_New_Area);




        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::Level_Measure), &Chart_Lines_Values::new_Moving_Signal, this, &Chart_Page::slot_Add_New_Moving);



        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::Level_Measure), &Chart_Lines_Values::new_backLine_Signal, this, &Chart_Page::slot_Add_New_BackLine);

        connect(chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure), &Chart_Lines_Values::new_backLine_Signal, this, &Chart_Page::slot_Add_New_BackLine);


        connect(chart_Block->get_Chart_Speed_Values(), &Chart_Speed_Values::new_SpeedLine_Signal, this, &Chart_Page::slot_Add_New_Speed);

    }

    Q_INVOKABLE void set_New_Km(QString name, int finish_y, int sleepers_Type, int reverse) {

        chart_Block->get_Chart_Km_Values()->add_New_Km(name, finish_y, sleepers_Type, reverse);

        emit chart_Km_Values_Changed(chart_Block->get_Chart_Km_Values());
    }

    Q_INVOKABLE void set_New_Area() {

        chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_2_Area, 300, 400);

        chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_3_Area, 450, 500);

        chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_New_Area(Type_Areas::Extent_4_Area, 550, 700);
    }

    Q_INVOKABLE void set_New_Speed(int type, float value) {

        chart_Block->get_Chart_Speed_Values()->add_New_Line(type, value, 300, 500);

    }

    inline static float y_0 = 0, y_1 = 0, y_2 = 0, y_3 = 0, y_4 = 0, y_5 = 0;

    // Вообще тут будет цепляться одометр но пока тестово
    static void add_Point(int index, int subType, float border_value, QPointF point){

        switch(index){

        case Name_Measures::Level_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Level_Measure)->add_NewPoint(subType, border_value, QPoint(point.x(), y_0));

            y_0 += step_Chart;

            break;

        case Name_Measures::Riht_Left_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Riht_Left_Measure)->add_NewPoint(subType, border_value, QPoint(point.x(), y_1));

            y_1 += step_Chart;

            break;

        case Name_Measures::Riht_Right_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Riht_Right_Measure)->add_NewPoint(subType, border_value, QPoint(point.x(), y_2));

            chart_Block->get_Chart_Km_Values()->add_One_Riht(point.x(), step_Chart);

            y_2 += step_Chart;

            break;

        case Name_Measures::WidthTrack_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->add_NewPoint(subType, border_value, QPoint(point.x(), y_3));

            y_3 += step_Chart;

            break;

        case Name_Measures::Down_Left_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Down_Left_Measure)->add_NewPoint(subType, border_value, QPoint(point.x(), y_4));

            y_4 += step_Chart;

            break;

        case Name_Measures::Down_Right_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Down_Right_Measure)->add_NewPoint(subType, border_value, QPoint(point.x(), y_5));

            y_5 += step_Chart;

            break;

        }
    }


    static void remove_Point(int index){

        switch(index){

        case Name_Measures::Level_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Level_Measure)->remove_lastPoint();

            y_0 -= step_Chart;

            break;

        case Name_Measures::Riht_Left_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Riht_Left_Measure)->remove_lastPoint();

            y_1 -= step_Chart;

            break;

        case Name_Measures::Riht_Right_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Riht_Right_Measure)->remove_lastPoint();

            chart_Block->get_Chart_Km_Values()->remove_One_Riht(step_Chart);

            y_2 -= step_Chart;

            break;

        case Name_Measures::WidthTrack_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::WidthTrack_Measure)->remove_lastPoint();

            y_3 -= step_Chart;

            break;

        case Name_Measures::Down_Left_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Down_Left_Measure)->remove_lastPoint();

            y_4 -= step_Chart;

            break;

        case Name_Measures::Down_Right_Measure:

            chart_Block->get_Chart_Lines_Values(Name_Measures::Down_Right_Measure)->remove_lastPoint();

            y_5 -= step_Chart;

            break;

        }
    }

    static Moving_Values* get_Moving_Values(){

        return moving_Values;
    }

private:

    inline static Defect_Model *My_Defect_Model = &Export_Lib::defect_Model;

    inline static Km_Mark_Model *My_Km_Mark_Model = &Export_Lib::km_Mark_Model;


    inline static Chart_Block *chart_Block = new Chart_Block;

    inline static Moving_Values *moving_Values = new Moving_Values;

    inline static Task_Values *task_Values = new Task_Values;



    inline static float step_Chart = 0.5;

    inline static bool first_check = false;



    void add_One_Riht_In_UI(){

        emit new_Riht_Signal();
    }

    void play_Changed(){

        emit playChart_Changed(Moving_Values::isPlay_Chart);
    }

    void newLength_Changed(int index_measure, int index_list, int subType){

        qDebug() << "eeeeeeeeeeeeeeeee " + QString::number(index_measure);
        qDebug() << "eeeeeeeeeeeeeeeee " + QString::number(index_list);

        qDebug() << "eeeeeeeeeeeeeeeee " + QString::number(subType);

     //   value22;
        emit new_Line_Signal(index_measure, index_list, subType);
    }


    void slot_Add_New_Area(){emit new_Area_Signal();}

    void slot_Add_New_BackLine(int index, int index_list){emit new_BackLine_Signal(index, index_list);}

    void slot_Add_New_Moving(int value){emit new_Moving_Signal(value);}

    void slot_Add_New_Speed(int index){emit new_SpeedLine_Signal(index);}

signals:

   void defectModel_Changed(const Defect_Model *value);
   void kmMarkModel_Changed(const Km_Mark_Model *value);


   void chart_Block_Changed(const Chart_Block *value);


   void moving_Values_Changed(const Moving_Values *value);

   void task_Values_Changed(const Task_Values *value);


   void chart_Km_Values_Changed(const Chart_Km_Values *value);

   void new_Riht_Signal();

   void playChart_Changed(const bool play);

   void new_Line_Signal(const int index, const int index_list, const int subType);

   void new_Area_Signal();

   void new_BackLine_Signal(const int index, const int index_list);

   void new_Moving_Signal(const int value);

   void new_SpeedLine_Signal(const int type);

};

#endif // CHART_PAGE_H
