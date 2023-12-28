#include <QPainter>
#include <QList>
#include <QPointF>

#include "chart_draw.h"
#include "measure_block.h"
#include "measure_lines.h"

#include "export/pdf/analysis/analysis_draw.h"
#include "export/pdf/km/km_draw.h"
#include "export/pdf/pdf_values.h"



ChartDraw::ChartDraw(My_pdf *pointer, float heightTitle, float widthRoute, float heightRoute)
{

    m_pointer = pointer;

    this->heightTitle = heightTitle;

    this->widthRoute = widthRoute;

    this->heightRoute = heightRoute;

    heightRoute_public = heightRoute;


    createChartBlock(heightTitle, widthRoute, heightRoute);
}


int ChartDraw::getConvertY(float measure_convert, float measure_start, float measure_finish, int y_finish, int height_block){

    int answer = 0;

    int diff = measure_finish - measure_start;


    if(diff != 0){

        answer = y_finish - ((measure_convert - measure_start)  * (height_block) / diff);
    }

    return answer;

}

int tmp_count= 0;

void ChartDraw::drawChartLine(Measure_Lines mes_Lines, int rightX, int measure_start, int measure_finish, int y_finish, int height_block){

    int last_x = rightX;

    int x0 = rightX;

    // Здесь нужна будет конвертация y0 (из ui) =  rightX;

    // Нужна конвертация по y

   // qDebug() << "mes_Lines.main_Line_Points.length() = " + QString::number(mes_Lines.main_Line_Points.length());

    for(int j = 0; j <  mes_Lines.main_Line_Points.length(); j++){

        int y_first = getConvertY(mes_Lines.main_Line_Points.at(j).x(), measure_start, measure_finish, y_finish, height_block);

        int y_second;

        if(j == mes_Lines.main_Line_Points.length() - 1){

            y_second = y_first;

        }
        else{

            y_second =  getConvertY(mes_Lines.main_Line_Points.at(j + 1).x(), measure_start, measure_finish, y_finish, height_block);

        }

           if(tmp_count == 4){

               y_first -= 1;

               y_second -= 1;
           }

        x0 -= 20;

        m_pointer->drawLine(QPointF(last_x,  y_first), QPointF(x0, y_second),  Pdf_Values::getPen(Pdf_Values::Basic));

        last_x = x0;

    }


}


void ChartDraw::draw_Mes(float measure_x, float measure_start, float measure_finish,  QList<float> measureVal, QList<int> noTextIndex, QList<int> noLineIndex, float leftX, float rightX){ // float height


    float height = measure_finish - measure_start;

    //qDebug() <<  QString::number(height  / coef);


   // float measure_finish = measure_start + height;


  //  m_pointer->drawLine(QPointF(rightX,  measure_finish), QPointF(rightX - 500,  measure_finish),  Pdf_Values::getPen(Pdf_Values::Error_Sensors));

   // m_pointer->drawLine(QPointF(rightX - 500,  measure_finish), QPointF(rightX - 1200,  measure_finish + 300),  Pdf_Values::getPen(Pdf_Values::Error_Sensors));


  //  int diff = measureVal.at(measureVal.length() - 1) - measureVal.at(0);

    for(int i = 0; i < measureVal.length(); i++){

       int a = getConvertY(measureVal.at(i), measureVal.at(0), measureVal.at(measureVal.length() - 1), measure_finish, height);

       //int a = measure_finish - ((measureVal.at(i) - measureVal.at(0))  * (height) / diff);


      // qDebug() << "a = " + QString::number(measure_finish - a) + " _a = " + QString::number(_a);


       //qDebug() << QString::number(measureVal.at(i)) + " - ? = " + QString::number(a);


       if(noLineIndex.length() == 0){

           m_pointer->drawLine(QPointF(leftX,  a), QPointF(rightX, a), Pdf_Values::getPen(Pdf_Values::Border));

       }
       else{

           if(i == noLineIndex[0]){

               noLineIndex.pop_front();

           }
           else{

               m_pointer->drawLine(QPointF(leftX, a), QPointF(rightX, a),  Pdf_Values::getPen(Pdf_Values::Border));

           }
       }




     QString str = QString::number(measureVal[i]);

     QList<float> mesVal_size = m_pointer->getSize(str);

     m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

     if(noTextIndex.length() == 0){

         m_pointer->drawText(QPointF( measure_x - mesVal_size[0] * 0.9 ,  a + mesVal_size[1] / 4),  str);

     }
     else{

        if(i == noTextIndex[0]){

            noTextIndex.pop_front();

        }
        else{

            m_pointer->drawText(QPointF( measure_x - mesVal_size[0] * 0.9,  a + mesVal_size[1] / 4),  str);

        }
     }


    }



}


