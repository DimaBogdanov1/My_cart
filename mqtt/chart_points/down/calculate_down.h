#ifndef CALCULATE_DOWN_H
#define CALCULATE_DOWN_H

#include <QList>

#include "down.h"

class Calculate_Down
{
public:
    Calculate_Down();

    static void add_Down(double odo, double move_vertical_left, double move_vertical_right, double pitch);

private:

   int counRihtBlock;

   inline static QList<Down> downList;

   static void test_Calculate();
};

#endif // CALCULATE_DOWN_H
