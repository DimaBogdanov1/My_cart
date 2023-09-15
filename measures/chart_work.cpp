#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QStandardItem>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cctype>
#include <QtTest/QtTest>

#include <measures/measure.h>
#include "measures/name_measures.h"

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

QList<Measure> Measure_List;

using namespace std;


Chart_Work::Chart_Work(QObject *parent) : QObject(parent)
{
    for(int i = 0; i < 6; i++){

        Measure measure;

        Measure_List.append(measure);

    }

    qDebug() << "Создали Объекты для измерений";
}


int Chart_Work::max(int a, int b)
{
    if(a > b)
        return a;
    return b;
}

void Chart_Work::add_New_Picket()
{
    //  Здесь я беру текущий y графика и строю линию

    emit newPicket_signal(60); // Отправляем Сигнал

}

void Chart_Work::change_param_measure(int index, float bias_value, float multiplier_value){

    qDebug() << "index = " + QString::number(index);

    Measure_List[index].bias_value = bias_value;

    Measure_List[index].multiplier_value = multiplier_value;

}


void Chart_Work::get_points_line(float y_viser){

    for(int i = 0; i < Measure_List.size(); i++){

       // Measure_List[i].get_points_line(y_viser);

        emit newViserValue_signal(i, Measure_List[i].get_points_line(y_viser));

    }

    //int i = 0;

}

void Chart_Work::clearPoints(){

    for (int i = 0; i < Measure_List.size(); i++) {

        Measure_List[i].Chart_points.clear();

    }

}

void Chart_Work::help_get_line( int index, string sk, int y){

    QString aa = QString::fromStdString(sk);

    aa = aa.simplified();

    aa.replace(" ","");

   // qDebug() <<  QString::number(delete_space(sk));

    qDebug() <<  QString::number(QString(aa).toDouble()) + " + " + QString::number(Measure_List[index].bias_value);  // QString::fromStdString(sk);

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

        //sk.erase(remove(sk.begin(),sk.end(), '  '),sk.end());

       /* QString aa = QString::fromStdString(sk);

        aa = aa.simplified();

        aa.replace(" ","");


       // qDebug() <<  QString::number(delete_space(sk));

        double val = QString(aa).toDouble();

        qDebug() << QString::number(val) ; // QString::fromStdString(sk);

        emit newPoint_Chart_signal(Name_Measures::Sample_Measure, QString(aa).toDouble() , tmp_y); // Отправляем Сигнал

        Measure_List[Name_Measures::Sample_Measure].Chart_points.append(QPointF(QString(aa).toDouble(), tmp_y));

        tmp_y++; */

      //  Measure_List[Name_Measures::Down_Left_Measure].Chart_points.append(QPointF(QString(aa).toDouble(), tmp_y));

       // Sample_points.append(QPointF(QString(aa).toDouble(), tmp_y));



        count++;
    }
    work_file.close();



    // Тут нужно будет показывать процесс загрузки и блочить ui

}

