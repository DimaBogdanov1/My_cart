#include <QPair>
#include <QDebug>

#include "correct_points.h"

Correct_Points::Correct_Points()
{

}

float Correct_Points::correct_Point(int index, float value){

    float bias = settings->value(getPath(index, bias_path)).value<float>();

    float multi = settings->value(getPath(index, multi_path)).value<float>();

    if(multi == 0){

        multi = 1;
    }

    qDebug() << "bias = " + QString::number(bias);

    //qDebug() << "multi = " + QString::number(multi);

    return (value + bias) * multi;
}


QPair<bool, float> Correct_Points::check_Point(int index, float value){

    float newValue = correct_Point(index, value);

    QPair<bool, float> pair(false, newValue);

    if(bordersMap[index].first < newValue && newValue < bordersMap[index].second){

        pair.first = true;

    }
    else{

        qDebug() << "Точка не подходит " + QString::number(newValue);
    }

    return pair;
}

void Correct_Points::setParam_Measure(int index, float bias, float multi) {

    settings->setValue(getPath(index, bias_path), bias);

    settings->setValue(getPath(index, multi_path), multi);

}

QString Correct_Points::getPath(int index, QString halfPath) {

    return halfPath + QString::number(index);
}


QPair<float, float> Correct_Points::get_Borders(int index) {

    return bordersMap[index];

}
