#ifndef SENSORS_VALUES_H
#define SENSORS_VALUES_H

#include <QObject>

class Sensors_Values : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool isPlay_Chart MEMBER isPlay_Chart  WRITE setPlay NOTIFY playChanged)

    Q_PROPERTY(float charge_percent MEMBER charge_percent WRITE setCharge NOTIFY chargeChanged)

    Q_PROPERTY(float speed MEMBER speed WRITE setSpeed NOTIFY speedChanged)

    Q_PROPERTY(float odometer_value MEMBER odometer_value WRITE setOdometer NOTIFY odometerChanged)

    Q_PROPERTY(float yaw_value MEMBER yaw_value WRITE setYaw NOTIFY yawChanged)

    Q_PROPERTY(float pitch_value MEMBER pitch_value WRITE setPitch NOTIFY pitchChanged)

public:

    inline explicit Sensors_Values(QObject *parent = nullptr) : QObject(parent) {}

   // Sensors_Values();

    inline static double odometer_value = 0;

    inline static double yaw_value = 0;

    inline static double pitch_value = 0;

    inline static float charge_percent = 100;

    inline static float speed = 6;

    inline static bool forward = true;

    inline static bool isRight_Riht = true;

    inline static bool isPlay_Chart = true;

    inline static bool checkFirstMove = false;


public slots:
    void setPlay(bool value) {

        if(isPlay_Chart){

            isPlay_Chart = false;
        }
        else{

            isPlay_Chart = true;
        }

        value = isPlay_Chart;

        emit playChanged(value);
    }

    void setCharge(float value) { charge_percent = value; emit chargeChanged(value);}

    void setSpeed(float value) { speed = value; emit speedChanged(value);}

    void setOdometer(float value) { odometer_value = value; emit odometerChanged(value);}

    void setYaw(float value) { yaw_value = value; emit yawChanged(value);}

    void setPitch(float value) { pitch_value = value; emit pitchChanged(value);}

signals:
    void playChanged(bool);
    void chargeChanged(float);
    void speedChanged(float);
    void odometerChanged(float);
    void yawChanged(float);
    void pitchChanged(float);

};

#endif // SENSORS_VALUES_H
