#ifndef TASK_DATA_H
#define TASK_DATA_H

#include <QObject>
#include <QList>
#include <QString>

#include "mqtt/task/task_elements/station.h"
#include "mqtt/task/task_elements/pch.h"
#include "mqtt/task/task_elements/direction.h"
#include "mqtt/task/task_elements/speed_train/speed_train.h"

class Task_Data
{

public:

    Task_Data();

    inline static QList<Station*> *station_List = new QList<Station *>();

    inline static QList<Pch*> *pch_List = new QList<Pch *>();

    inline static QList<Speed_Train*> *speedTrain_List = new QList<Speed_Train *>();

    inline static QList<Direction*> *direction_List = new QList<Direction *>();


    //int pch = 1;

   static void tmp_set_values();


  inline static bool tmp_check = false;


};

#endif // TASK_DATA_H
