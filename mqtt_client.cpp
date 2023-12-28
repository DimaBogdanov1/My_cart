#include <QtMqtt/QMqttClient>
#include <QHostInfo>
#include <QNetworkInterface>
#include <QJsonDocument>
#include <QJsonObject>

#include "mqtt_client.h"
#include "measures/chart_work.h"


MQTT_Client::MQTT_Client(QObject *parent) : QObject(parent) //  () //(QObject *parent) : QObject(parent)
{

    qDebug() << "Зашли для подключения";

    m_client = new QMqttClient;

    m_client->setHostname(getAddress());   //  "localhost" "172.27.2.33"

    m_client->setPort(1883);


    connect(m_client, &QMqttClient::stateChanged, this, &MQTT_Client::onStateChange );

    connect(m_client, &QMqttClient::connected, this, &MQTT_Client::onConnect);

    connect(m_client, &QMqttClient::messageReceived, this,  &MQTT_Client::onNew_message);


    m_client->connectToHost();
}


void MQTT_Client::print_pdf(){

    qDebug() << "Отправляем команду на печать PDF";

    QByteArray data = "отправляем сообщение!";

    m_client->publish(QMqttTopicName(this->export_topic +"1"), data, 0, false);

}


void MQTT_Client::add_ChartPoints(const QByteArray &message){

    qDebug() << "Будем добавлять точки на график";


    QJsonDocument doc = QJsonDocument::fromJson(message);

    QString formatted = doc.toJson(QJsonDocument::Indented);

    qWarning().noquote() << formatted;


    QJsonObject jsonObject = doc.object();

    QJsonObject chartPointInfo = jsonObject["Title_Message"].toObject();


   /*for(int i = 0; i < 6; i++){

        float value_x = round( (chartPointInfo[titles_List.at(i)].toString()).toFloat()  * 10) / 10.0;

        emit messageReceived(i, value_x, 0);

    } */

    float value_x = round( (chartPointInfo["Level_Value"].toString()).toFloat()  * 10) / 10.0;

    emit newPoint_Chart_signal(0, value_x, 0);    //     emit newPoint_Chart_signal(3, 1520, 10);


}

void MQTT_Client::onNew_message(const QByteArray &message, const QMqttTopicName &topic) {


    QStringList parts = topic.name().split('/');

    int num_command;

    if(parts.length() > 2){

        num_command = parts[2].toInt();
    }

    // Здесь должна быть проверка на второе слово

    switch(num_command){

    case Add_Points_To_Chart:

        add_ChartPoints(message);


        break;

     default:

        const QString content = message;

        qDebug() << "Topic: = " +  topic.name();

        qDebug() << "Message: = " + content;


        break;
    }

}


void MQTT_Client::onStateChange() {

    if(m_client->state() == QMqttClient::Connecting){

        qDebug() << "Мы подключаемся";
    }

    if(m_client->state() == QMqttClient::Disconnected){

        qDebug() << "Мы не подключены";
    }
}


void MQTT_Client::onConnect() {

   qDebug() << "Мы подключились!!!!";

   auto subscription = m_client->subscribe(QMqttTopicFilter(this->subscribe_topic));

   if (subscription) {
       qDebug() << "Мы оформили подписку!";

   }
   else{

       qDebug() << "Не удалось подписаться!";

   }
}

QString MQTT_Client::getAddress() {

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

