#include <QPainter>

#include "chart_draw.h"
#include "measure_block.h"
#include "km/km_draw.h"
#include "analysis/analysis_draw.h"
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

void ChartDraw::draw_Mes(float measure_x, float measure_start, float measure_finish,  QList<float> measureVal, QList<int> noTextIndex, QList<int> noLineIndex, float leftX, float rightX){ // float height

    int correction = 50;

    measure_finish -= correction;

    measure_start += correction;

    float height = measure_finish - measure_start;

    //qDebug() <<  QString::number(height  / coef);


   // float measure_finish = measure_start + height;



    int diff = measureVal.at(measureVal.length() - 1) - measureVal.at(0);

    for(int i = 0; i < measureVal.length(); i++){

       float a = (measureVal.at(i) - measureVal.at(0))  * (height) / diff;

       //qDebug() << QString::number(measureVal.at(i)) + " - ? = " + QString::number(a);


       if(noLineIndex.length() == 0){

           m_pointer->drawLine(QPointF(leftX, measure_finish - a), QPointF(rightX, measure_finish - a), Pdf_Values::getPen(Pdf_Values::Border));

       }
       else{

           if(i == noLineIndex[0]){

               noLineIndex.pop_front();

           }
           else{

               m_pointer->drawLine(QPointF(leftX, measure_finish - a), QPointF(rightX, measure_finish - a),  Pdf_Values::getPen(Pdf_Values::Border));

           }
       }




     QString str = QString::number(measureVal[i]);

     QList<float> mesVal_size = m_pointer->getSize(str);

     m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

     if(noTextIndex.length() == 0){

         m_pointer->drawText(QPointF( measure_x - mesVal_size[0] * 0.9 , measure_finish - a + mesVal_size[1] / 4),  str);

     }
     else{

        if(i == noTextIndex[0]){

            noTextIndex.pop_front();

        }
        else{

            m_pointer->drawText(QPointF( measure_x - mesVal_size[0] * 0.9, measure_finish - a + mesVal_size[1] / 4),  str);

        }
     }


    }


  //  float a = (1548 - 1510)  * (height / coef) / (1550 - 1510);

  //  qDebug() <<  "1548 - ? = " + QString::number(a);

   // drawLine(QPointF(measure_x, measure_start + height - a), QPointF(measure_x - 300, measure_start + height - a));






   // drawText(QPointF( measure_x - mesVal_size[0], measure_start + height - mesVal_size[1] / 2),  QString::number(measureVal.at(0)));

}

