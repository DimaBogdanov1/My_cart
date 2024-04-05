#ifndef CHARTPOINTS_MICROSERVICE_H
#define CHARTPOINTS_MICROSERVICE_H

#include <QJsonDocument>
#include <QJsonObject>
#include <QThread>

//#include "mqtt/mqtt_client.h"

class ChartPoints_Microservice
{
public:    
    ChartPoints_Microservice();

    static void add_Command(int num, const QByteArray &message);

    static void check_Point(int index, float value, bool isForwardMoving);

private:

   // inline static Chart_Page *chart_Page;

    static void add_Level(int index, const QByteArray &message);

    static void add_Sample(int index, const QByteArray &message);

    static void add_Side_Damage_Measure(int index, const QByteArray &message);

    static void add_Vertical_Damage_Measure(int index, const QByteArray &message);

    static void add_Bowing_Measure(int index, const QByteArray &message);

    static void add_Rolling_Surface_Measure(int index, const QByteArray &message);


    static bool check_Forward(float value);


  //  Export_DB *export_db;
};


#endif // CHARTPOINTS_MICROSERVICE_H
