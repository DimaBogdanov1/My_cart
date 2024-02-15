#ifndef MQTT_CLIENT_H
#define MQTT_CLIENT_H

#include <QObject>
#include <QMqttClient>
#include "mqtt/sensors/sensors_values.h"

//#include "sensorsregister_microservice.h"

class MQTT_Client : public QObject
{
    Q_OBJECT

public:

    explicit MQTT_Client(QObject *parent = nullptr);

    static void publish_JSON(const QString &topic, QJsonObject &measure_Object);

public slots:

    void print_pdf();

    void get_Diagnostic(bool start);

    void test_slot();

    void test_slot_NewKm();

    void test_slot_NewParams();

    void test_slot_NewGeneralInfo();

    void test_slot_CloseExportMicroservice();

private:

    inline static QMqttClient *m_client;

    QString subscribe_topic = "ui/#";

    //SensorsRegister_Microservice sensorsRegister_Microservice;

    enum Commands {
        Add_Points_To_Chart

    };

    void onNew_message(const QByteArray &message, const QMqttTopicName &topic);

    void onConnect();

    void onStateChange();

signals:

    void newPoint_Chart_signal(const int& index, const float& x_val, const float& y_val);

    void newGPS_signal(const float& latitude, const float& longitude, const float& yaw,  const float& pitch);

    void newDiagnostic_signal(const bool& laser_left, const bool& laser_right);

    void newNotification_signal(const QString& text, const int& status);


    void newButtonClick_signal(const int& number);

    void newSpeed_signal(const float& speed);

    void newCharge_signal(const int& charge);

    void newDirection_movement_signal(const bool& isForward);

    void newRihtPosition_signal(const bool& isRight);


    void newPCH_signal(const int& pch, const int& pchy, const int& pd, const int& pdb);

    void newStation_signal(const QString& station_1, const QString& station_2);

    void newObject_signal(const int &type, const float &start_y, const float &finish_y);

    void newSpeedTrain_signal(const float &startCoord, const float &finishCoord, const int &speedPass, const int &speedFreight, const int &speedSallowBird, const int &speedSapsan);

    void newSystemCoord_signal(const float& value);

    void newDirection_signal(const int& upNom, const QString &directionName);

    void newPutNom_signal(const int& putNom);

    void newDefect_signal(const int &km, const int &m, const int &defect, const int &extent, const int &amp, const int &width_defect, const int &sign, const int &speed, const int &speed_limit );

    void newKmMark_signal(const int &km, const int &speed, const int &speed_limit, const int &extent, const int &mark);

};

#endif // MQTT_CLIENT_H
