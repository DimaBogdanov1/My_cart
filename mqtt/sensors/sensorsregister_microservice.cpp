#include "sensorsregister_microservice.h"
#include "mqtt/mqtt_client.h"
#include "mqtt/mqtt_help.h"
#include "mqtt/sensors/sensors_values.h"

#include "../Notifications_Lib/notifications_lib.h"

#include "pages/values/map_values.h"

SensorsRegister_Microservice::SensorsRegister_Microservice(MQTT_Client *pointer)
{

    m_pointer = pointer;
}

void SensorsRegister_Microservice::add_Command(int num, const QByteArray &message){

    switch(num){

    case Result_Diagnostic_Command:

        result_diagnostic_Command(message);

        break;

    case Ins_Command:

        add_INS_Command(message);

        break;

    case RC_Command:

        add_RC_Command(message);

        break;

    case Speed_Command:

        add_Speed_Command(message);

        break;

    case Charge_Command:

        add_Charge_Command(message);

        break;

    }
}

// Так как сервисы нижнего уровня стоят на автозагрузке нет смысла проверять его на запуск
void SensorsRegister_Microservice::get_Diagnostic(bool startDiagnostic) {

    qDebug() << "Запрос на диагностику железа " + QVariant(startDiagnostic).toString();

    QString topic = "backend/ins/0";

    QJsonObject diagnostic_Object;

    diagnostic_Object.insert("diagnostic", int(startDiagnostic));

    MQTT_Client::publish_JSON(topic , diagnostic_Object);
}

void SensorsRegister_Microservice::result_diagnostic_Command(const QByteArray &message) {

    // Если у нас отвалился лазер, то это обработается здесь и уйдёт во вьюху

    qDebug() << "Результат новой диагностики";

    QList<double> laser_values =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"laser_left", "laser_right", "notification"});


    if(laser_values.length() == 3){

      emit m_pointer->newDiagnostic_signal(laser_values.at(0), laser_values.at(1));

        if(laser_values.at(2) != -1){

           // emit m_pointer->newNotification_signal("Новое уведомление", 0);

            Notification notification = Notifications_Lib::get_Notification(laser_values.at(2));

           // qDebug() << "text = " + notification.getText();

            emit m_pointer->newNotification_signal(notification.getText(), notification.getStatus());

        }

    }

    //emit MQTT_Client->newGPS_signal(22,33,22);  //   ignal_a();

  //  emit MQTT_Client->newGPS_signal(22,33,22);

  //  emit MQTT_Client::newGPS_signal(22,33,22);

}

void SensorsRegister_Microservice::add_RC_Command(const QByteArray &message) {

    QList<double> button_num =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"button"});

    if(button_num.length() == 1){

        qDebug() << "Номер кнопки: " + QString::number(button_num.at(0));

        emit m_pointer->newButtonClick_signal(button_num.at(0));

    }

}

void SensorsRegister_Microservice::add_INS_Command(const QByteArray &message){

    QList<double> ins_values =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"latitude", "longitude", "yaw", "pitch" });

    if(ins_values.length() == 4){

       /* Map_Values a;

        a.setYaw(ins_values.at(2));

        a.setPosition(QGeoCoordinate(ins_values.at(0), ins_values.at(1)));

        a.add_Coordinate(QGeoCoordinate(ins_values.at(0), ins_values.at(1)));

        a.floatChanged(ins_values.at(2)); */

        //Map_Values::setYaw(ins_values.at(2));

        Sensors_Values::yaw_value = ins_values.at(2);

        Sensors_Values::pitch_value = ins_values.at(3);

        emit m_pointer->newGPS_signal(ins_values.at(0), ins_values.at(1), ins_values.at(2), ins_values.at(3));

    }
}


void SensorsRegister_Microservice::add_Speed_Command(const QByteArray &message){

    QList<double> values =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"speed"});

    if(values.length() == 1){

        emit m_pointer->newSpeed_signal(values.at(0));

    }
}

void SensorsRegister_Microservice::add_Charge_Command(const QByteArray &message){

    QList<double> values =  MQTT_Help::getValueFrom_JSON(message, QList<QString> {"charge"});

    if(values.length() == 1){

        emit m_pointer->newCharge_signal(values.at(0));

    }
}

