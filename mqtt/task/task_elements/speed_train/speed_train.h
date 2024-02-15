#ifndef SPEED_TRAIN_H
#define SPEED_TRAIN_H

#include "mqtt/task/task_elements/task.h"

class Speed_Train : public Task
{
public:
    Speed_Train(float startCoord, float finishCoord, int speed_Pass, int speed_Freight, int speed_SallowBird, int speed_Sapsan){

        this->startCoord = startCoord;

        this->finishCoord = finishCoord;

        this->speed_Pass = speed_Pass;

        this->speed_Freight = speed_Freight;

        this->speed_SallowBird = speed_SallowBird;

        this->speed_Sapsan = speed_Sapsan;

    }

    int finishCoord;

    int speed_Pass;

    int speed_Freight;

    int speed_SallowBird;

    int speed_Sapsan;

};

#endif // SPEED_TRAIN_H
