#include <QPainter>

#include "analysis_draw.h"
#include "table_element.h"
#include "export/pdf/pdf_values.h"

Analysis_Draw::Analysis_Draw(My_pdf *pointer, float y_top, float rightX)
{
    m_pointer = pointer;

    this->y_top = y_top + m_pointer->spacingMeasure;

    this->rightX = rightX;


    drawTable(titles, sizes, m_pointer->printer->width(), true, true);


    drawInfoBlock_Stage_1("523", "850", "55", "1535", "-", m_pointer->printer->width()  - 3000, true);


    drawInfoBlock_Stage_1("111", "850", "55", "1535", "-", m_pointer->printer->width()  - 4000, false);


    drawInfoBlock_Stage_1("666", "850", "55", "1535", "-", m_pointer->printer->width()  - 6000, false);

    drawCorrect_or_Station_Block(true, m_pointer->printer->width()  - 8000, 956, Correct_Arrow, -2);

    drawCorrect_or_Station_Block(true, m_pointer->printer->width()  - 9000, 111, Correct_GNSS, -2);

    drawCorrect_or_Station_Block(true, m_pointer->printer->width()  - 10000, 718, Correct_Km_Pole, -2);

    drawCorrect_or_Station_Block(true, m_pointer->printer->width()  - 11000, 976, Correct_Not_Required, NULL);


    drawInfoBlock_Stage_1(false, true, m_pointer->printer->width() - m_pointer->width_Measure);

    drawInfoBlock_Stage_1(true, true, rightX);



    QList<QString> tmp = {"119", "Р", "2", "22", "16", "1", "Cтр."};

    drawTable(tmp, sizes, m_pointer->printer->width() - 12000, false, true);

    drawTable(tmp, sizes, m_pointer->printer->width() - 12000 + m_pointer->width_Measure, false, false);



    drawCorrect_or_Station_Block(false, m_pointer->printer->width()  - 12500, 976, NULL, NULL);



    QList<QString> a = {"523", "R:850", "h:55", "Ш:1535", "И:-"};

    QList<float> b = {6, 7, 7, 7, 6};

   // drawTable(a,  b, m_pointer->printer->width()  - 2000, true);


}

void Analysis_Draw::drawCorrect_or_Station_Block(bool isCorrectBlock, float x, int meter_value, int index, int value){

    QString str_1 = "Привязка координат: Коррекция";



    QString str_2;



    //QString title = "Привязка координат: Коррекция";


   // m_pointer->drawLine(QPointF(x - m_pointer->width_Measure - 300, m_pointer->printer->height()), QPointF(x - m_pointer->width_Measure - 300, y_top), *m_pointer->basicPen);


    QRect rect(x - 2 * m_pointer->width_Measure, y_top, m_pointer->width_Measure * 2,  m_pointer->printer->height() - y_top);



    m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

    m_pointer->painter->drawRect(rect);



    float fist_size =   6 * m_pointer->coef; //  4 * m_pointer->coef;

    float b = m_pointer->printer->height(); //  4 * m_pointer->coef;


   // m_pointer->drawTextByCentr(m_pointer->width_Measure, x, b, a, "ewewewew");



    m_pointer->drawRotateText(x - 2 * m_pointer->width_Measure, b - fist_size, x - m_pointer->width_Measure, m_pointer->printer->height(), QString::number(meter_value), true);


   // m_pointer->drawTextByCentr(m_pointer->width_Measure, x - m_pointer->width_Measure, b, fist_size,  QString::number(meter_value));



    QString meter = " м";

    switch(index){

        case Correct_Not_Required:

        str_2 = "координат не требовалась";

        break;

        case Correct_Km_Pole:

        str_2 = "положения км. столба на " + QString::number(value) + meter;

        break;

        case Correct_GNSS:

        str_2 = "привязки по ГНСС на " + QString::number(value) + meter;

        break;

        case Correct_Arrow:

        str_2 = "положения по стрелке " + QString::number(value) + meter;

        break;

    }



    if(!isCorrectBlock){

        str_1 = "Борисова Грива-Ладожское озеро";

        str_2 = "Станция: Борисово Грива";
    }

    m_pointer->drawRotateText(x - 2 * m_pointer->width_Measure, y_top, x - m_pointer->width_Measure, b - fist_size, str_1, 1);

    m_pointer->drawRotateText(x - m_pointer->width_Measure, y_top, x, b - fist_size, str_2, 1);





    m_pointer->drawLine(QPointF(x , m_pointer->printer->height() - fist_size), QPointF(x - 2 * m_pointer->width_Measure  ,  m_pointer->printer->height() - fist_size), Pdf_Values::getPen(Pdf_Values::Basic));


    m_pointer->drawLine(QPointF(x - m_pointer->width_Measure , m_pointer->printer->height()), QPointF(x - m_pointer->width_Measure  , y_top), Pdf_Values::getPen(Pdf_Values::Basic));

}


void Analysis_Draw::drawInfoBlock_Stage_2(QString title, float x, bool isNeedRect){

    if(isNeedRect){

        QRect rect(x - m_pointer->width_Measure, y_top, m_pointer->width_Measure,  m_pointer->printer->height() - y_top);

        m_pointer->painter->drawRect(rect);

    }

    m_pointer->drawRotateText(x - m_pointer->width_Measure, y_top, x, m_pointer->printer->height(), title, 1);


  //  m_pointer->drawLine(QPointF(x - m_pointer->width_Measure / 4,  y_top), QPointF(x - m_pointer->width_Measure / 4,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

   // m_pointer->drawLine(QPointF(x - m_pointer->width_Measure * 0.75,  y_top), QPointF(x - m_pointer->width_Measure * 0.75,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

}

