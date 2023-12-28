#ifndef CHART_DRAW_H
#define CHART_DRAW_H

#include "export/pdf/my_pdf.h"

#include "export/pdf/chart/measure_lines.h"

#include "export/pdf/chart/measure_block.h"

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

    int leftX, rightX, left_finish_x;

    void createChartBlock(float heightTitle, float widthRoute, float heightRoute);

    void drawMeasureBlock(QPoint point, Measure_Block mes_block, Measure_Lines mes_Lines);

    void draw_Mes(float measure_x, float measure_start, float measure_finish,  QList<float> measureVal, QList<int> noTextIndex, QList<int> noLineIndex, float leftX, float rightX);

    void drawChartLine(Measure_Lines mes_Lines, int rightX, int measure_start, int measure_finish, int y_finish, int height_block);

    int getConvertY(float measure_convert, float measure_start, float measure_finish, int y_finish, int height_block);

};

#endif // CHART_DRAW_H


