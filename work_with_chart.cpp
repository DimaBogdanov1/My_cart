#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QStandardItem>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cctype>
#include <QtTest/QtTest>

#include <mythread.h>
#include "work_with_chart.h"



class Measure_3{

public:

    QList<QPointF> Chart_points;

    float bias_value; // Смещение

    float multiplier_value = 1; // Множитель


};

enum Measure_3s
      {
         Level_Measure_3,
         Riht_Left_Measure_3,
         Riht_Right_Measure_3,
         Sample_Measure_3,
         Down_Left_Measure_3,
         Down_Right_Measure_3
      };


QList<Measure_3> Measure_3_List;

using namespace std;


// Ширина колеи 1512 - 1548
Work_with_chart::Work_with_chart(QObject *parent) : QObject(parent)
{
    for(int i = 0; i < 6; i++){

        Measure_3 measure_3;

        Measure_3_List.append(measure_3);

    }

    qDebug() << "Создали Объекты для измерений";
}


int Work_with_chart::max(int a, int b)
{
    if(a > b)
        return a;
    return b;
}


void Work_with_chart::add_New_Picket()
{
    //  Здесь я беру текущий y графика и строю линию

    emit newPicket_signal(60); // Отправляем Сигнал

}

double eee(int index_1, int index_2, float y_viser){

    QPointF point_1 =  Measure_3_List[Sample_Measure_3].Chart_points.at(index_1);

    QPointF point_2 =  Measure_3_List[Sample_Measure_3].Chart_points.at(index_2);

   qDebug() << "Point x1 = " + QVariant(point_1.x()).toString() +  " y1 = " + QVariant(point_1.y()).toString();

   qDebug() << "Point x2 = " + QVariant(point_2.x()).toString() +  " y2 = " + QVariant(point_2.y()).toString();

    double k, b, answer;

    // point_1.y = k * point_1.x + b

    // point_2.y = k * point_2.x + b

    // b = (point_1.y - k * point_1.x)

   // point_2.y = k * point_2.x +  (point_1.y - k * point_1.x)


     // point_2.y = k * point_2.x + point_1.y - k * point_1.x

       // point_2.y = k * (point_2.x  - point_1.x)    + point_1.y

    // point_1.y = k * point_1.x + b

    // b = point_1.y - k * point_1.x


     //point_2.y = k * point_2.x + point_1.y - k * point_1.x

    // point_2.y = k * (point_2.x - point_1.x) + point_1.y

    if((point_2.x() - point_1.x()) == 0){ // k = 0 Линия Прямая y = b

        k = 0;

        answer = point_1.x();

    }
    else{

        k = (point_2.y() - point_1.y()) / (point_2.x() - point_1.x());

        b = point_1.y() - k * point_1.x();

        qDebug() << "b = " + QString::number(b);

        answer = (y_viser - b) / k;

    }


    qDebug() << "k = " + QString::number(k);

    return answer;

}


double aaa(int index){

    qDebug() << "Совпадение index = " + QString::number(index) + " " + " x = " + QVariant( Measure_3_List[Sample_Measure_3].Chart_points.at(index).x()).toString() + " y = " + QVariant(Measure_3_List[Sample_Measure_3].Chart_points.at(index).y()).toString();

    return  Measure_3_List[Sample_Measure_3].Chart_points.at(index).x();

}
void Work_with_chart::get_points_line(float y_viser){

    float answer = 0;

    int l = 0; // левая граница
      int r =  Measure_3_List[Sample_Measure_3].Chart_points.size(); // правая граница
      int mid;

      if( Measure_3_List[Sample_Measure_3].Chart_points.size() != 0){

          while ((l <= r) ) {

              mid = (l + r) / 2; // считываем срединный индекс отрезка [l,r]

              if ( Measure_3_List[Sample_Measure_3].Chart_points.at(mid).y() == y_viser){

                  qDebug() << "faaaast mid = " + QString::number(mid);

                  answer = aaa(mid);

                  break;

              }

             /* qDebug() << "\n";

              qDebug() << "y_viser = " + QString::number(y_viser);

              qDebug() << "mid = " + QString::number(mid);

              qDebug() << "l = " + QString::number(l);

              qDebug() << "r = " + QString::number(r); */

              if(mid + 1 >= r){

                 // qDebug() << "dis agreee";

                  answer = aaa(mid);

                  break;
              }


              if(( Measure_3_List[Sample_Measure_3].Chart_points.at(mid).y() < y_viser) && (Measure_3_List[Sample_Measure_3].Chart_points.at(mid + 1).y() > y_viser)) {

                  answer = eee(mid, mid + 1, y_viser);

                  break;

               }



              //qDebug() << "Sample_points.at(mid).y() = " + QString::number(Sample_points.at(mid).y());

              if ( Measure_3_List[Sample_Measure_3].Chart_points.at(mid).y() > y_viser) r = mid - 1; // проверяем, какую часть нужно отбросить
              else l = mid + 1;


          }

      }

    /*for(int i = 0; i < Sample_points.size(); i++){

        if(i != Sample_points.size() - 1){

            float last_y = Sample_points.at(i).y();

            float next_y = Sample_points.at(i + 1).y();

            if(last_y == y_viser){

                answer = aaa(i);

                break;
            }

            if(next_y == y_viser){

                answer = aaa(i + 1);

                break;
            }

            else if((last_y < y_viser) && (next_y > y_viser))
            {
                answer = eee(i, i + 1, y_viser);

            }


        }

    }

    */

     // qDebug() << "answer = " + QString::number(answer);

    emit newViserValue_signal(answer);
}

void Work_with_chart::clearPoints(){

     Measure_3_List[Sample_Measure_3].Chart_points.clear();

}

void Work_with_chart::openCSV()
{

    tmp_y = 0;

     Measure_3_List[Sample_Measure_3].Chart_points.clear();

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

        string num_frame, sk;

        for(int i = 0; i < 10; i++){

            // Извлечение всех значений в этой строке
            getline(stream, num_frame, delimiter);
        }

        getline(stream, sk, delimiter);


        //sk.erase(remove(sk.begin(),sk.end(), '  '),sk.end());

        QString aa = QString::fromStdString(sk);

        aa = aa.simplified();

        aa.replace(" ","");


       // qDebug() <<  QString::number(delete_space(sk));

        double val = QString(aa).toDouble();

        qDebug() << QString::number(val) ; // QString::fromStdString(sk);

        emit newPoint_Chart_signal(QString(aa).toDouble() , tmp_y); // Отправляем Сигнал

        Measure_3_List[Sample_Measure_3].Chart_points.append(QPointF(QString(aa).toDouble(), tmp_y));

       // Sample_points.append(QPointF(QString(aa).toDouble(), tmp_y));



        count++;
        tmp_y++;
    }
    work_file.close();



    // Тут нужно будет показывать процесс загрузки и блочить ui

}
