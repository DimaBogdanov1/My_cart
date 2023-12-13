#include <QPainter>

#include "export/pdf/km/km_draw.h"
#include "objects_draw.h"

#include "export/pdf/my_pdf.h"
#include "export/pdf/pdf_values.h"

Km_Draw::Km_Draw(My_pdf *pointer, float heightTitle, float leftX, float rightX, float heightKm)
{

      //Km_Block works(My_pdf);
    m_pointer = pointer;

    basic_km_width = km_mm * 10 * m_pointer->coef; //  diff - dop_value;

    y_TopRail = heightTitle + 3 * m_pointer->coef;

    y_BottomRail = heightTitle + 4 * m_pointer->coef;

    this->leftX = leftX;

    this->rightX = rightX;

    this->heightKm = heightKm;



    this->km_y = heightTitle + heightKm;



    coun_km = m_pointer->counKm_OnPages.at(m_pointer->counLayer - 1);


    if(m_pointer->counLayer ==  m_pointer->counKm_OnPages.length()){

        qDebug() << "Последнее значение " +  QString::number(m_pointer->counKm_OnPages.at(m_pointer->counLayer - 1));

        float a = m_pointer->counKm_OnPages.at(m_pointer->counLayer - 1) - coun_km;

        qDebug() << "Дробная чать = " +  QString::number(a);


        dop_value = a * km_mm * m_pointer->coef;

        m_pointer->needNextPage = false;

    }
    else{

        m_pointer->needNextPage = true;

        dop_value = 0;

    }




   /* coun_km = m_pointer->distanse / 1000;

    dop_value =  (((m_pointer->distanse - coun_km * 1000) * km_mm) / 1000) * m_pointer->coef;

    basic_km_width = km_mm * 10 * m_pointer->coef; //  diff - dop_value;

    float remainder = ((rightX - leftX) - basic_km_width);

  //  qDebug() << "Расстояние остатка " + QString::number(remainder);

   // qDebug() << "dop_value = " + QString::number(dop_value);





    if(coun_km > 10){

        m_pointer->needNextPage = true;

        if(coun_km > 11){

            coun_km = 11;

        }


        m_pointer->distanse -= coun_km * 1000;

       // qDebug() << "Нужна вторая страница!!!";

       // qDebug() << "Оставшееся расстояние = " + QString::number(m_pointer->distanse);

    }
    else{

        if(coun_km == 10 && dop_value > remainder){

          //  coun_km = 11;

            m_pointer->needNextPage = true;

           // m_pointer->distanse -= 10 * 1000 + remainder;

            m_pointer->distanse = 0;

       //     qDebug() << "Нужна вторая страница!!!";
        }
        else{

            m_pointer->needNextPage = false;

        }


    } */






    left_finish_x = rightX - (coun_km) * km_mm * m_pointer->coef - dop_value;

   // this->left_finish_x = left_finish_x;


    //left_finish_x = rightX - (coun_km - 1) * km_mm * m_pointer->coef;



  //  qDebug() << "Финальная точка " + QString::number(left_finish_x);





   //m_pointer->drawLine(QPointF(left_finish_x, y_TopRail + 1000), QPointF(left_finish_x, y_TopRail), *m_pointer->testPen);



    rihtHeight =   m_pointer->spacingMeasure / 2; //  0.6 * m_pointer->coef   ; //m_pointer->spacingMeasure / 2;

    createKm_Block(heightTitle, leftX, rightX, heightKm);

    if(m_pointer->counLayer == 1){

        Objects_Draw objects(m_pointer, left_finish_x, rightX, y_TopRail, y_BottomRail, heightTitle, km_y);

    }


    createErrorSensorsLine(rightX - 4000, rightX - 6000, heightTitle + 12);
}




