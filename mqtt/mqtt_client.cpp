#include <QtMqtt/QMqttClient>
#include <QHostInfo>
#include <QNetworkInterface>
#include <QJsonDocument>
#include <QJsonObject>

#include "mqtt_client.h"

#include "export_microservice.h"
#include "log_microservice.h"


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


void MQTT_Client::create_Log_Command(){


    Log_Microservice::create_LogRecord("Запись для логааа!!!");

    //Log_Microservice log_Microservice;

   // publish_JSON("backend/log", log_Microservice.create_LogRecord("Запись для логааа!!!"));


}


void MQTT_Client::print_pdf(){

    Export_Microservice::print_PDF() ;

   /* qDebug() << "Отправляем команду на печать PDF";

    QByteArray data = "отправляем сообщение!";

    m_client->publish(QMqttTopicName("backend/export/1"), data, 0, false); */

}


void MQTT_Client::add_RC_Command(const QByteArray &message){

    /*QJsonDocument doc = QJsonDocument::fromJson(message);

    //QString formatted = doc.toJson(QJsonDocument::Indented);


   // qWarning().noquote() << formatted;


    QJsonObject jsonObject = doc.object();

    QJsonObject chartPointInfo = jsonObject.value("Received").toObject();

    int num_Button = chartPointInfo.value("button").toDouble();

    */
    QList<double> button_num = getValueFrom_JSON(message, QList<QString> {"button"});

    if(button_num.length() == 1){

        qDebug() << "Номер кнопки: " + QString::number(button_num.at(0));

    }

}

QList<double> MQTT_Client::getValueFrom_JSON(const QByteArray &message, QList<QString> names){

    QJsonDocument doc = QJsonDocument::fromJson(message);

    QString formatted = doc.toJson(QJsonDocument::Indented);


    qWarning().noquote() << formatted;


    QJsonObject jsonObject = doc.object();

    QJsonObject jsonReceived = jsonObject.value("Received").toObject();

    QList<double> answer_List;

    for(int i = 0; i < names.length(); i++){

       answer_List.append(jsonReceived.value(names.at(i)).toDouble());
    }

    return answer_List;
}

void MQTT_Client::add_INS(const QByteArray &message){

    QList<double> ins_values = getValueFrom_JSON(message, QList<QString> {"latitude", "longitude", "yaw" });

    if(ins_values.length() == 3){

        emit newGPS_signal(ins_values.at(0), ins_values.at(1), ins_values.at(2));

    }

    //emit newGPS_signal(latitude, longitude, yaw);

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


    const QString content = message;

 //   qDebug() << "Topic: = " +  topic.name();

 //   qDebug() << "Message: = " + content;



    QStringList myOptions;
    myOptions << "chart" << "ins" << "rc" << "export";



    QStringList parts = topic.name().split('/');

    int num_command;

    QString topic_name;

    topic_name = parts[1];

    if(parts.length() > 2){

        num_command = parts[2].toInt();
    }

 //   qDebug() << "parts.length() = " + QString::number(parts.length() );

    qDebug() << "topic_name = " + topic_name;

    switch(myOptions.indexOf(topic_name)){

    case 0:

        switch(num_command){

        case Add_Points_To_Chart:

            add_ChartPoints(message);


            break;

         default:



            break;
        }

        break;

    case 1:

        add_INS(message);

        break;

    case 2:

        add_RC_Command(message);

        break;

    case 3:

        // Здесь ещё должна быть команда во вьюху что сервис готов (самодиагностика)

        Log_Microservice::create_LogRecord(tr("Запустился микросервис для экспорта данных"));

        qDebug() << "Экспорт подключился";

        break;
    }

    // Здесь должна быть проверка на второе слово


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


void MQTT_Client::publish_JSON(const QString &topic, QJsonObject &measure_Object){


    QJsonObject recordObject;


    recordObject.insert("Received", measure_Object);

    QJsonDocument doc(recordObject);

    QString formatted = doc.toJson(QJsonDocument::Indented);

    qWarning().noquote() << formatted;

    QByteArray data = doc.toJson();



    auto result = m_client->publish(QMqttTopicName(topic), data, 0, false);

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

