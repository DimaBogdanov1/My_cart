#ifndef CALCULATE_DOWN_H
#define CALCULATE_DOWN_H

#include <QList>

#include "down.h"
#include "../Export_Lib/file/points/name_measures.h"

class Calculate_Down
{
public:
    Calculate_Down();

    static void add_Down(double odo, double move_vertical_left, double move_vertical_right, double pitch, bool isForward);

private:

   int counRihtBlock;

   inline static QList<Down> downList;

   static void test_Calculate(bool isForward);
};

#endif // CALCULATE_DOWN_H
