#ifndef MQTT_CLIENT_H
#define MQTT_CLIENT_H

#include <QObject>
#include <QMqttClient>

class MQTT_Client : public QObject
{
    Q_OBJECT
public:

    explicit MQTT_Client(QObject *parent = nullptr);

    static void publish_JSON(const QString &topic, QJsonObject &measure_Object);

public slots:

    void print_pdf();

private:

    inline static QMqttClient *m_client;

    QString subscribe_topic = "ui/#";

    //QString export_topic = "backend/export/";

    enum Commands {
        Add_Points_To_Chart

    };

    void onNew_message(const QByteArray &message, const QMqttTopicName &topic);

    QString getAddress();

    void onConnect();

    void onStateChange();




    void add_ChartPoints(const QByteArray &message);

    void add_INS(const QByteArray &message);

    void add_RC_Command(const QByteArray &message);

    void create_Log_Command();

    QList<double> getValueFrom_JSON(const QByteArray &message, QList<QString> names);


signals:

    void newPoint_Chart_signal(const int& index, const float& x_val, const float& y_val);

    void newGPS_signal(const float& latitude, const float& longitude, const float& yaw);

};

#endif // MQTT_CLIENT_H
