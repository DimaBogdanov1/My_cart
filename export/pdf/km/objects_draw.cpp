#include <QPainter>
#include <QPainterPath>
#include <QFontDatabase>

#include "objects_draw.h"
#include "export/pdf/chart/chart_draw.h"

#include "export/pdf/pdf_values.h"


Objects_Draw::Objects_Draw(My_pdf *pointer, float leftX, float rightX, float y_TopRail, float y_BottomRail, float heightTitle, float km_y)
{

    m_pointer = pointer;

    this->leftX = leftX;

    this->rightX = rightX;

    this->y_TopRail = y_TopRail;

    this->y_BottomRail = y_BottomRail;


    this->y_CenterRail = (y_TopRail + y_BottomRail) / 2;

    this->km_y = km_y;

    this->heightTitle = heightTitle;



    //this->kmPen = kmPen;



    this->spacing = m_pointer->spacingMeasure;

    this->top_border = y_TopRail - spacing;

    this->half_top_border = y_TopRail - spacing / 2;


    this->bottom_border = y_BottomRail + spacing;

    this->half_bottom_border = y_BottomRail + spacing / 2;


    this->part_arrowLine_width = 1 * m_pointer->coef;

   // drawLinesBorders();



    drawArrowSensors(rightX - 800, 12, Top_left, true, false);

    drawArrowSensors(rightX - 1800, 2, Top_right, false, true);

    drawArrowSensors(rightX - 2800, 1, Bottom_left, false, false);

    drawArrowSensors(rightX - 3800, 10, Bottom_right, true, true);



    drawBridge(rightX - 5000, 1000);

    drawDoubleArrow(rightX - 7010, 8, true, true);

    drawIsolated_Junction(rightX - 8000);

  //  drawIsolated_Junction(rightX - 8300);

    drawRailroad_Crossing(rightX - 8550);

    drawPillar(rightX - 7200);

    drawKm_Mark(rightX - 6200);

}

void Objects_Draw::drawKm_Mark(int x){

    m_pointer->drawLine(QPointF(x , y_TopRail), QPointF(x, half_top_border ), Pdf_Values::getPen(Pdf_Values::Test));


    QRect rect(x - spacing, half_top_border - 2 * spacing, 2 * spacing, 2 * spacing);

    m_pointer->painter->drawRect(rect);



    //half_top_border

   // m_pointer->painter->rotate(-90);

  //  QList<float> size = m_pointer->getSize(title);

    m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Error_Sensors));


    m_pointer->painter->setFont(Pdf_Values::getFont(Pdf_Values::Mini_Font));




    m_pointer->drawRotateText(x - spacing, half_top_border - 2 * spacing, x + spacing, half_top_border,  "к", 0);

  /*  m_pointer->painter->rotate(-90);


    QList<float> size = m_pointer->getSize("к");

    float a = ((x - spacing) - size[0]) / 2 ;


    float e = (2 * spacing - size[0]) / 2;

    qDebug() << "e = " + QString::number(e);


    float r = (2 * spacing  - size[1]) ;


    qDebug() << "size[0] = " + QString::number(size[0])
            + " size[1] = " + QString::number(size[1])
            + " 2 * spacing = " + QString::number(2 * spacing );


    m_pointer->painter->drawText (-1 * (half_top_border -  e) ,  x + size[0] / 2 , "к"); // - b



    m_pointer->painter->rotate(90); */

   // m_pointer->drawTextByCentr(2 * spacing, x + spacing , half_top_border, 2 * spacing,  "к");


    m_pointer->painter->setFont(Pdf_Values::getFont(Pdf_Values::Main_Font));


    //QFont font2(family, 7);

   // m_pointer->painter->setFont(font2);
}


void Objects_Draw::drawPillar(int x){

    m_pointer->drawLine(QPointF(x , km_y), QPointF(x, km_y - 100), Pdf_Values::getPen(Pdf_Values::Test));

}

void Objects_Draw::drawRailroad_Crossing(int x){

    const int finish_crossing = x - spacing;


    m_pointer->drawLine(QPointF(x , bottom_border), QPointF(x, top_border), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(finish_crossing, bottom_border), QPointF(finish_crossing, top_border), Pdf_Values::getPen(Pdf_Values::KmPen));


    for(int i = 0; i < 3; i++){

        int tmp_spacing = i * spacing;

        m_pointer->drawLine(QPointF(finish_crossing, half_top_border + tmp_spacing), QPointF(x, half_top_border + tmp_spacing), Pdf_Values::getPen(Pdf_Values::KmPen));

    }


}

