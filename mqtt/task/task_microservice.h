#ifndef TASK_MICROSERVICE_H
#define TASK_MICROSERVICE_H

#include <QJsonDocument>
#include <QJsonObject>

#include "mqtt/mqtt_client.h"
//#include "mqtt/task/task_values.h"


#include "mqtt/task/task_elements/station.h"
#include "mqtt/task/task_elements/pch.h"

class Task_Microservice
{

public:
    Task_Microservice(MQTT_Client *pointer);

   // Task_Microservice();

    void add_Command(int num, const QByteArray &message);

    void add_TaskValues(float odometer_value);

private:

    MQTT_Client *m_pointer;

    //Будем заполнять класс с информайией о пути
    enum Command{
        Add_DB_Points_Command,
        Add_Speed_Command,
        Add_Station_Command,
        Add_PCH_Command


    };


    void get_Station(float odometer_value);

    void get_Pch(float odometer_value);

    void get_SpeedTrains(float odometer_value);

    void get_Direction(float odometer_value);

    void test_func();

   // QList<Station> station_List = {Station(10, "Новосокльники", "Великие Луки"), Station(10, "Великие Луки", "Москва")};


    //Здесь хранится 1км пути
    //QList<Task_Values> task_Values_List;


};

#endif // TASK_MICROSERVICE_H
