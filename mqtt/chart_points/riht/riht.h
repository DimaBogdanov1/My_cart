#ifndef RIHT_H
#define RIHT_H


class Riht
{
public:
    Riht(double odo, double move_horizontal_left, double move_horizontal_right, double yaw);

    double odo;

    double move_horizontal_left;

    double move_horizontal_right;

    double yaw;

};

#endif // RIHT_H


