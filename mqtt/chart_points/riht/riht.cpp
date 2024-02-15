#include "riht.h"

Riht::Riht(double odo, double move_horizontal_left, double move_horizontal_right, double yaw)
{
    this->odo = odo;

    this->move_horizontal_left = move_horizontal_left;

    this->move_horizontal_right = move_horizontal_right;

    this->yaw = yaw;
}
