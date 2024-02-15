#include <QDebug>

#include "task_data.h"
#include "mqtt/sensors/sensors_values.h"
#include "mqtt/task/task_elements/direction.h"

#include "mqtt/task/task_elements/speed_train/name_trains.h"

Task_Data::Task_Data() //QObject *parent) : QObject(parent)
{


}

void Task_Data::tmp_set_values(){

    if(!tmp_check){

         Station *a = new Station(20, "Новосокльники", "Великие Луки");

         Station *b = new Station(120, "Великие Луки", "Москва");

         station_List->append(a);

         station_List->append(b);





         Pch *pch_1 = new Pch(20, 2, 3, 9, 20);

         Pch *pch_2 = new Pch(120, 20, 1, 2, 67);


         pch_List->append(pch_1);

         pch_List->append(pch_2);


         Direction *direction = new Direction(120, 334433, "Мурманск-Аппатиты");

         direction_List->append(direction);


         Speed_Train *speed_Train_1 = new Speed_Train(0, 40, 80,40, 120, 140);

         Speed_Train *speed_Train_2 = new Speed_Train(40, 130, 100, 60, 160, 180);

        // Speed_Train *speed_Train_2 = new Speed_Train(120, Name_Trains::Freight_Train, 40);

         //Pch *pch_2 = new Pch(120, 20, 1, 2, 67);


         speedTrain_List->append(speed_Train_1);

         speedTrain_List->append(speed_Train_2);

        // speedTrain_List->append(speed_Train_2);

        // pch_List->append(pch_2);


        tmp_check = true;
    }

}