void ChartDraw::drawMeasureBlock(QPoint point, Measure_Block mes_block, Measure_Lines mes_Lines){  // drawMeasureBlock(QPoint point, QSize size,  QString title, int index)

    //drawLine(point_1.x(), point_1.y());

    //drawLine(point_2.x(), point_1.y());




    QSize size = QSize(mes_block.width_Measure, mes_block.size);

    QRect rect(point.x(), point.y(), size.width(), size.height());


    m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));



   // QPainterPath path;

  //  path.addRoundedRect(rect, 70, 70);

   // painter->drawPath(path);


    m_pointer->painter->drawRect(rect);

   // m_pointer->drawTextByCentr();

   /* m_pointer->drawTextByCentr(mes_block.width_Measure, m_pointer->printer->width() , heightTitle + point.y()  ,   size.height() , mes_block.title);

    qDebug() << "Было: point.y() = " +
                QString::number(point.y())
                + " point.x = " + QString::number(point.x()) +
                 + " size.height()  = " + QString::number(size.height() )


                ; */


    m_pointer->drawRotateText(point.x(), point.y(), point.x() + size.width(), point.y() + size.height(), mes_block.title, 0);


   /* m_pointer->painter->rotate(-90);


    QList<float> title_size =  m_pointer->getSize(mes_block.title);


    m_pointer->drawText(QPointF(-1 * point.y() - (size.height() + title_size[0]) / 2,  m_pointer->printer->width() - ( (size.width() - title_size[1] / 2) / 2) ), mes_block.title);

    m_pointer->painter->rotate(90); */


    float y_start = point.y() + mes_block.startCorrect ;//+ spacingMeasure * 2;

    float y_finish = point.y() + size.height() + mes_block.finishCorrect;//- spacingMeasure ;//- spacingMeasure * 2;  // point.y() + size.height()

    //float measure_center = measure_start + (size.height()  + mesVal_size[1] / 2) / 2 ;

    float measure_x = point.x() - m_pointer->spacingMeasure;


    int correction = 50;

    y_finish -= correction;

    y_start += correction;


    draw_Mes(measure_x, y_start , y_finish, mes_block.measureVal, mes_block.noTextIndex, mes_block.noLineIndex, this->left_finish_x, rightX);


    if(tmp_count == 4){

     //   qDebug() << "mes_block.size - correction * 2 = " + QString::number(mes_block.size - correction * 2) + " y_finish - y_start = " + QString::number(y_finish - y_start);



      //  drawChartLine(5, rightX, mes_block.measureVal.at(0), mes_block.measureVal.at(mes_block.measureVal.length() - 1), point.y() + mes_block.size, mes_block.size);

      //  drawChartLine(mes_Lines, rightX, mes_block.measureVal.at(0), mes_block.measureVal.at(mes_block.measureVal.length() - 1), y_finish, (y_finish - y_start));

    }


    drawChartLine(mes_Lines, rightX, mes_block.measureVal.at(0), mes_block.measureVal.at(mes_block.measureVal.length() - 1), y_finish, (y_finish - y_start));

    tmp_count++;
}


