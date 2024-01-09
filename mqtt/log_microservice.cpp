#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>

#include "log_microservice.h"
#include "mqtt/mqtt_client.h"

Log_Microservice::Log_Microservice()
{

}

void Log_Microservice::create_LogRecord(QString message){

    QString topic = "backend/log";

    QJsonObject log_Object;

    log_Object.insert("command", 0);

    log_Object.insert("num_App", 0);

    log_Object.insert("status", 0);

    log_Object.insert("message", message);

    MQTT_Client::publish_JSON(topic , log_Object);

}

void Log_Microservice::create_LogFile(){

  /*  QString topic = "backend/log";

    QJsonObject log_Object;

    log_Object.insert("command", 0);

    log_Object.insert("num_App", 0);

    log_Object.insert("status", 0);

    log_Object.insert("message", message);

    MQTT_Client::publish_JSON(topic , log_Object); */

}
