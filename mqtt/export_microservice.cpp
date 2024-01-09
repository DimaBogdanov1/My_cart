#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>

#include "log_microservice.h"
#include "mqtt/mqtt_client.h"

#include "export_microservice.h"

Export_Microservice::Export_Microservice()
{

}

void Export_Microservice::print_PDF() {

   // QString topic = "backend/log";

    QJsonObject export_Object;

    export_Object.insert("command", 0);

    Log_Microservice::create_LogRecord("Создаём PDF");

    MQTT_Client::publish_JSON(export_topic, export_Object);
}