void Analysis_Draw::drawInfoBlock_Stage_1(bool isRepair, bool isUp, float x){

    QString title_form_db = "Капремонт старый 8.1994";

    QString arrow = "↑";

    if(!isUp){

        arrow = "↓";
    }

    QString title = arrow + " " + title_form_db;

    if(!isRepair){

        title = "Ручей-Борисова Грива Км: 38";
    }

    drawInfoBlock_Stage_2(title, x, isRepair);

}


void Analysis_Draw::drawInfoBlock_Stage_1(QString num, QString r, QString h, QString sample, QString tmp, float x, bool isCurve){

    QString curve = "";

    QString last_str = "Ш: " + sample + " " +
                       "И: " + tmp;

    if(isCurve){

        curve = "кривая факт. ";

        last_str = "";
    }



    QString title =
            num + " "
            + curve +
            "R: " + r + " " +
            "h: " + h + " " +
            last_str;

    drawInfoBlock_Stage_2(title, x, true);

}

void Analysis_Draw::drawTitle(Table_Element element, float x, bool needDrawLine, bool isBasicPen){


    if(isBasicPen){

        m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

    }
    else{

        m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::BasicOpacity));

    }

   // m_pointer->drawTextByCentr(m_pointer->width_Measure, x, element.y_start, element.y_stop, element.title);


    m_pointer->drawRotateText(element.x_start, element.y_start, element.x_finish, element.y_finish, element.title, 0);



   /* m_pointer->painter->rotate(-90);

    QList<float> size = m_pointer->getSize(element.title);

    float a = (element.y_stop - size[0]) / 2 ;

    float b = (m_pointer->width_Measure - size[1])  * 1.5;


  //  qDebug() << "Size[1] = " + QString::number(size[1]);

    qDebug() << "element.y_start  = " + QString::number(element.y_start );

    qDebug() << "element.y_stop  = " + QString::number(element.y_stop );

    qDebug() << "m_pointer->width_Measure  = " + QString::number(m_pointer->width_Measure );

  //  qDebug() << "b = " + QString::number(b);


    m_pointer->painter->drawText(-1 * element.y_start + a,  x - b, element.title);


    m_pointer->painter->rotate(90); */


    if(needDrawLine){

        m_pointer->drawLine(QPointF(element.x_start, element.y_start), QPointF(element.x_finish, element.y_start), Pdf_Values::getPen(Pdf_Values::Basic));

    }



    //////////
 //   m_pointer->drawLine(QPointF(m_pointer->printer->width() - m_pointer->width_Measure / 4,  y_top), QPointF(m_pointer->printer->width() - m_pointer->width_Measure / 4,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

   // m_pointer->drawLine(QPointF(m_pointer->printer->width() - m_pointer->width_Measure * 0.75,  y_top), QPointF(m_pointer->printer->width() - m_pointer->width_Measure * 0.75,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

}

void Analysis_Draw::drawTable(QList<QString> titles,  QList<float> sizes, float x, bool needDrawLine, bool isBasicPen){

    //borderPen = new QPen(Qt::black, 6, Qt::DotLine, Qt::RoundCap);

    m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

    if(needDrawLine){

        QRect rect(x - m_pointer->width_Measure, y_top, m_pointer->width_Measure,  m_pointer->printer->height() - y_top);

        m_pointer->painter->drawRect(rect);

    }



    float x_start = x - m_pointer->width_Measure;

    float y_start;


    float x_finish = x;

    float y_finish = m_pointer->printer->height();

   // float last_val = 0 ;

    for(int i = 0; i < titles.length(); i++){

        // Table_Element elem()

        //Table_Element element_1(r, sizes.at(i) * m_pointer->coef,      r - sizes.at(i) * m_pointer->coef,     titles.at(i));


         if(i == 1){




         }
         y_start = y_finish - sizes.at(i) * m_pointer->coef;

         Table_Element element_1(x_start, y_start, x_finish,  y_finish,  titles.at(i));

         drawTitle(element_1, x , needDrawLine, isBasicPen);

         y_finish = y_start;



       // r -= sizes.at(i) * m_pointer->coef;

        if(i == titles.length() - 1){

            needDrawLine = false;
        }

        if(i == 0){

          //  y_start = m_pointer->printer->height() - sizes.at(i) * m_pointer->coef;


            //float x_start = x - m_pointer->width_Measure;

           // float y_start = m_pointer->printer->height() - sizes.at(i) * m_pointer->coef;;


           // float x_finish = x;

           // float y_finish = m_pointer->printer->height();

            //Table_Element element_1(x_start, y_start, x_finish,  y_finish,  titles.at(i));

          //  drawTitle(element_1, x , needDrawLine, isBasicPen);

         //   m_pointer->drawRotateTextByCentr(element_1.x_start, element_1.y_start, element_1.x_finish, element_1.y_finish, element_1.title);

          //  m_pointer->drawRotateTextByCentr(x_start, y_start, x_finish, y_finish, element_1.title);

        }



    }

    //drawTitle(Table_Element element);


    m_pointer->drawLine(QPointF(m_pointer->printer->width(), y_top), QPointF(m_pointer->printer->width(), m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

    m_pointer->drawLine(QPointF(m_pointer->printer->width() - m_pointer->width_Measure, y_top), QPointF(m_pointer->printer->width() - m_pointer->width_Measure, m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

}