void Objects_Draw::drawIsolated_Junction(int x){

    int a = half_top_border - spacing / 4;

    int b = y_TopRail;

    if(false){ // !isTop

        a = half_bottom_border + spacing / 4;

        b = y_BottomRail;
    }

    m_pointer->drawLine(QPointF(x, b), QPointF(x, a), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(x - spacing, a), QPointF(x + spacing, a), Pdf_Values::getPen(Pdf_Values::KmPen));



    m_pointer->drawLine(QPointF(x - spacing, a + spacing / 4), QPointF(x - spacing, a - spacing / 4), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(x + spacing, a + spacing / 4), QPointF(x + spacing, a - spacing / 4), Pdf_Values::getPen(Pdf_Values::KmPen));

}

void Objects_Draw::drawDoubleArrow(int x, int number, bool isNeedChartLine, bool isNeedDot){

    int arrow_line = 33 / 4 * m_pointer->coef; // Это из базы Дениса


    m_pointer->drawLine(QPointF(x , half_top_border), QPointF(x, half_bottom_border), Pdf_Values::getPen(Pdf_Values::KmPen));


    drawArrow_2(x, true);

    //drawArrow(QRectF(x - spacing/2, top_border,spacing, spacing / 2), true);


    //drawArrow(QRectF(x - spacing/2, half_bottom_border,spacing, spacing / 2), false);

    drawArrow_2(x, false);


    drawArrow_Stage_2(x, x + text_x, number, arrow_line, part_arrowLine_width, isNeedChartLine, isNeedDot);

}

void Objects_Draw::drawBranchBridge(int x_start, int width,  bool isTop){

    int approach_to_bridge = 100;

    const int start_bridge_x =  x_start - approach_to_bridge; //    x_start - m_pointer->spacingMeasure / 2;

    const int start_body_x =  start_bridge_x - spacing / 2;

    const int finish_body_x =  start_body_x - (width -  2 * (spacing / 2 + approach_to_bridge)) ;

    const int finish_bridge_x =  finish_body_x - spacing / 2;  //x_start - width - m_pointer->spacingMeasure / 2;

    const int x_finish = finish_bridge_x - approach_to_bridge;


    int p1 = top_border;

    int p2 = half_top_border;


    if(!isTop){

        p1 = bottom_border;

        p2 = half_bottom_border;
    }


    m_pointer->drawLine(QPointF(x_start, p1), QPointF(start_bridge_x , p1), Pdf_Values::getPen(Pdf_Values::Km_Opacity));

    m_pointer->drawLine(QPointF(start_body_x, p2), QPointF(start_bridge_x , p1), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(start_body_x, p2), QPointF(finish_body_x, p2), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(finish_body_x, p2), QPointF(finish_bridge_x , p1), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(finish_bridge_x, p1), QPointF(x_finish , p1), Pdf_Values::getPen(Pdf_Values::Km_Opacity));


}

void Objects_Draw::drawBridge(int x_start, int width){

    //m_pointer->drawLine(QPointF(x_start, top_border), QPointF(x_start , top_border + 600), Pdf_Values::getPen(Pdf_Values::Basic));

    //m_pointer->drawLine(QPointF(x_start - width, top_border), QPointF(x_start - width , top_border + 600), Pdf_Values::getPen(Pdf_Values::Basic));


    drawBranchBridge(x_start, width, true);

    drawBranchBridge(x_start, width, false);

}

void Objects_Draw::drawArrowSensors(int x, int number, int index_position,  bool isNeedChartLine, bool isNeedDot){

    int arrow_line = 33 / 4 * m_pointer->coef;

    QList<float> size = m_pointer->getSize(QString::number(number));


    //float e = m_pointer->spacingMeasure;

    float arrowStart = top_border; // y_TopRail - e;



    float line_x = m_pointer->spacingMeasure / 2;

    float left_line_x = arrow_line ;

    float right_line_x = 1 * m_pointer->coef;


    float startLine = half_top_border; //y_TopRail - m_pointer->spacingMeasure;

    float finishLine = half_bottom_border; //y_BottomRail + m_pointer->spacingMeasure / 2;

    float finishSubLine = bottom_border; // y_BottomRail + m_pointer->spacingMeasure;

    float _text_x = this->text_x; // line_x + size[0];


    bool isTop_arrow = true;



    switch(index_position){

    case Top_left:

        line_x *= -1;

        right_line_x = arrow_line;

        left_line_x = 1 * m_pointer->coef;

        break;

    case Top_right:

        break;

    case Bottom_left:

        isTop_arrow = false;

        arrowStart = half_bottom_border; //y_BottomRail + e / 2;

        line_x *= -1;

        startLine =  half_bottom_border; //y_BottomRail + m_pointer->spacingMeasure;

        finishLine =  half_top_border; //y_TopRail - m_pointer->spacingMeasure / 2;

        finishSubLine =  y_TopRail - m_pointer->spacingMeasure;

        right_line_x = arrow_line;

        left_line_x = 1 * m_pointer->coef;

        _text_x  = -1 * _text_x - size[0]; //= line_x - size[0];

        break;

    case Bottom_right:

        isTop_arrow = false;

        arrowStart = half_bottom_border; //y_BottomRail + e / 2;



        startLine = half_bottom_border; // y_BottomRail + m_pointer->spacingMeasure;

        finishLine = half_top_border; // y_TopRail - m_pointer->spacingMeasure / 2;

        finishSubLine = top_border; // y_TopRail - m_pointer->spacingMeasure;

        _text_x  = -1 * _text_x - size[0]; //= line_x - size[0];



        break;
    }


    m_pointer->drawLine(QPointF(x, startLine), QPointF(x, finishLine), Pdf_Values::getPen(Pdf_Values::KmPen));




    drawArrow_2(x, isTop_arrow);

//    drawArrow(QRectF(x - spacing/2, arrowStart, spacing, spacing / 2), isTop_arrow);


    // Влево на 1 мм

    m_pointer->drawLine(QPointF(x, finishLine), QPointF(x + line_x, finishSubLine), Pdf_Values::getPen(Pdf_Values::KmPen));


    // Вправо сичтываем из бд

    // 25 мм - 100 метров пути
    // ? - 33 метров значение длинной линии стрелки
    // ? = 33 / 4


    drawArrow_Stage_2(x, x + _text_x, number, left_line_x, right_line_x, isNeedChartLine, isNeedDot);


}

