#ifndef PCH_H
#define PCH_H

#include "task.h"

class Pch : public Task
{
public:

    Pch(float startCoord, int pch, int pchy, int pd, int pdb){

        this->startCoord = startCoord;

        this->pch = pch;

        this->pchy = pchy;

        this->pd = pd;

        this->pdb = pdb;
    }

    int pch;

    int pchy;

    int pd;

    int pdb;
};

#endif // PCH_H