void ChartDraw::drawMeasureBlock(QPoint point, Measure_Block mes_block){  // drawMeasureBlock(QPoint point, QSize size,  QString title, int index)

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

    m_pointer->painter->rotate(-90);


    QList<float> title_size =  m_pointer->getSize(mes_block.title);


    m_pointer->drawText(QPointF(-1 * point.y() - (size.height() + title_size[0]) / 2,  m_pointer->printer->width() - ( (size.width() - title_size[1] / 2) / 2) ), mes_block.title);

    m_pointer->painter->rotate(90);


    float measure_start = point.y() ;//+ spacingMeasure * 2;

    float measure_finish = point.y() + size.height() ;//- spacingMeasure ;//- spacingMeasure * 2;  // point.y() + size.height()

    //float measure_center = measure_start + (size.height()  + mesVal_size[1] / 2) / 2 ;

    float measure_x = point.x() - m_pointer->spacingMeasure;



    draw_Mes(measure_x, measure_start + mes_block.startCorrect, measure_start + size.height() + mes_block.finishCorrect, mes_block.measureVal, mes_block.noTextIndex, mes_block.noLineIndex, mes_block.leftX, mes_block.rightX);



 /*   if(index == 1){
     //   draw_DownMes(measure_x, measure_start, size.height());

        QList<int> measureVal = {-10, 0, 10};

        QList<int> noTextIndex = {};

        QList<int> noLineIndex = {};

        draw_Mes(measure_x, measure_start, measure_start + size.height(), measureVal, noTextIndex, noLineIndex);

    }

    if(index == 2){

        QList<int> measureVal = {-10, 0, 10};

        QList<int> noTextIndex = {};

        QList<int> noLineIndex = {};

        draw_Mes(measure_x, measure_start, measure_start + size.height(), measureVal, noTextIndex, noLineIndex);

       // draw_SampleMes(measure_x, measure_start, size.height());

       // draw_DownMes(measure_x, measure_start, size.height());

      //  QList<int> values = {-10, 0, 10};

      //  draw_Mes(measure_x, measure_start, size.height(), values);

    }


    if(index == 3){

        QList<int> measureVal = {1510, 1512, 1514, 1520, 1540, 1542, 1544, 1546, 1548, 1550};

        QList<int> noTextIndex = {0, 2, 5, 6, 7, 9};

        QList<int> noLineIndex = {9};

        draw_Mes(measure_x, measure_start, measure_start + size.height(), measureVal, noTextIndex, noLineIndex);

      //  draw_Mes(measure_x, measure_start, size.height(), values);

    }


    if(index == 4){

        QList<int> measureVal = {-0, -3, -30, -46 }; // {-46, -30, -3, 0};

        QList<int> noTextIndex = {3};

        QList<int> noLineIndex = {3};

       // draw_SampleMes(measure_x, measure_start, measure_start + size.height() + spacingMeasure + 4 * coef, measureVal, noTextIndex, noLineIndex);

    }


    if(index == 5){

        QList<int> measureVal = {46, 30, 3, 0};  //{0, 3, 30, 46 };

        QList<int> noTextIndex = {0};

        QList<int> noLineIndex = {0};

     //   draw_Mes(measure_x, measure_start - (spacingMeasure + 4 * coef), measure_start + size.height()  , measureVal, noTextIndex, noLineIndex);

    }

    if(index == 6){

        QList<int> measureVal = {-64, -30, 0, 30, 46};

        QList<int> noTextIndex = {0, 4};

        QList<int> noLineIndex = {0, 4};

        draw_Mes(measure_x, measure_start, measure_start + size.height(), measureVal, noTextIndex, noLineIndex);

     //   QList<int> values = {-64, -30, 0, 30, 46}; // -66

     //   draw_Mes(measure_x, measure_start, size.height(), values);

    }

    */


   // drawLine(QPointF(point.x() + 500, point.y() + size.height() / 2), QPointF(point.x() - 500, point.y() + size.height() / 2));



   // drawLine(QPointF(point.x() + ((size.width()+ title_size[1] / 2) / 2) , point.y()), QPointF(point.x() + ((size.width()+ title_size[1] / 2) / 2), point.y() + size.height()));

    //drawLine(QPointF(point.x() + ((size.width()- title_size[1] / 2) / 2) , point.y()), QPointF(point.x() + ((size.width()- title_size[1] / 2) / 2), point.y() + size.height()));

}


