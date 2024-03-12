#ifndef CHARTPOINTS_MICROSERVICE_H
#define CHARTPOINTS_MICROSERVICE_H

#include <QJsonDocument>
#include <QJsonObject>

#include "mqtt/mqtt_client.h"

class ChartPoints_Microservice
{
public:    
    ChartPoints_Microservice(MQTT_Client *pointer);

    void add_Command(int num, const QByteArray &message);

    static void check_Point(int index, float value);

    static void check_Riht(float value_left, float value_right);

private:

    inline static MQTT_Client *m_pointer;

    void add_Level(int index, const QByteArray &message);

    void add_Sample(int index, const QByteArray &message);

    void add_Side_Damage_Measure(int index, const QByteArray &message);

    void add_Vertical_Damage_Measure(int index, const QByteArray &message);

    void add_Bowing_Measure(int index, const QByteArray &message);

    void add_Rolling_Surface_Measure(int index, const QByteArray &message);


    bool check_Forward(float value);

    void check_Signal_Forward(bool forwardCheck);


  //  Export_DB *export_db;
};


#endif // CHARTPOINTS_MICROSERVICE_H
