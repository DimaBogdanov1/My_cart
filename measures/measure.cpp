#include <QDebug>

#include "measure.h"


QSettings settings("settings_demo.conf", QSettings::IniFormat );

Measure::Measure(int index)
{

    index_Measure = index;

    bias_path = "biase_" + QString::number(index_Measure);

    multiplier_path = "multiplier_" + QString::number(index_Measure);

    update_from_setting();
}

double Measure::get_x_in_line(int index_1, int index_2, float y_viser){

    QPointF point_1 =  Chart_points.at(index_1);

    QPointF point_2 =  Chart_points.at(index_2);

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


double Measure::x_coincidence(int index){

    qDebug() << "Совпадение index = " + QString::number(index) + " " + " x = " + QVariant(Chart_points.at(index).x()).toString() + " y = " + QVariant(Chart_points.at(index).y()).toString();

    return Chart_points.at(index).x();

}


double Measure::get_points_line(float y_viser){

    float answer = 0;

    int l = 0; // левая граница
      int r =  Chart_points.size(); // правая граница
      int mid;

      if(Chart_points.size() != 0){

          while ((l <= r) ) {

              mid = (l + r) / 2; // считываем срединный индекс отрезка [l,r]

              if (Chart_points.at(mid).y() == y_viser){

                  qDebug() << "fcoincidenceast mid = " + QString::number(mid);

                  answer = x_coincidence(mid);

                  break;

              }

             /* qDebug() << "\n";

              qDebug() << "y_viser = " + QString::number(y_viser);

              qDebug() << "mid = " + QString::number(mid);

              qDebug() << "l = " + QString::number(l);

              qDebug() << "r = " + QString::number(r); */

              if(mid + 1 >= r){

                 // qDebug() << "dis agreee";

                  answer = x_coincidence(mid);

                  break;
              }


              if((Chart_points.at(mid).y() < y_viser) && (Chart_points.at(mid + 1).y() > y_viser)) {

                  answer = get_x_in_line(mid, mid + 1, y_viser);

                  break;

               }



              //qDebug() << "Sample_points.at(mid).y() = " + QString::number(Sample_points.at(mid).y());

              if (Chart_points.at(mid).y() > y_viser) r = mid - 1; // проверяем, какую часть нужно отбросить
              else l = mid + 1;


          }

      }


    /*for(int i = 0; i < Sample_points.size(); i++){

        if(i != Sample_points.size() - 1){

            float last_y = Sample_points.at(i).y();

            float next_y = Sample_points.at(i + 1).y();

            if(last_y == y_viser){

                answer = coincidence(i);

                break;
            }

            if(next_y == y_viser){

                answer = coincidence(i + 1);

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

      return answer;

}



void Measure::update_from_setting(){

    this->bias_value = settings.value(bias_path).value<float>();

    this->multiplier_value = settings.value(multiplier_path).value<float>();

    qDebug() << "index_Measure = " + QString::number(index_Measure) + " bias_value = " + QString::number(bias_value) + " multiplier_value = " + QString::number(multiplier_value)  << "\n";

}

void Measure::set_params(float bias_value, float multiplier_value){

    this->bias_value = bias_value;

    this->multiplier_value = multiplier_value;

    settings.setValue(bias_path, bias_value);

    settings.setValue(multiplier_path, multiplier_value);


}


