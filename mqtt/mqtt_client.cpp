#include <QtMqtt/QMqttClient>
#include <QHostInfo>
#include <QNetworkInterface>
#include <QJsonDocument>
#include <QJsonObject>
#include <QQmlApplicationEngine>
#include <QRandomGenerator>

#include "mqtt_client.h"

#include "sensors/sensorsregister_microservice.h"


#include "measures/chart_work.h"
#include "mqtt/mqtt_help.h"

#include "mqtt/chart_points/chartpoints_microservice.h"
#include "mqtt/chart_points/name_measures.h"
//#include "notifications/status_indicator.h"
#include "mqtt/sensors/track_sensor.h"
#include "mqtt/sensors/sensors_values.h"


//#include "mqtt/task/task_microservice.h"
#include "mqtt/task/task_data.h"
#include "mqtt/task/task_values.h"

#include "mqtt/task/task_elements/speed_train/name_trains.h"



#include "../Notifications_Lib/notifications_lib.h"
#include "../Export_Lib/export_lib.h"




MQTT_Client::MQTT_Client(QObject *parent) : QObject(parent) //  () //(QObject *parent) : QObject(parent)
{

    //Track_Sensor a;


    qDebug() << "Зашли для подключения";

    qRegisterMetaType<Status>("Name_Measures");

    qmlRegisterUncreatableType<Name_Measures>("qml.measure", 1, 0, "Name_Measures", "Not creatable as it is an enum type");



    qRegisterMetaType<Status_Ind>("Status_Indicator");

    qmlRegisterUncreatableType<Status_Indicator>("qml.status_ind", 1, 0, "Status_Indicator", "Not creatable as it is an enum type");



    //qRegisterMetaType<Status_Names>("Name_Trains");

    qmlRegisterUncreatableType<Name_Trains>("qml.name_train", 1, 0, "Name_Trains", "Not creatable as it is an enum type");



    qmlRegisterType<Sensors_Values>("Sensors_Values", 1, 0, "Sensors_Values");

    qmlRegisterType<Task_Values>("Task_Values", 1, 0, "Task_Values");




   // qmlRegisterType<Defect_Model*>("Defect_Model", 1, 0, "Defect_Model");

   // qRegisterMetaType<Defect_Model*>("Defect_Model");



    m_client = new QMqttClient;

    m_client->setHostname(MQTT_Help::getAddress());  //MQTT_Help::getAddress()  // "192.168.1.157" //  "localhost" "172.27.2.33"

    m_client->setPort(1883);


    connect(m_client, &QMqttClient::stateChanged, this, &MQTT_Client::onStateChange);

    connect(m_client, &QMqttClient::connected, this, &MQTT_Client::onConnect);

    connect(m_client, &QMqttClient::messageReceived, this,  &MQTT_Client::onNew_message);


    m_client->connectToHost();


    //sensorsRegister_Microservice = new SensorsRegister_Microservice(this);
}


void MQTT_Client::get_Diagnostic(bool start){

    SensorsRegister_Microservice sensorsRegister_Microservice(this);

    sensorsRegister_Microservice.get_Diagnostic(start);

}




void MQTT_Client::print_pdf(){

    Export_Lib::createPDF();


    //Export_Microservice::print_PDF() ;

   /* qDebug() << "Отправляем команду на печать PDF";

    QByteArray data = "отправляем сообщение!";

    m_client->publish(QMqttTopicName("backend/export/1"), data, 0, false); */

}



