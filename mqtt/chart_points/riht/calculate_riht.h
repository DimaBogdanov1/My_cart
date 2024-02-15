#ifndef CALCULATE_RIHT_H
#define CALCULATE_RIHT_H

#include <QList>

#include "riht.h"

class Calculate_Riht
{
public:
    Calculate_Riht();

    static void add_Riht(double odo, double move_horizontal_left, double move_horizontal_right, double yaw);

 private:

    int counRihtBlock;

    inline static QList<Riht> rihtList;

    static void test_Calculate(double move_horizontal_left);

};

#endif // CALCULATE_RIHT_H
