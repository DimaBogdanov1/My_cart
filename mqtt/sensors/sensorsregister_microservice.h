#ifndef SENSORSREGISTER_MICROSERVICE_H
#define SENSORSREGISTER_MICROSERVICE_H

#include <QJsonDocument>
#include <QJsonObject>

#include "mqtt/mqtt_client.h"

class SensorsRegister_Microservice
{
public:
    SensorsRegister_Microservice(MQTT_Client *pointer);

    void add_Command(int num, const QByteArray &message);

    void get_Diagnostic(bool startDiagnostic);

private:

    MQTT_Client *m_pointer;

    enum Command{
        Result_Diagnostic_Command,
        Ins_Command,
        RC_Command,
        Speed_Command,
        Charge_Command
    };

    void add_RC_Command(const QByteArray &message);

    void add_INS_Command(const QByteArray &message);

    void add_Speed_Command(const QByteArray &message);

    void result_diagnostic_Command(const QByteArray &message);

    void add_Charge_Command(const QByteArray &message);

};

#endif // SENSORSREGISTER_MICROSERVICE_H
