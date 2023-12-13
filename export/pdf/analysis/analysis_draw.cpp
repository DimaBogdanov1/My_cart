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

    drawCorrectBlock(m_pointer->printer->width()  - 8000, 956, Correct_Arrow, -2);

    drawCorrectBlock(m_pointer->printer->width()  - 9000, 111, Correct_GNSS, -2);

    drawCorrectBlock(m_pointer->printer->width()  - 10000, 718, Correct_Km_Pole, -2);

    drawCorrectBlock(m_pointer->printer->width()  - 11000, 976, Correct_Not_Required, NULL);


    drawInfoBlock_Stage_1(true, rightX);



    QList<QString> tmp = {"119", "Р", "2", "22", "16", "1", "Cтр."};

    drawTable(tmp, sizes, m_pointer->printer->width() - 12000, false, true);

    drawTable(tmp, sizes, m_pointer->printer->width() - 12000 + m_pointer->width_Measure, false, false);



    QList<QString> a = {"523", "R:850", "h:55", "Ш:1535", "И:-"};

    QList<float> b = {6, 7, 7, 7, 6};

   // drawTable(a,  b, m_pointer->printer->width()  - 2000, true);


}

void Analysis_Draw::drawCorrectBlock(float x, int meter_value, int index, int value){

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




    m_pointer->drawTextByCentr(m_pointer->width_Measure, x - m_pointer->width_Measure, b, fist_size,  QString::number(meter_value));


    m_pointer->drawTextByLeft(m_pointer->width_Measure,  x - m_pointer->width_Measure, (b - fist_size),  str_1);


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


    m_pointer->drawTextByLeft(m_pointer->width_Measure,  x, (b - fist_size),  str_2);


  /*  m_pointer->painter->rotate(-90);

    QList<float> size = m_pointer->getSize(title);

    float b_1 = (m_pointer->width_Measure - size[1])  * 1.5;

    m_pointer->painter->drawText(-1 * (b - fist_size) + m_pointer->spacingMeasure,  (x - m_pointer->width_Measure) - b_1, title);

    m_pointer->painter->drawText(-1 * (b - fist_size) + m_pointer->spacingMeasure,  (x) - b_1, "положения стрелки на -1 м");

    m_pointer->painter->rotate(90); */


   // m_pointer->drawTextByCentr(m_pointer->width_Measure, x - m_pointer->width_Measure, b - fist_size,  b - fist_size - y_top , "Привязка координат: Коррекция");


   // m_pointer->drawTextByCentr(m_pointer->width_Measure, x, b - fist_size,  b - fist_size - y_top , "положения стреклик на  -1 м");


   // m_pointer->drawLine(QPointF(x , m_pointer->printer->height() - fist_size - 10 * m_pointer->coef), QPointF(x - 2 * m_pointer->width_Measure  ,  m_pointer->printer->height() - fist_size - 10 * m_pointer->coef), *m_pointer->basicPen);








    m_pointer->drawLine(QPointF(x , m_pointer->printer->height() - fist_size), QPointF(x - 2 * m_pointer->width_Measure  ,  m_pointer->printer->height() - fist_size), Pdf_Values::getPen(Pdf_Values::Basic));


    m_pointer->drawLine(QPointF(x - m_pointer->width_Measure , m_pointer->printer->height()), QPointF(x - m_pointer->width_Measure  , y_top), Pdf_Values::getPen(Pdf_Values::Basic));

}


void Analysis_Draw::drawInfoBlock_Stage_2(QString title, float x){

    QRect rect(x - m_pointer->width_Measure, y_top, m_pointer->width_Measure,  m_pointer->printer->height() - y_top);

    m_pointer->painter->drawRect(rect);



    m_pointer->painter->rotate(-90);

    QList<float> size = m_pointer->getSize(title);


    float b = (m_pointer->width_Measure - size[1])  * 1.5;


    m_pointer->painter->drawText(-1 * m_pointer->printer->height() + m_pointer->spacingMeasure,  x - b, title);

    m_pointer->painter->rotate(90);


    m_pointer->drawLine(QPointF(x - m_pointer->width_Measure / 4,  y_top), QPointF(x - m_pointer->width_Measure / 4,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

    m_pointer->drawLine(QPointF(x - m_pointer->width_Measure * 0.75,  y_top), QPointF(x - m_pointer->width_Measure * 0.75,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));
}

void Analysis_Draw::drawInfoBlock_Stage_1(bool isUp, float x){

    QString title_form_db = "Капремонт старый 8.1994";

    QString arrow = "↑";

    if(!isUp){

        arrow = "↓";
    }

    QString title = arrow + " " + title_form_db;

    drawInfoBlock_Stage_2(title, x);

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

    drawInfoBlock_Stage_2(title, x);

}

void Analysis_Draw::drawTitle(Table_Element element, float x, bool needDrawLine, bool isBasicPen){


    if(isBasicPen){

        m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

    }
    else{

        m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::BasicOpacity));

    }

    m_pointer->drawTextByCentr(m_pointer->width_Measure, x, element.y_start, element.y_stop, element.title);



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

        m_pointer->drawLine(QPointF(x, element.y_line), QPointF(x - m_pointer->width_Measure, element.y_line), Pdf_Values::getPen(Pdf_Values::Basic));

    }



    //////////
    m_pointer->drawLine(QPointF(m_pointer->printer->width() - m_pointer->width_Measure / 4,  y_top), QPointF(m_pointer->printer->width() - m_pointer->width_Measure / 4,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

    m_pointer->drawLine(QPointF(m_pointer->printer->width() - m_pointer->width_Measure * 0.75,  y_top), QPointF(m_pointer->printer->width() - m_pointer->width_Measure * 0.75,  m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

}

void Analysis_Draw::drawTable(QList<QString> titles,  QList<float> sizes, float x, bool needDrawLine, bool isBasicPen){

    //borderPen = new QPen(Qt::black, 6, Qt::DotLine, Qt::RoundCap);

    m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

    if(needDrawLine){

        QRect rect(x - m_pointer->width_Measure, y_top, m_pointer->width_Measure,  m_pointer->printer->height() - y_top);

        m_pointer->painter->drawRect(rect);

    }




    float r = m_pointer->printer->height();

    for(int i = 0; i < titles.length(); i++){

        // Table_Element elem()

        Table_Element element_1(r, sizes.at(i) * m_pointer->coef,      r - sizes.at(i) * m_pointer->coef,     titles.at(i));

        r -= sizes.at(i) * m_pointer->coef;

        if(i == titles.length() - 1){

            needDrawLine = false;
        }

        drawTitle(element_1, x , needDrawLine, isBasicPen);

    }

    //drawTitle(Table_Element element);


    m_pointer->drawLine(QPointF(m_pointer->printer->width(), y_top), QPointF(m_pointer->printer->width(), m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

    m_pointer->drawLine(QPointF(m_pointer->printer->width() - m_pointer->width_Measure, y_top), QPointF(m_pointer->printer->width() - m_pointer->width_Measure, m_pointer->printer->height()), Pdf_Values::getPen(Pdf_Values::Basic));

}
