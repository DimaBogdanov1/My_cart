#ifndef MQTT_CLIENT_H
#define MQTT_CLIENT_H

#include <QObject>
#include <QMqttClient>

class MQTT_Client : public QObject
{
    Q_OBJECT
public:

    explicit MQTT_Client(QObject *parent = nullptr);

public slots:

    void print_pdf();

private:
    QMqttClient *m_client;

    QString subscribe_topic = "ui/#";

    QString export_topic = "backend/export/";

    enum Commands {
        Add_Points_To_Chart

    };

    void onNew_message(const QByteArray &message, const QMqttTopicName &topic);

    QString getAddress();

    void onConnect();

    void onStateChange();

    void add_ChartPoints(const QByteArray &message);

signals:

    void newPoint_Chart_signal(const int& index, const float& x_val, const float& y_val);

};

#endif // MQTT_CLIENT_H
