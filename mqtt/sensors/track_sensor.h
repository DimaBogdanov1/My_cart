#ifndef TRACK_SENSOR_H
#define TRACK_SENSOR_H

#include <QPair>
#include <QList>

class Track_Sensor
{
public:
    Track_Sensor();

    float startKm;

    float startM;

    float fragmentDistance = 1100;


private:

    QPair<float, float> borderPair = {-5, 5};

    QList<float> errorValues = {1, 3, 2, 4, 1, 1, 3, };

   // QList<QList<float>> value = {};


    float coefKm = 1;

    void km_Check();

    void check_dependencies_Error();

};

#endif // TRACK_SENSOR_H
