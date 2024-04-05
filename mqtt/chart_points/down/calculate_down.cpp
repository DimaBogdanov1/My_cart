#include "calculate_down.h"
#include "down.h"
#include "mqtt/chart_points/chartpoints_microservice.h"

#include <QDebug>
#include <QRandomGenerator>

Calculate_Down::Calculate_Down()
{

}

void Calculate_Down::add_Down(double odo, double move_vertical_left, double move_vertical_right, double pitch, bool isForward){


    Down down(odo, move_vertical_left, move_vertical_right, pitch);

    downList.append(down);

    /*qDebug() << "odo = " + QString::number(odo) +
                " move_horizontal_left = " + QString::number(move_horizontal_left) +
                " move_horizontal_right = " + QString::number(move_horizontal_right) +
                " yaw = " + QString::number(yaw); */


//    qDebug() << "В Листе точек = " + QString::number(downList.length());



    if(downList.length() == 1){ //3

        test_Calculate(isForward);

        downList.clear();
    }


}

void Calculate_Down::test_Calculate(bool isForward){

    QRandomGenerator *rg = QRandomGenerator::global();


    int left_value = rg->bounded(-2, 2);

    ChartPoints_Microservice::check_Point(Name_Measures::Down_Left_Measure, left_value, isForward);


    int right_value = rg->bounded(-1, 1);

    ChartPoints_Microservice::check_Point(Name_Measures::Down_Right_Measure, right_value, isForward);

}