void Km_Draw::createSleepers(float y_TopRail, float y_BottomRail, float rightX, int index_type){


    int index_start_sleeper = 0;

    int coun_mini_sleeper = 3;

    int bias_cycle = 1;

    switch(index_type){

    case Wood:

        index_start_sleeper = 1;

        coun_mini_sleeper = 2;

        break;

    case Reinforced_Concrete:

        bias_cycle = 2;

        break;

    case Before_1996:
        break;


    }



    // Размер трёх рисок = 33.157
    // 6 * 3 = 18 => пробел 15.157 / 3 примерно 5

    // 10 рисок на 1 км пробел между рисками 1 мм

    // блок из трёх рисок 0.7 мм
    // 1 км - 24 мм
    // 24 - (0.7 * 10) => 17 / 9  => 1.8 отсутп

    float a = (((basic_km_width ) / 10) / m_pointer->coef)  ;

    float space = ((a - (10 * 0.4)) / 10 )  * m_pointer->coef ;//+ 0.9;//- 5;//12 / 9; // + вправо

  //  qDebug() << "Space = "  + QString::number(space);

    for(int i = 0; i < coun_km; i++){

        float tmp_x = rightX -  (i + 1 ) * one_km_width; //      24 * m_pointer->coef;

      //  m_pointer->drawLine(QPointF(tmp_x, y_TopRail + 600), QPointF(tmp_x, y_TopRail), *m_pointer->basicPen);

    }

    float new_space =  space / 2  - 10; // 10 - это скидка из-за пера


    int count_dop_sleepers = (dop_value * 10) /  one_km_width;

   // qDebug() << "Количество тройных рисок на дополнительное значение " + QString::number( count_dop_sleepers);

    int count = coun_1996_sleepers_on_km;


    int count_cycle = coun_km + 1;

    if(count_dop_sleepers == 0){

        count_cycle = coun_km;
    }

    for(int i = 0; i < count_cycle; i++){ // 11 - Здесь количество километров на графике

        for(int k = 0; k < count; k++){ // 10 - Здесь количество тройных рисок на километр

            for(int j = index_start_sleeper; j < coun_mini_sleeper; j += bias_cycle){ // for(int j = 0; j < 3; j++){

                float x =  rightX -  new_space - ((j + 1) * 0.2 * m_pointer->coef);

                //rightX -  new_space - ((j + 1) * 0.2 * m_pointer->coef); - тройная // for(int j = 0; j < 3; j++){
                //  rightX -  new_space - ((j + 1) * 0.2 * m_pointer->coef); - одиночная //for(int j = 1; j < 2; j++){

                m_pointer->drawLine(QPointF(x, y_TopRail), QPointF(x, y_BottomRail), Pdf_Values::getPen(Pdf_Values::KmPen));

            }

            new_space +=  (space + 0.4 * m_pointer->coef); // k * (20 * m_pointer->coef);


            if(i == coun_km){ // Если это последнее значение

                if(count_dop_sleepers != 0){

                    qDebug() << "Лишний раз заходим сюда!!!";
                    count = count_dop_sleepers;

                }
                else{

                    break;
                }
            }


        }




    }
}

void Km_Draw::createRiht(int x_start, int x_stop, bool isTop){

    float tmp = x_start - x_stop;


    // 24 * coef - 100 %

    // 400 - ?

    // percent = (400 * 100) / 24 * coef

    // 24 * coef - 35
    // 400 - ?


    // (400 * 35) / 24 * coef


    //m_pointer->drawLine(QPointF(tmp, y_TopRail), QPointF(tmp, y_TopRail +  600), *m_pointer->basicPen);


    // basic_km_width / 10 - 35 рихтовок
    // tmp - ?

    // tmp * 35 / (basic_km_width / 10)

    int coun = (tmp * counRiht) / one_km_width;

  //  qDebug() << "x_start = " + QString::number(x_start) ;

  //  qDebug() << "x_stop = " + QString::number(x_stop) ;

   // qDebug() << "tmp = " + QString::number(tmp) ;

    //qDebug() << "basic_km_width / 10 = " + QString::number(one_km_width) ;


   // qDebug() << "Количество рисок = " + QString::number(coun) ;


    //float coun =  (x_stop *  counRiht) / (24 * m_pointer->coef);

    //qDebug() << "Количество рисок = " + QString::number(coun) ;

    float one_val = one_km_width / counRiht;

    for(int j = 0; j < coun ; j++){

        float km_val =  x_start - (j + 1) * one_val;  //    km_x - (i + 1) * (diff / 35); // * (10 - i);

        if(isTop){

            m_pointer->drawLine(QPointF(km_val, y_TopRail), QPointF(km_val, y_TopRail - rihtHeight), Pdf_Values::getPen(Pdf_Values::KmPen));
        }
        else{

            m_pointer->drawLine(QPointF(km_val, y_BottomRail), QPointF(km_val, y_BottomRail + rihtHeight), Pdf_Values::getPen(Pdf_Values::KmPen));

        }

    }

}

void Km_Draw::createErrorSensorsLine(int x_start, int x_stop, int y){

    m_pointer->drawLine(QPointF(x_start, y), QPointF(x_stop, y), Pdf_Values::getPen(Pdf_Values::Error_Sensors));

}

void Km_Draw::createHelpLine(int x_start, int x_stop, int y){

    m_pointer->drawLine(QPointF(x_start, y), QPointF(x_stop, y), Pdf_Values::getPen(Pdf_Values::KmPen));

}


