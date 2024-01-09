#include "sensorsregister_microservice.h"

SensorsRegister_Microservice::SensorsRegister_Microservice()
{

}

// Большая функция по распределению команд для сервиса датчиковой аппаратуры
void SensorsRegister_Microservice::add_Command(int num, const QByteArray &message){

    switch(num){

    case Diagnostic:

        diagnostic_Command(message);

        break;

    case Ins:

        add_INS(message);

        break;

    case RC:

        add_RC_Command(message);

        break;

    }
}


void SensorsRegister_Microservice::diagnostic_Command(const QByteArray &message) {

    // Если у нас отвалился лазер, то это обработается здесь и уйдёт во вьюху
}

void SensorsRegister_Microservice::add_RC_Command(const QByteArray &message) {

  /*  QList<double> button_num = getValueFrom_JSON(message, QList<QString> {"button"});

    if(button_num.length() == 1){

        qDebug() << "Номер кнопки: " + QString::number(button_num.at(0));

    }

    */
}

void SensorsRegister_Microservice::add_INS(const QByteArray &message){

//    QList<double> ins_values = getValueFrom_JSON(message, QList<QString> {"latitude", "longitude", "yaw" });

//    return ins_values;
}