void Objects_Draw::drawArrow_Stage_2(int x, int text_x, int number, int left_line_x, int right_line_x, bool isNeedChartLine, bool isNeedDot){

    m_pointer->drawText(QPointF(text_x, half_top_border), QString::number(number));


    m_pointer->drawLine(QPointF(x - left_line_x, y_CenterRail), QPointF(x + right_line_x, y_CenterRail), Pdf_Values::getPen(Pdf_Values::KmPen));


    int line_x;

    if(left_line_x > right_line_x){

        line_x = x - left_line_x;
    }
    else{

        line_x = x + right_line_x;

    }



    if(isNeedChartLine){

        m_pointer->drawLine(QPointF(line_x, km_y), QPointF(line_x, ChartDraw::heightRoute_public), Pdf_Values::getPen(Pdf_Values::Border));

    }

    m_pointer->drawLine(QPointF(line_x, heightTitle), QPointF(line_x, km_y), Pdf_Values::getPen(Pdf_Values::Km_Opacity));


    if(isNeedDot){

        drawCircle(x);

    }
}

void Objects_Draw::drawCircle(int x){

    int circle_size = 20;

    m_pointer->painter->setPen(Pdf_Values::getPen(Pdf_Values::Basic));

    m_pointer->painter->drawEllipse(QRect(x - circle_size / 2, y_CenterRail - circle_size / 2, circle_size, circle_size));

}

void Objects_Draw::drawArrow_2(int x, bool isTop){

    int arrow_offset = spacing / 2;

    int start_y;

    int finish_y;

    if(isTop){

        start_y = half_top_border;

        finish_y = top_border;

    }
    else{

        start_y = half_bottom_border;

        finish_y = bottom_border;
    }

    m_pointer->drawLine(QPointF(x - arrow_offset, start_y), QPointF(x, finish_y), Pdf_Values::getPen(Pdf_Values::KmPen));

    m_pointer->drawLine(QPointF(x + arrow_offset, start_y), QPointF(x, finish_y), Pdf_Values::getPen(Pdf_Values::KmPen));

}

void Objects_Draw::drawArrow(QRectF rect, bool isTop){


  //  QRectF rect = QRectF(a - e/2, y_TopRail - e,e, e / 2);

    QPainterPath path;

    if(isTop){

        path.moveTo(rect.left() + (rect.width() / 2), rect.top());
        path.lineTo(rect.bottomLeft());
        path.lineTo(rect.bottomRight());
        path.lineTo(rect.left() + (rect.width() / 2), rect.top());

    }
    else{

        path.moveTo(rect.left() + (rect.width() / 2), rect.bottom());

        path.lineTo(rect.topLeft());

        path.lineTo(rect.topRight());

        path.moveTo(rect.left() + (rect.width() / 2), rect.bottom());

    }


    m_pointer->painter->fillPath(path, QBrush(QColor ("blue")));
}



void Objects_Draw::drawLinesBorders(){

    m_pointer->drawLine(QPointF(leftX, top_border), QPointF(rightX, top_border), Pdf_Values::getPen(Pdf_Values::Basic));


    m_pointer->drawLine(QPointF(leftX, bottom_border), QPointF(rightX, bottom_border), Pdf_Values::getPen(Pdf_Values::Basic));

}
