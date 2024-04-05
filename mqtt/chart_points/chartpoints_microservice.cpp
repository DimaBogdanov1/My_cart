#include "chartpoints_microservice.h"
#include "mqtt/mqtt_help.h"

#include "pages/chart_page.h"

#include "mqtt/chart_points/riht/calculate_riht.h"
#include "mqtt/chart_points/down/calculate_down.h"


//#include "mqtt/task/task_data.h"
//#include "mqtt/task/task_microservice.h"


#include "pages/values/moving_values.h"
#include "pages/values/map_values.h"

#include "../Export_Lib/export_lib.h"



ChartPoints_Microservice::ChartPoints_Microservice()
{

    //chart_Page = new Chart_Page();


     //Export_DB export_db(Export_Lib::db_path);

   // export_db = new Export_DB(Export_Lib::db_path);
}

void ChartPoints_Microservice::add_Command(int num, const QByteArray &message){

    switch(num){

    case Name_Measures::Level_Measure:

        add_Level(num, message);

        break;

    case Name_Measures::WidthTrack_Measure:

        add_Sample(num, message);

        break;

    case Name_Measures::Side_Damage_Measure:

        add_Side_Damage_Measure(num, message);

        break;

    case Name_Measures::Vertical_Damage_Measure:

        add_Vertical_Damage_Measure(num, message);

        break;

    case Name_Measures::Bowing_Measure:

        add_Bowing_Measure(num, message);

        break;

    case Name_Measures::Rolling_Surface_Measure:

        add_Rolling_Surface_Measure(num, message);

        break;

    }
}

void ChartPoints_Microservice::add_Level(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"level", "odo"});

    check_Point(index, list_values.at(0), check_Forward(list_values.at(1)));


}

void ChartPoints_Microservice::add_Sample(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"widthTrack", "odo", "move_horizontal_left", "move_horizontal_right"});


    bool isForward = check_Forward(list_values.at(1));


    check_Point(index, list_values.at(0), isForward);


    Calculate_Riht::add_Riht(list_values.at(1), list_values.at(2), list_values.at(3), Map_Values::yaw_value, isForward);



    double move_vertical_left = 1;

    double move_vertical_right = 1;

    Calculate_Down::add_Down(list_values.at(1), move_vertical_left, move_vertical_right, Map_Values::pitch_value, isForward);




}


void ChartPoints_Microservice::add_Side_Damage_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"sideDamage_Left", "sideDamage_Right"});

    check_Point(index, list_values.at(0), true);

    check_Point(index + 1, list_values.at(1), true);

}

void ChartPoints_Microservice::add_Vertical_Damage_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"verticalDamage"});

    check_Point(index, list_values.at(0), true);

}

void ChartPoints_Microservice::add_Bowing_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"bowing"});

    check_Point(index, list_values.at(0), true);

}

void ChartPoints_Microservice::add_Rolling_Surface_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"rollingSurface"});

    check_Point(index, list_values.at(0), true);

}


bool ChartPoints_Microservice::check_Forward(float value){

    bool moving = true;

    if(value <= Moving_Values::odometer_value){

        moving = false;

    }

    Moving_Values::odometer_value = value;


   // Task_Microservice z(m_pointer);

   // z.add_TaskValues(value);


    //QPair<bool, QPair<QString, QString>> station = Task_Values::get_Station(value);



    return moving;
}


void ChartPoints_Microservice::check_Point(int index, float value, bool isForwardMoving){

    // Тестовый обыгрыш (поймали пропуск)
    if(index == Name_Measures::Level_Measure && value == -5000){

        qDebug() << "ПРОПУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУСК";

        Chart_Page::add_Point(index, SubTypes_Line::Null_Line, 0, QPoint(0, 0));

    }
    else{

        Chart_Point chart_Point = Correct_Points::check_Point(index, value);


        //Chart_Page *chart_Page = new Chart_Page();

        if(Chart_Page::get_Moving_Values()->get_isPlay_Chart()){ // Sensors_Values::isPlay_Chart


            if(isForwardMoving){

                int sub_TypeLine;

                if(chart_Point.get_is_Correct()){

                    sub_TypeLine = SubTypes_Line::Correct_Line;

                }
                else{

                    sub_TypeLine = SubTypes_Line::Error_Line;

                }

                Chart_Page::add_Point(index, sub_TypeLine, chart_Point.get_Border_Value(), QPoint(chart_Point.get_Value(), 0));


            }
            else{

                Chart_Page::remove_Point(index);

                qDebug() << "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
            }



            //Export_Lib::addPoints_To_File(index, pair.second, Sensors_Values::odometer_value);


            //Export_DB export_db(Export_Lib::db_path);

            //export_db.insertPoint(index, chart_Point.get_Value(), 0);




            //Export_Microservice::add_PointsInFile(index, pair.second, Sensors_Values::odometer_value);

        }
    }






}
