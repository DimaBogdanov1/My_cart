#ifndef CHART_DRAW_H
#define CHART_DRAW_H

#include "my_pdf.h"

class ChartDraw
{
    //Q_OBJECT

public:
    ChartDraw(My_pdf *pointer, float heightTitle, float widthRoute, float heightRoute);

    inline static int heightRoute_public;

private:
    My_pdf *m_pointer;

    float heightTitle;

    float widthRoute;

    float heightRoute;

    void createChartBlock(float heightTitle, float widthRoute, float heightRoute);

    void drawMeasureBlock(QPoint point, Measure_Block mes_block);

    void draw_Mes(float measure_x, float measure_start, float measure_finish,  QList<float> measureVal, QList<int> noTextIndex, QList<int> noLineIndex, float leftX, float rightX);
};

#endif // CHART_DRAW_H


