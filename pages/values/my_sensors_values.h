#ifndef MY_SENSORS_VALUES_H
#define MY_SENSORS_VALUES_H


#include <QObject>

class My_Sensors_Values : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float charge_percent MEMBER charge_percent WRITE setChargePercent NOTIFY floatChanged)

   // Q_PROPERTY(float speed MEMBER speed WRITE setSpeed_Value NOTIFY floatChanged)

   // Q_PROPERTY(float odometer_value MEMBER odometer_value WRITE setOdometer_Value NOTIFY floatChanged)

public:

    inline explicit My_Sensors_Values(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void setChargePercent(float value) { charge_percent = value; emit floatChanged(value);}

   // Q_INVOKABLE void setSpeed_Value(float value) { speed = value; emit floatChanged(value);}

   // Q_INVOKABLE void setOdometer_Value(float value) { odometer_value = value; emit floatChanged(value);}

private:

  //  inline static float odometer_value = 0;

    inline static float charge_percent = 100;

  //  inline static float speed = 6;

signals:
    void floatChanged(const float &value);

};

#endif // MY_SENSORS_VALUES_H