void Km_Draw::createKmValues(float km_y){
    // 24 мм - 1 пикет

    // 24 - 100 %
    // 3 - ?    3 * 100 / 24

    // 100 % - 35 рисок
    // e


    float e = dop_value * 100 / (km_mm * m_pointer->coef);

    int count_dop = (e * counRiht) / 100;

   // qDebug() << "Количество рихтовочных рисок на дополнительное значение " + QString::number( count_dop);

    float one_val = one_km_width / counRiht;

    float last_val = 0;

    int count = counRiht;


    int count_cycle = coun_km + 1;

    if(count_dop == 0){

        count_cycle = coun_km;
    }

    for(int i = 0; i < count_cycle; i++){ // 11 - Здесь количество километров на графике

        for(int j = 0; j < count; j++){

          //  float a = (last_km_x - km_x) / count;

            float km_val =  rightX - last_val - (j + 1) * one_val;  //* a;

            m_pointer->drawLine(QPointF(km_val, km_y), QPointF(km_val, km_y + rihtHeight), Pdf_Values::getPen(Pdf_Values::KmPen));

            if(i == coun_km){ // Если это последнее значение

                if(count_dop != 0){

                    count = count_dop;

                }
                else{

                    break;
                }
            }
        }

        last_val +=  counRiht * one_val ;

    }


}

void Km_Draw::createKm_Block(float heightTitle, float leftX, float rightX, float heightKm){


    m_pointer-> drawLine(QPointF(left_finish_x, y_TopRail), QPointF(rightX, y_TopRail),  Pdf_Values::getPen(Pdf_Values::KmPen));


    m_pointer->drawLine(QPointF(left_finish_x, y_BottomRail), QPointF(rightX, y_BottomRail),  Pdf_Values::getPen(Pdf_Values::KmPen));





  //  int picket_count = 11;




    //dop_value = 3 * m_pointer->coef;

    diff = rightX - left_finish_x; // rightX - leftX; // У нас ситуация 1000м + копеечка

    //basic_km_width = km_mm * 10 * m_pointer->coef; //  diff - dop_value;

    one_km_width = basic_km_width / 10;

    createKmValues(km_y);


    for(int i = 0; i < coun_km; i++){

        float km_x = rightX - ((i + 1) * ((basic_km_width) / 10)); // rightX - ((i + 1) * ((diff - dop_value) / 10)); // * (10 - i);

        m_pointer->drawLine(QPointF(km_x, km_y), QPointF(km_x, km_y - m_pointer->spacingMeasure), Pdf_Values::getPen(Pdf_Values::Basic));

        QString km_num = QString::number((11 * (m_pointer->counLayer - 1)) +  i + 2);

        QList<float> size = m_pointer->getSize(km_num);

        m_pointer->drawText(QPointF(km_x - m_pointer->spacingMeasure * 1.5 - size[0] / 2, km_y - m_pointer->spacingMeasure / 2),  km_num);


    }

   // createRiht(rightX, rightX - 3 * one_km_width, false);


    //m_pointer->drawLine(QPointF(rightX - 1200, y_TopRail), QPointF(rightX - 1200, y_TopRail + 700), *m_pointer->basicPen);


   // createRiht(rightX - 2 * one_km_width, rightX - 4 * one_km_width, true);


   // createRiht(rightX - 4 * one_km_width, left_finish_x, false);




    createRiht(rightX, rightX - diff / 2, true);

    createRiht(rightX - diff / 2 , left_finish_x, false);



    QString km_str = QString::number(m_pointer->km);

    QList<float> size = m_pointer->getSize(km_str);


    m_pointer->drawText(QPointF(rightX - size[0] - m_pointer->spacingMeasure, km_y - m_pointer->spacingMeasure), km_str);


    m_pointer->drawLine(QPointF(left_finish_x, km_y), QPointF(rightX, km_y), Pdf_Values::getPen(Pdf_Values::Basic));


    createHelpLine(rightX, rightX - diff / 4, km_y - size[1] * 0.75 - m_pointer->spacingMeasure);

    createHelpLine(rightX - diff / 2, left_finish_x, km_y - size[1] * 0.75  -m_pointer->spacingMeasure);


    //createSleepers(y_TopRail, y_BottomRail, rightX, Before_1996);


    createSleepers(y_TopRail, y_BottomRail, rightX, Wood);

    // 1 км - 35 значений



}


int Km_Draw::getLeftFinishX(){

    return left_finish_x;
}
