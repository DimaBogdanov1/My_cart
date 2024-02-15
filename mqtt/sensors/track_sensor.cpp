#include "track_sensor.h"
#include "mqtt/sensors/sensors_values.h"

#include <QDebug>

Track_Sensor::Track_Sensor()
{
    qDebug() << "dsds";

    check_dependencies_Error();
}

// Нажали Километровый Столб (Кнопка 0)
void Track_Sensor::km_Check() {

    if(fragmentDistance - 100 < Sensors_Values::odometer_value){


        // Если мы попали в диапазон, то всё ок
        if(Sensors_Values::odometer_value + borderPair.first  < fragmentDistance && fragmentDistance < Sensors_Values::odometer_value + borderPair.second){

        }
        else{

            errorValues.append(fragmentDistance - Sensors_Values::odometer_value);
        }

    }
    else{

        // Если показания одометра сильно меньше расстояния километра

        // Сигнал неправильная отбивка километра
    }


}

// Проверяем Есть ли зависимости в ошибках
void Track_Sensor::check_dependencies_Error() {

    int count = 0;

    std::sort(errorValues.begin(), errorValues.end());

    for(int i = 0; i < errorValues.length(); i++){

        if(i != errorValues.length() - 1){

            if(errorValues.at(i) == errorValues.at(i + 1)){

                count++;
            }
            else{

            }
        }

    }

    qDebug() << "Количество совпадений = " + QString::number(count);
}
