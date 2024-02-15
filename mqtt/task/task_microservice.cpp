#include "task_microservice.h"
#include "mqtt/sensors/sensors_values.h"
#include "mqtt/task/task_data.h"
#include "mqtt/task/task_elements/speed_train/name_trains.h"

Task_Microservice::Task_Microservice(MQTT_Client *pointer)   // (MQTT_Client *pointer)
{

    m_pointer = pointer;

}

void Task_Microservice::add_Command(int num, const QByteArray &message){

    switch(num){

    case Add_DB_Points_Command:

//        ChartPoints_Microservice chartPoints_Microservice(m_pointer);

       // chartPoints_Microservice.add_Command(commandPair.second, message);

        break;

    }
}


void Task_Microservice::add_TaskValues(float odometer_value){

    Task_Data::tmp_set_values();

    get_Station(odometer_value);

    get_Pch(odometer_value);

    get_Direction(odometer_value);

    get_SpeedTrains(odometer_value);
}




void Task_Microservice::get_Station(float odometer_value){

    QString station_1;

    QString station_2;

    if(Task_Data::station_List->length() != 0){

        if(Task_Data::station_List->at(0)->startCoord <= odometer_value){

            station_1 = Task_Data::station_List->at(0)->station_1;

            station_2 = Task_Data::station_List->at(0)->station_2;

            //  qDebug() << "Новая станция " + Task_Data::station_List->at(0)->station_1;

            emit m_pointer->newStation_signal(station_1, station_2);

            Task_Data::station_List->removeFirst();
        }

    }

}



void Task_Microservice::get_Pch(float odometer_value){


    if(Task_Data::pch_List->length() != 0){

        if(Task_Data::pch_List->at(0)->startCoord <= odometer_value){

            int pch = Task_Data::pch_List->at(0)->pch;

            int pchy = Task_Data::pch_List->at(0)->pchy;

            int pd = Task_Data::pch_List->at(0)->pd;

            int pdb = Task_Data::pch_List->at(0)->pdb;


            emit m_pointer->newPCH_signal(pch, pchy, pd, pdb);

            Task_Data::pch_List->removeFirst();
        }

    }
}

void Task_Microservice::get_SpeedTrains(float odometer_value){

     if(Task_Data::speedTrain_List->length() != 0){

         if(Task_Data::speedTrain_List->at(0)->startCoord <= odometer_value && odometer_value < Task_Data::speedTrain_List->at(0)->finishCoord){

             int start = Task_Data::speedTrain_List->at(0)->startCoord;

             int finish = Task_Data::speedTrain_List->at(0)->finishCoord;


             int speed_Pass = Task_Data::speedTrain_List->at(0)->speed_Pass;

             int speed_Freight = Task_Data::speedTrain_List->at(0)->speed_Freight;

             int speed_SallowBird = Task_Data::speedTrain_List->at(0)->speed_SallowBird;

             int speed_Sapsan = Task_Data::speedTrain_List->at(0)->speed_Sapsan;


             emit m_pointer->newSpeedTrain_signal(start, finish, speed_Pass, speed_Freight, speed_SallowBird, speed_Sapsan);



             Task_Data::speedTrain_List->removeFirst();
         }
     }

  //  emit m_pointer->newSpeedTrain_signal(Name_Trains::Pass_Train, 80);

    //emit m_pointer->newSpeedTrain_signal(Name_Trains::Freight_Train, 40);
}


void Task_Microservice::get_Direction(float odometer_value){


    if(Task_Data::direction_List->length() != 0){

        if(Task_Data::direction_List->at(0)->startCoord <= odometer_value){

            int upNom = Task_Data::direction_List->at(0)->upNom;

            QString nameDirection = Task_Data::direction_List->at(0)->nameDirection;

            emit m_pointer->newDirection_signal(upNom, nameDirection);

            Task_Data::direction_List->removeFirst();
        }

    }
}

void Task_Microservice::test_func(){

    // Списки иудт по возратанию км я беру первое знаяение и если оно меньше того места где мы находися
    // тогда я делаю сигнал и удаляю его

}