void MQTT_Client::onNew_message(const QByteArray &message, const QMqttTopicName &topic) {


    /*const QString content = message;

 //   qDebug() << "Topic: = " +  topic.name();

 //   qDebug() << "Message: = " + content;



    QStringList myOptions;
    myOptions << "chart" << "ins" << "export";



    QStringList parts = topic.name().split('/');

    int num_command;

    QString topic_name;

    topic_name = parts[1];

    if(parts.length() > 2){

        num_command = parts[2].toInt();
    }

 //   qDebug() << "parts.length() = " + QString::number(parts.length() );

    qDebug() << "topic_name = " + topic_name; */


    QPair<int, int> commandPair = MQTT_Help::getNumCommand(message, topic);


    switch(commandPair.first){

    case 0: {

        ChartPoints_Microservice chartPoints_Microservice(this);

        chartPoints_Microservice.add_Command(commandPair.second, message);

        break;

    }

    case 1: {

        SensorsRegister_Microservice sensorsRegister_Microservice(this);

        sensorsRegister_Microservice.add_Command(commandPair.second, message);

        break;
    }


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

    //QJsonDocument doc(recordObject);

  //  recordObject.insert("Received", measure_Object);

    QJsonDocument doc(measure_Object);

    QString formatted = doc.toJson(QJsonDocument::Indented);

  //  qWarning().noquote() << formatted;

    QByteArray data = doc.toJson();



    auto result = m_client->publish(QMqttTopicName(topic), data, 0, false);

}



void MQTT_Client::test_slot(){

    Sensors_Values::odometer_value = 0;

   // emit newPCH_signal(1, 2, 3, 4);

   // emit newStation_signal("Ромашково", "Берёзово");

   // emit newHeader_signal(11233, "Москва-Рига", 3);

   // void newObject_signal(0, 3, 4);

   // void newSpeed_signal(const int &type, const float &speed);

}

void MQTT_Client::test_slot_NewKm(){

    Export_Lib a;

    Export_Lib::addNew_Km(Km_Info(0,
                                  "Октябрьская",
                                  "Новосокльники направление",
                                  112233,
                                  1,
                                  22,
                                  43,
                                  22,
                                  11,
                                  70,
                                  80,
                                  20,
                                  1730,
                                  0,
                                  0,0,0,0,0,"Пред: -КрдПЧ",
                                  "2024-01-07 12:30:30",
                                  "2024-01-07 00:00:00"));


   // Export_Microservice::add_NewKm();

}

void MQTT_Client::test_slot_NewParams() {

    Export_Lib::addNew_Params(Params(0, 1000, 10, -20, 20));

    //Export_Microservice::add_NewParams();

}

void MQTT_Client::test_slot_NewGeneralInfo(){

    Export_Lib a;

    Export_Lib::addNew_GeneralInfo(General_Info(1.0,
                                                "2022-10-03",
                                                "436/р",
                                                "МДК: МДК-498",
                                                "Анциферов И.Н.",
                                                "2022-12-12",
                                                "Прямой",
                                                "Базовая",
                                                "Рабочая",
                                                "2023-04-12",
                                                1));

   // Export_Microservice::add_NewGeneralInfo();

}

void MQTT_Client::test_slot_CloseExportMicroservice(){

    Export_DB export_DB(Export_Lib::db_path);

    QRandomGenerator *rg = QRandomGenerator::global();

    for(int i = 0; i < 1730; i++){

        int paramValue = rg->bounded(-5, 5);


        int a = 0;

        if(50 < i && i < 100){

            a = -5;
        }


        if(1100 < i && i < 1500){

            a = -5;
        }


      if(150 < i){

       //   a = -5;

         paramValue = 0;
      }


      export_DB.insertPoint(Name_Measures::Level_Measure, paramValue , i);

       export_DB.insertPoint(Name_Measures::Riht_Right_Measure, a , i);

        export_DB.insertPoint(Name_Measures::Riht_Left_Measure, a , i);

      //  export_DB.insertPoint(Name_Measures::Riht_Right_Measure, -5 , i);

       // Export_Lib::addPoints_To_File(5,-5 , i);


    }

   /* for(int i = 200; i < 1730; i++){

        export_DB.insertPoint(Name_Measures::Riht_Right_Measure, 4 , i);

        export_DB.insertPoint(Name_Measures::Level_Measure, 0 , i);

    }*/


   // Export_Lib::addPoints_To_File(index, pair.second, Sensors_Values::odometer_value);

   // Export_Microservice::close_Microservice();

}

void MQTT_Client::test_slot_add_sleepers(){


    Export_Lib::addNew_Sleepers(Sleepers(Type_Sleepers::Wood, 0, 400, 38));
}

void MQTT_Client::test_slot_add_bridge(){

    Export_Lib::addNew_Bridge(Bridge(100, 150, 38));


}

void MQTT_Client::test_slot_add_arrow(){

    Export_Lib::addNew_Arrow(Arrow(Type_Arrows::Bottom_left,38, 120, true, false, 12));

}

void MQTT_Client::test_slot_add_object(){

    Export_Lib::addNew_Object(Chart_Object(Type_Object::Isolated_Junction, 38, 140));

}

void MQTT_Client::test_slot_helpLine() {

    Export_Lib::addNew_Line(Km_Help_Line(Type_Km_Help_Lines::Help_Line, 0, 400, 38));

    Export_Lib::addNew_Line(Km_Help_Line(Type_Km_Help_Lines::Earth_Line, 200, 800, 38));

}