void ChartDraw::createChartBlock(float heightTitle, float widthRoute, float heightRoute){



    int marginLeft = 4 * m_pointer->coef;

    int marginRight = 10 * m_pointer->coef;

    //int marginTop = 10 * coef;

    this->leftX = widthRoute + marginLeft;

    this->rightX = m_pointer->printer->width() - marginRight;



    m_pointer->drawLine(QPointF(rightX, heightTitle), QPointF(rightX, heightRoute),  Pdf_Values::getPen(Pdf_Values::Border));


    float kmSize = 9 * m_pointer->coef;

    float downSize = 13 * m_pointer->coef;

    float sampleSize = 21 * m_pointer->coef;

    float rihtSize = 24 * m_pointer->coef;

    float levelSize = 35 * m_pointer->coef;


    Km_Draw km_Draw(m_pointer, heightTitle, leftX, rightX, kmSize);

    this->left_finish_x = km_Draw.getLeftFinishX();


    if(!m_pointer->needNextPage){

        m_pointer->drawLine(QPointF(leftX, heightTitle), QPointF(leftX, heightRoute), Pdf_Values::getPen(Pdf_Values::Basic));

    }


   // m_pointer->drawLine(QPointF(rightX, heightTitle), QPointF(rightX - 500, 190 * m_pointer->coef), *m_pointer->basicPen);


    float leftX_Measure = m_pointer->printer->width() - marginLeft;

   // float width_Measure = 4 * m_pointer->coef;



    //  m_pointer->spacingMeasure + 4 * m_pointer->coef    - 26
    // ? - 45
    //  =  (m_pointer->spacingMeasure + 4 * m_pointer->coef) * 45 / 26


    // 8.65 - 2мм
    // ? - 3мм
    // 8.65 * 3 / 2

    float r = 12.1; // 12.975;
    // ? = 12.975

    Measure_Block mesDown("Км", 9 * m_pointer->coef, m_pointer->width_Measure, {0}, {0}, {0}, 0, 0);


    Measure_Block mesDownRight("Пр. пр.", 13 * m_pointer->coef, m_pointer->width_Measure, {-10, 0, 10}, {}, {}, 0, 0);

    Measure_Block mesDownLeft("Пр. л", 13 * m_pointer->coef, m_pointer->width_Measure, {-10, 0, 10}, {}, {}, 0, 0);

    Measure_Block mesSample("Шаблон", 21 * m_pointer->coef, m_pointer->width_Measure, {1510, 1512, 1514, 1520, 1540, 1542, 1544, 1548, 1550}, {0, 2, 5, 6, 8}, {9}, 0, 0);

    // Фактическая длина блока должна быть 24мм, но размер, по которому должно считаться значение 46мм тогда размеры сохранятся
    Measure_Block mesRihtRight("Рихтовка пр.", 24 * m_pointer->coef, m_pointer->width_Measure, {0, -3, -30, -46 }, {3}, {3}, -1 * r  * m_pointer->coef, r  * m_pointer->coef);

    Measure_Block mesRihtLeft("Рихтовка л.", 24 * m_pointer->coef, m_pointer->width_Measure, {46, 30, 3, 0 }, {0}, {0}, -1 * (r  * m_pointer->coef), r  * m_pointer->coef);

    Measure_Block mesLevel("Уровень", 35 * m_pointer->coef, m_pointer->width_Measure, {-73.5, -30, 0, 30, 55.5}, {0, 4}, {0, 4}, 0, 0);



    Measure_Lines lines_downRight(m_pointer->downRight_Points);

    Measure_Lines lines_downLeft(m_pointer->downLeft_Points);

    Measure_Lines lines_Sample(m_pointer->sample_Points);

    Measure_Lines lines_RihtRight(m_pointer->rihtRight_Points);

    Measure_Lines lines_RihtLeft(m_pointer->rihtLeft_Points);

    Measure_Lines lines_Level(m_pointer->level_Points);


    QList<Measure_Block> mesBlockList;


    mesBlockList.append(mesDown);

    mesBlockList.append(mesDownRight);

   // mesBlockList.append(mesDownLeft);


    float y_measure = heightTitle;


    for(int i = 0; i < mesBlockList.length(); i++){

      //  drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesBlockList.at(i));

     //   y_measure += mesDown.size + spacingMeasure;

    }



    QList<QPointF> t = {};

    Measure_Lines test (t);

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesDown, test);


    y_measure += kmSize + m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesDownRight, lines_downRight);





    y_measure += downSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesDownLeft, lines_downLeft);




    y_measure += downSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesSample, lines_Sample);




    y_measure += sampleSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesRihtRight, lines_RihtRight);




    y_measure += rihtSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesRihtLeft, lines_RihtLeft);





    y_measure += rihtSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesLevel, lines_Level);









    Analysis_Draw analysis_Draw(m_pointer, heightRoute, rightX);


}
