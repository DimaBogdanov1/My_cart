#ifndef MOVING_VALUES_H
#define MOVING_VALUES_H

#include <QObject>

class Moving_Values : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float odometer_value MEMBER odometer_value WRITE setOdometer_Value NOTIFY floatChanged)

    Q_PROPERTY(bool forward MEMBER forward WRITE setForward NOTIFY boolChanged)

    Q_PROPERTY(bool isRight_Riht MEMBER isRight_Riht WRITE setForward NOTIFY boolChanged)

    Q_PROPERTY(bool isPlay_Chart MEMBER isPlay_Chart  WRITE setPlay NOTIFY playChart_Changed)

    Q_PROPERTY(bool checkFirstMove MEMBER checkFirstMove  WRITE setCheckFirstMove NOTIFY boolChanged)

    Q_PROPERTY(float speed MEMBER speed WRITE setSpeed_Value NOTIFY floatChanged)

public:

    inline explicit Moving_Values(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void setOdometer_Value(float value) { odometer_value = value; emit floatChanged(value);}

    Q_INVOKABLE void setForward(bool value) {forward = value;}

    Q_INVOKABLE void setIsRight_Riht(bool value) {isRight_Riht = value;}

    Q_INVOKABLE void setCheckFirstMove(bool value) {checkFirstMove = value;}

    Q_INVOKABLE void setSpeed_Value(float value) { speed = value; emit floatChanged(value);}


    Q_INVOKABLE void setPlay(bool value) {

        if(isPlay_Chart){

            isPlay_Chart = false;
        }
        else{

            isPlay_Chart = true;
        }

        value = isPlay_Chart;

        emit playChart_Changed(value);

    }

    bool get_isPlay_Chart(){

        return isPlay_Chart;
    }

    inline static double odometer_value = 0;

    inline static bool forward = true;

    inline static bool isRight_Riht = true;

    inline static bool isPlay_Chart = true;

    inline static bool checkFirstMove = false;

    inline static float speed = 0;



signals:

    void playChart_Changed(bool);

    void boolChanged(const bool &value);

    void floatChanged(const float &value);

};

#endif // MOVING_VALUES_H
