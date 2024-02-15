#ifndef EXPORT_MICROSERVICE_H
#define EXPORT_MICROSERVICE_H

#include <QString>
#include <QJsonObject>
#include <QJsonDocument>

#include "mqtt/mqtt_client.h"
class Export_Microservice
{
public:
    Export_Microservice(MQTT_Client *pointer);

    static void print_PDF();

    void add_Command(int num, const QByteArray &message);

    static void add_PointsInFile(int index, float x, float y);

    static void add_NewKm();

    static void add_NewParams();

    static void add_NewGeneralInfo();

    static void close_Microservice();


    static QJsonObject help_add_NewParams(QJsonObject &newParams_Object, int index, QString name);

private:

    MQTT_Client *m_pointer;

    enum Command{
        Add_ServiceStarted,
        Add_New_Defect,
        Add_Km_Mark
    };

    void add_Defect(const QByteArray &message);

    void add_KmMark(const QByteArray &message);

    void add_ServiceStarted();

    inline static QString export_topic = "backend/export/";

};

#endif // EXPORT_MICROSERVICE_H
