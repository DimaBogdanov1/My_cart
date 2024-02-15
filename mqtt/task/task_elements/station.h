#ifndef STATION_H
#define STATION_H

#include <QString>

//#include "task.h"

class Station //: public Task
{

public:
    Station(float startCoord, QString station_1, QString station_2){

        this->startCoord = startCoord;

        this->station_1 = station_1;

        this->station_2 = station_2;
    }

    float startCoord;

    QString station_1;

    QString station_2;

    //float getCoord();

};

#endif // STATION_H
