#include <QHostInfo>
#include <QNetworkInterface>
#include <QJsonDocument>
#include <QJsonObject>

#include "mqtt_help.h"

MQTT_Help::MQTT_Help()
{

}

QString MQTT_Help::getAddress() {

    QString my_adress;

    const QHostAddress &localhost = QHostAddress(QHostAddress::LocalHost);

    for (const QHostAddress &address: QNetworkInterface::allAddresses()) {

        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != localhost){

            my_adress = address.toString();

            qDebug() << my_adress;

        }
    }

    return my_adress;
}

QList<double> MQTT_Help::getValueFrom_JSON(const QByteArray &message, QList<QString> names){

    QJsonDocument doc = QJsonDocument::fromJson(message);

    QString formatted = doc.toJson(QJsonDocument::Indented);


    qWarning().noquote() << formatted;


    QJsonObject jsonObject = doc.object();



    //QJsonObject jsonReceived = jsonObject.value("Received").toObject();

    QList<double> answer_List;

    for(int i = 0; i < names.length(); i++){

       //answer_List.append(jsonReceived.value(names.at(i)).toDouble());

       answer_List.append(jsonObject.value(names.at(i)).toDouble());
    }

    return answer_List;
}

QPair<int, int> MQTT_Help::getNumCommand(const QByteArray &message, const QMqttTopicName &topic){

    const QString content = message;

 //   qDebug() << "Topic: = " +  topic.name();

 //   qDebug() << "Message: = " + content;



    QStringList myOptions;
    myOptions << "chart" << "ins" << "export";



    QStringList parts = topic.name().split('/');

    int num_command = 0;

    QString topic_name;

    topic_name = parts[1];

    if(parts.length() > 2){

        num_command = parts[2].toInt();
    }

 //   qDebug() << "parts.length() = " + QString::number(parts.length() );

    qDebug() << "topic_name = " + topic_name;

    return QPair{myOptions.indexOf(topic_name), num_command};
}
