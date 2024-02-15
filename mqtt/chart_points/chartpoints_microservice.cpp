#include "chartpoints_microservice.h"
#include "mqtt/mqtt_client.h"
#include "mqtt/sensors/sensors_values.h"
#include "mqtt/mqtt_help.h"

#include "mqtt/chart_points/name_measures.h"
#include "mqtt/chart_points/correct_points.h"
#include "mqtt/chart_points/riht/calculate_riht.h"
#include "mqtt/chart_points/down/calculate_down.h"
#include "mqtt/task/task_data.h"
#include "mqtt/task/task_microservice.h"

#include "mqtt/export_microservice.h"

ChartPoints_Microservice::ChartPoints_Microservice(MQTT_Client *pointer)
{

    m_pointer = pointer;

}

void ChartPoints_Microservice::add_Command(int num, const QByteArray &message){

    switch(num){

    case Name_Measures::Level_Measure:

        add_Level(num, message);

        break;

    case Name_Measures::Sample_Measure:

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

    if(check_Forward(list_values.at(1))){

        check_Point(index, list_values.at(0));

    }
}

void ChartPoints_Microservice::add_Sample(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"widthTrack", "odo", "move_horizontal_left", "move_horizontal_right"});


    if(check_Forward(list_values.at(1))){

        check_Point(index, list_values.at(0));


        Calculate_Riht::add_Riht(list_values.at(1), list_values.at(2), list_values.at(3), Sensors_Values::yaw_value);



        double move_vertical_left = 1;

        double move_vertical_right = 1;

        Calculate_Down::add_Down(list_values.at(1), move_vertical_left, move_vertical_right, Sensors_Values::pitch_value);

    }


}


void ChartPoints_Microservice::add_Side_Damage_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"sideDamage_Left", "sideDamage_Right"});

    check_Point(index, list_values.at(0));

    check_Point(index + 1, list_values.at(1));

}

void ChartPoints_Microservice::add_Vertical_Damage_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"verticalDamage"});

    check_Point(index, list_values.at(0));

}

void ChartPoints_Microservice::add_Bowing_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"bowing"});

    check_Point(index, list_values.at(0));

}

void ChartPoints_Microservice::add_Rolling_Surface_Measure(int index, const QByteArray &message){

    QList<double> list_values = MQTT_Help::getValueFrom_JSON(message, QList<QString> {"rollingSurface"});

    check_Point(index, list_values.at(0));

}


void ChartPoints_Microservice::check_Signal_Forward(bool forwardCheck){

    bool isForward = Sensors_Values::forward;

    if(!forwardCheck){

        isForward = !isForward;
    }

    if(!isForward){

        emit m_pointer->newDirection_movement_signal(isForward);

        Sensors_Values::forward = isForward;
    }

}

bool ChartPoints_Microservice::check_Forward(float value){

    bool moving = true;

    if(Sensors_Values::odometer_value < value){

      //  check_Signal_Forward(true);

        if(!Sensors_Values::forward){

            emit m_pointer->newDirection_movement_signal(true);

            Sensors_Values::forward = true;

        }
    }
    else{

        if(Sensors_Values::odometer_value == value){

            moving = false;

            qDebug() << "Стоим на месте!!!!";
        }

        //check_Signal_Forward(false);


        if(Sensors_Values::forward){

            emit m_pointer->newDirection_movement_signal(false);

            Sensors_Values::forward = false;

        }
        /*else{

            // Пока тестово
            if(!Sensors_Values::checkFirstMove){

                qDebug() << "yyyyyyyyyyyyyyy";
                emit m_pointer->newDirection_movement_signal(false);

                Sensors_Values::forward = false;

                Sensors_Values::checkFirstMove = true;
            }

        }*/

    }

    emit m_pointer->newSystemCoord_signal(value);


    Sensors_Values::odometer_value = value;


    Task_Microservice z(m_pointer);

    z.add_TaskValues(value);


    /*QPair<bool, QPair<QString, QString>> station = Task_Values::get_Station(value);

    if(station.first){

        emit m_pointer->newStation_signal(station.second.first, station.second.second);

    }*/



    qDebug() << "odometer_value = " + QString::number(Sensors_Values::odometer_value);

    return moving;
}

void ChartPoints_Microservice::check_Riht(float value_left, float value_right){

    bool isRight = false;

    if(0 <= value_left){

        isRight = true;

    }

    if(Sensors_Values::isRight_Riht != isRight){

        Sensors_Values::isRight_Riht = isRight;

        emit m_pointer->newRihtPosition_signal(isRight);

    }

    check_Point(Name_Measures::Riht_Left_Measure, value_left);

    check_Point(Name_Measures::Riht_Right_Measure, value_right);

}

void ChartPoints_Microservice::check_Point(int index, float value){

    QPair<bool, float> pair = Correct_Points::check_Point(index, value);

    if(Sensors_Values::isPlay_Chart){

        if(pair.first){

            qDebug() << "odometer_value = " + QString::number(Sensors_Values::odometer_value);

           // emit m_pointer->newPoint_Chart_signal(index, pair.second, Sensors_Values::odometer_value);
            emit m_pointer->newPoint_Chart_signal(index, pair.second, 0);

            qDebug() << "level = " + QString::number(pair.second);

        }

        Export_Microservice::add_PointsInFile(index, pair.second, Sensors_Values::odometer_value);

    }



}
