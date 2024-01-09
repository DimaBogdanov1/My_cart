#ifndef SENSORSREGISTER_MICROSERVICE_H
#define SENSORSREGISTER_MICROSERVICE_H

#include <QJsonDocument>
#include <QJsonObject>

class SensorsRegister_Microservice
{
public:
    SensorsRegister_Microservice();

private:

    enum Command{
        Diagnostic,
        Ins,
        RC
    };

    void add_Command(int num, const QByteArray &message);

    void add_RC_Command(const QByteArray &message);

    void add_INS(const QByteArray &message);

    void diagnostic_Command(const QByteArray &message);

};

#endif // SENSORSREGISTER_MICROSERVICE_H
