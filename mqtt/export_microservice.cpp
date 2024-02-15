#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>

#include "mqtt/mqtt_client.h"
#include "mqtt/mqtt_help.h"

#include "export_microservice.h"
#include "mqtt/chart_points/correct_points.h"
#include "mqtt/chart_points/name_measures.h"

Export_Microservice::Export_Microservice(MQTT_Client *pointer)
{
    m_pointer = pointer;

}

void Export_Microservice::print_PDF() {

   // QString topic = "backend/log";

    QJsonObject export_Object;

    export_Object.insert("command", 0);

    //Log_Microservice::create_LogRecord("Создаём PDF");

    MQTT_Client::publish_JSON(export_topic + "2", export_Object);
}

void Export_Microservice::add_Command(int num, const QByteArray &message){

    switch(num){

    case Add_ServiceStarted:

        add_ServiceStarted();

        break;

    case Add_New_Defect:

        add_Defect(message);

        break;

    case Add_Km_Mark:

        add_KmMark(message);

        break;

    }
}

void Export_Microservice::add_PointsInFile(int index, float x, float y){

    QJsonObject point_Object;

    point_Object.insert("index", index);

    point_Object.insert("x", x);

    point_Object.insert("y", y);

  //  qDebug() << "export_topic = " + export_topic + "0";

    MQTT_Client::publish_JSON(export_topic + "1" , point_Object);
}

void Export_Microservice::add_NewKm(){

    QJsonObject newKm_Object;

    newKm_Object.insert("siteID", 0);
    newKm_Object.insert("nameDirection", "Новосокльники направление");
    newKm_Object.insert("upNom", 112233);
    newKm_Object.insert("putNom", 1);
    newKm_Object.insert("pch", 22);
    newKm_Object.insert("pchy", 43);
    newKm_Object.insert("pd", 22);
    newKm_Object.insert("pdb", 11);
    newKm_Object.insert("setSpeed", 70);
    newKm_Object.insert("speed", 80);
    newKm_Object.insert("km_num", 20);

    MQTT_Client::publish_JSON(export_topic + "3" , newKm_Object);

}

QJsonObject Export_Microservice::help_add_NewParams(QJsonObject &newParams_Object, int index, QString name){

    QPair<float, float> levelBord = Correct_Points::get_Borders(index);

    newParams_Object.insert("bias_" + name, 0);
    newParams_Object.insert("multi_" + name, 0);
    newParams_Object.insert("left_" + name, levelBord.first);
    newParams_Object.insert("right_" + name, levelBord.second);

    return newParams_Object;
}

void Export_Microservice::add_Defect(const QByteArray &message){

    qDebug() << "Новый дефект";

    QList<double> defect_values =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"km", "m", "defect", "extent",
                                                                                        "amp", "width_defect", "sign", "speed", "speed_limit"});


    m_pointer->newDefect_signal(defect_values.at(0),
                                defect_values.at(1),
                                defect_values.at(2),
                                defect_values.at(3),
                                defect_values.at(4),
                                defect_values.at(5),
                                defect_values.at(6),
                                defect_values.at(7),
                                defect_values.at(8));
}

void Export_Microservice::add_KmMark(const QByteArray &message){

    qDebug() << "Новая оценка километра";

    QList<double> mark_values =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"km", "speed", "speed_limit", "extent", "mark"});

    m_pointer->newKmMark_signal(mark_values.at(0),
                                mark_values.at(1),
                                mark_values.at(2),
                                mark_values.at(3),
                                mark_values.at(4));

}

void Export_Microservice::add_ServiceStarted(){

    // Здесь ещё должна быть команда во вьюху что сервис готов (самодиагностика)

   // Log_Microservice::create_LogRecord("Запустился микросервис для экспорта данных");

    qDebug() << "Экспорт подключился";
}

void Export_Microservice::add_NewParams(){

    QJsonObject newParams_Object;

    QList<QString> names = {"Lev", "RihtLeft", "RihtRight", "Sample", "DownLeft", "DownRight"};

    for(int i = 0; i < names.length(); i++){

       newParams_Object = help_add_NewParams(newParams_Object, i, names.at(i));

    }


    MQTT_Client::publish_JSON(export_topic + "4" , newParams_Object);
}

void Export_Microservice::add_NewGeneralInfo(){

    QJsonObject newGeneralInfo_Object;

    newGeneralInfo_Object.insert("versionApp", 1.0);
    newGeneralInfo_Object.insert("dateUpdateApp", "2022-10-03");
    newGeneralInfo_Object.insert("instructions", "436/р");
    newGeneralInfo_Object.insert("deviceName", "МДК: МДК-498");
    newGeneralInfo_Object.insert("userName", "Анциферов И.Н.");
    newGeneralInfo_Object.insert("dateUpdateDB", "2022-12-12");
    newGeneralInfo_Object.insert("roadName", "Октябрьская");
    newGeneralInfo_Object.insert("moving", 0);
    newGeneralInfo_Object.insert("orientation", 0);
    newGeneralInfo_Object.insert("checkType", 0);
    newGeneralInfo_Object.insert("reportingDate", "2023-04-12");


    MQTT_Client::publish_JSON(export_topic + "5" , newGeneralInfo_Object);
}

void Export_Microservice::close_Microservice(){

    QJsonObject command_Object;

    MQTT_Client::publish_JSON(export_topic + "0" , command_Object);

}
