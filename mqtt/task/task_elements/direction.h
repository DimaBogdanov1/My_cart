#ifndef DIRECTION_H
#define DIRECTION_H

#include <QString>
#include "task.h"

class Direction : public Task
{
public:
    Direction(float startCoord, int upNom, QString nameDirection){

        this->startCoord = startCoord;

        this->upNom = upNom;

        this->nameDirection = nameDirection;
    }

    int upNom;

    QString nameDirection;

};

#endif // DIRECTION_H
