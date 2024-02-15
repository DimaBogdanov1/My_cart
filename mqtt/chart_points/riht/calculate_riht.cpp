#include "calculate_riht.h"
#include "riht.h"
#include "mqtt/mqtt_client.h"
#include "mqtt/chart_points/chartpoints_microservice.h"
#include "mqtt/chart_points/name_measures.h"

#include <QDebug>
#include <QRandomGenerator>

Calculate_Riht::Calculate_Riht()
{

}

void Calculate_Riht::add_Riht(double odo, double move_horizontal_left, double move_horizontal_right, double yaw){

   // Riht riht(double odo, double move_horizontal_left, double move_horizontal_right, double yaw);

    Riht riht(odo, move_horizontal_left, move_horizontal_right, 2);

    rihtList.append(riht);

    qDebug() << "move_horizontal_left = " + QString::number(move_horizontal_left);

  //  qDebug() << "В Листе точек = " + QString::number(rihtList.length());



    if(rihtList.length() == 3){

        test_Calculate(move_horizontal_left);

        rihtList.clear();
    }

}

void Calculate_Riht::test_Calculate(double move_horizontal_left){

    QRandomGenerator *rg = QRandomGenerator::global();


    int value;

    // Тестовый обыгрыш
    if(move_horizontal_left == 0){

        value = rg->bounded(-15, -5);
    }
    else{

        value = rg->bounded(5, 15);

    }

  //  ChartPoints_Microservice::check_Point(Name_Measures::Riht_Left_Measure, left_value);


    //ChartPoints_Microservice::check_Point(Name_Measures::Riht_Left_Measure, left_value);


   // int right_value = rg->bounded(0, 5);

    //ChartPoints_Microservice::check_Point(Name_Measures::Riht_Right_Measure, right_value);



    ChartPoints_Microservice::check_Riht(value, value);

}