void ChartDraw::createChartBlock(float heightTitle, float widthRoute, float heightRoute){



    int marginLeft = 4 * m_pointer->coef;

    int marginRight = 10 * m_pointer->coef;

    //int marginTop = 10 * coef;

    float leftX = widthRoute + marginLeft;

    float rightX = m_pointer->printer->width() - marginRight;



    m_pointer->drawLine(QPointF(rightX, heightTitle), QPointF(rightX, heightRoute),  Pdf_Values::getPen(Pdf_Values::Border));


    float kmSize = 9 * m_pointer->coef;

    float downSize = 13 * m_pointer->coef;

    float sampleSize = 21 * m_pointer->coef;

    float rihtSize = 24 * m_pointer->coef;

    float levelSize = 35 * m_pointer->coef;


    Km_Draw km_Draw(m_pointer, heightTitle, leftX, rightX, kmSize);

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

    Measure_Block mesDown("Км", 9 * m_pointer->coef, m_pointer->width_Measure, {0}, {0}, {0}, 0, 0, km_Draw.getLeftFinishX(), rightX);

    Measure_Block mesDownRight("Пр. пр.", 13 * m_pointer->coef, m_pointer->width_Measure, {-10, 0, 10}, {}, {}, 0, 0, km_Draw.getLeftFinishX(), rightX);

    Measure_Block mesDownLeft("Пр. л", 13 * m_pointer->coef, m_pointer->width_Measure, {-10, 0, 10}, {}, {}, 0, 0, km_Draw.getLeftFinishX(), rightX);

    Measure_Block mesSample("Шаблон", 21 * m_pointer->coef, m_pointer->width_Measure, {1510, 1512, 1514, 1520, 1540, 1542, 1544, 1548, 1550}, {0, 2, 5, 6, 8}, {9}, 0, 0, km_Draw.getLeftFinishX(), rightX);

    // Фактическая длина блока должна быть 24мм, но размер, по которому должно считаться значение 46мм тогда размеры сохранятся
    Measure_Block mesRihtRight("Рихтовка пр.", 24 * m_pointer->coef, m_pointer->width_Measure, {-0, -3, -30, -46 }, {3}, {3}, -1 * r  * m_pointer->coef, r  * m_pointer->coef, km_Draw.getLeftFinishX(), rightX);

    Measure_Block mesRihtLeft("Рихтовка л.", 24 * m_pointer->coef, m_pointer->width_Measure, {46, 30, 3, 0 }, {0}, {0}, -1 * (r  * m_pointer->coef), r  * m_pointer->coef, km_Draw.getLeftFinishX(), rightX);

    Measure_Block mesLevel("Уровень", 35 * m_pointer->coef, m_pointer->width_Measure, {-73.5, -30, 0, 30, 55.5}, {0, 4}, {0, 4}, 0, 0, km_Draw.getLeftFinishX(), rightX);


    QList<Measure_Block> mesBlockList;


    mesBlockList.append(mesDown);

    mesBlockList.append(mesDownRight);

   // mesBlockList.append(mesDownLeft);


    float y_measure = heightTitle;


    for(int i = 0; i < mesBlockList.length(); i++){

      //  drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesBlockList.at(i));

     //   y_measure += mesDown.size + spacingMeasure;

    }




    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesDown);



   // drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, kmSize), tr("Км"), 0);

    y_measure += kmSize + m_pointer->spacingMeasure;


    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesDownRight);


 //   drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, downSize), tr("Пр. пр."), 1);


    y_measure += downSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesDownLeft);

  //  drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, downSize), tr("Пр. л"), 2);


    y_measure += downSize +   m_pointer->spacingMeasure;


  //  drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, sampleSize), tr("Шаблон"), 3);


    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesSample);

    y_measure += sampleSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesRihtRight);

   // drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, rihtSize), tr("Рихтовка пр."), 4);


    y_measure += rihtSize +   m_pointer->spacingMeasure;

    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesRihtLeft);

 //   drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, rihtSize), tr("Рихтовка л."), 5);


    y_measure += rihtSize +   m_pointer->spacingMeasure;

  //  drawMeasureBlock(QPoint(leftX_Measure, y_measure), QSize(width_Measure, levelSize), tr("Уровень"), 6);


    drawMeasureBlock(QPoint(leftX_Measure, y_measure), mesLevel);






  //  drawLine(QPointF(leftX, heightTitle + kmSize), QPointF(rightX, heightTitle + kmSize), QPen(Qt::green, 3, Qt::DashDotLine, Qt::RoundCap, Qt::RoundJoin) );




  //  QList<float> size = getSize( QString::number(km));


  //  painter->drawText(rightX - size[0] - spacingMeasure, heightTitle + kmSize - spacingMeasure , QString::number(km)); //  QString::fromUtf8(header)

   // drawLine(QPointF(leftX, heightTitle + kmSize), QPointF(rightX, heightTitle + kmSize));




    Analysis_Draw analysis_Draw(m_pointer, heightRoute, rightX);

    //km_Block.createKm_Block(heightTitle, leftX, rightX, kmSize);

 //   createKm_Block(heightTitle, leftX, rightX, kmSize);
}
