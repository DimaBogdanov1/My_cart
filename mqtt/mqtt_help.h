#ifndef MQTT_HELP_H
#define MQTT_HELP_H

#include <QString>
#include <QMqttClient>

class MQTT_Help
{
public:
    MQTT_Help();

   static QString getAddress();

   static QList<double> getValueFrom_JSON(const QByteArray &message, QList<QString> names);

   static QPair<int, int> getNumCommand(const QByteArray &message, const QMqttTopicName &topic);

};

#endif // MQTT_HELP_H
