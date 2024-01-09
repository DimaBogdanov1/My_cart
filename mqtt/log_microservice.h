#ifndef LOG_MICROSERVICE_H
#define LOG_MICROSERVICE_H

#include <QString>
#include "mqtt/mqtt_client.h"

class Log_Microservice
{
public:
    Log_Microservice();

    static void create_LogRecord(QString message);

    static void create_LogFile();

    //inline static QJsonObject& create_LogRecord(QString topic, QString message);

};

#endif // LOG_MICROSERVICE_H
