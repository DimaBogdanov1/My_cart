#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QStandardItem>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cctype>
#include <QtTest/QtTest>
#include <QSettings>
#include <QMetaEnum>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include <measures/measure.h>

#include <mythread.h>
#include "chart_work.h"


/*enum Measures
      {
         Level_Measure,
         Riht_Left_Measure,
         Riht_Right_Measure,
         Sample_Measure,
         Down_Left_Measure,
         Down_Right_Measure
      }; */

//QList<Measure> Measure_List;

using namespace std;


Chart_Work::Chart_Work(QObject *parent) : QObject(parent)
{    
    count_measures = 6; //QMetaEnum::fromType<Name_Measures::Measures>().keyCount();

    for(int i = 0; i < count_measures; i++){

        const Measure&  measure(i);

        Measure_List.append(measure);

    }

  //  qRegisterMetaType<Status>("Name_Measures");

  //  qmlRegisterUncreatableType<Name_Measures>("qml.measure", 1, 0, "Name_Measures", "Not creatable as it is an enum type");

  //  qDebug() << "Создали Объекты для измерений";

}


int Chart_Work::max(int a, int b)
{
    if(a > b)
        return a;
    return b;
}


void Chart_Work::change_check_Draw(bool check){

    check_drawChart = check;
}

void Chart_Work::dropLine(int y) {

    for(int i = 0; i < Measure_List.size(); i++){


    }

    for(int j = 0; j < y; j++){

       Measure_List[0].Chart_points.removeAt(0);

    }
}




void Chart_Work::change_param_measure(int index, float bias_value, float multiplier_value){

    qDebug() << "index = " + QString::number(index);

     Measure_List[index].set_params(bias_value, multiplier_value);

//    Measure_List[index].bias_value = bias_value;

  //  Measure_List[index].multiplier_value = multiplier_value;

}

void Chart_Work::calibPage_Ready()
{
    qDebug() << "Страница с калибровкой готова " + QString::number(count_measures);

    for(int i = 0; i < count_measures; i++){

        emit updateCalibBlock_signal(i, Measure_List[i].bias_value, Measure_List[i].multiplier_value);

    }

}


/*void Chart_Work::get_points_line(float y_viser){

    for(int i = 0; i < Measure_List.size(); i++){

       // Measure_List[i].get_points_line(y_viser);

        emit newViserValue_signal(i, Measure_List[i].get_points_line(y_viser));

    }

    //int i = 0;

}

*/

void Chart_Work::clearPoints(){

    for (int i = 0; i < Measure_List.size(); i++) {

        Measure_List[i].Chart_points.clear();

    }

}

void Chart_Work::add_ChartPoint(int index, float val, int y){

    val +=  Measure_List[index].bias_value;

   // if(index == 0){

     //   qDebug() << "Index = " + QString::number(index) + " val = " + QString::number(val);

    //}

    if(check_drawChart){

        emit newPoint_Chart_signal(index, val , y); // Отправляем Сигнал

    }

}

void Chart_Work::help_get_line( int index, string sk, int y){

    QString aa = QString::fromStdString(sk);

    aa = aa.simplified();

    aa.replace(" ","");

   // qDebug() <<  QString::number(delete_space(sk));

    qDebug() <<  QString::number(QString(aa).toDouble()) + " + bias = " + QString::number(Measure_List[index].bias_value);  // QString::fromStdString(sk);

    double val = QString(aa).toDouble() + Measure_List[index].bias_value;

    emit newPoint_Chart_signal(index, val , y); // Отправляем Сигнал

    Measure_List[index].Chart_points.append(QPointF(val, y));

    //qDebug() << " index = " + QString::number(index) + " y = " + QString::number(y);
}

void Chart_Work::openCSV()
{

    tmp_y = 0;

    clearPoints();

    //MyThread tread("A");

    //thread1.start();

    ifstream work_file("/Users/dimabogdanov/Documents/MyCart_res/railway.csv");

    string line;

    char delimiter = ';';

    //Читаем первую строку, чтобы отбросить ее, так как она является заголовком
    getline(work_file, line);

   int count = 0;

    // Прочитали все строчки
    while (getline(work_file, line))
    {
        if(count >= 100){

            break;
        }
        stringstream stream(line); // Преобразование строки в поток

        string num_frame, sk, down_left, down_right, riht_left, riht_right, level;

        for(int i = 0; i < 8; i++){

            // Извлечение всех значений в этой строке



            getline(stream, num_frame, delimiter);
        }

        getline(stream, level, delimiter);

        help_get_line( 0, level, tmp_y);


        getline(stream, num_frame, delimiter);


        getline(stream, sk, delimiter);

        getline(stream, down_left, delimiter);

        getline(stream, down_right, delimiter);

        getline(stream, riht_left, delimiter);

        getline(stream, riht_right, delimiter);


        help_get_line( 3, sk, tmp_y);

        help_get_line( 4, down_left, tmp_y);

        help_get_line( 5, down_right, tmp_y);

        help_get_line( 1, riht_left, tmp_y);

        help_get_line( 2, riht_right, tmp_y);


        tmp_y++;



        count++;
    }
    work_file.close();



    // Тут нужно будет показывать процесс загрузки и блочить ui

}

