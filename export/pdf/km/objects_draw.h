#ifndef OBJECTS_DRAW_H
#define OBJECTS_DRAW_H

#include "export/pdf/my_pdf.h"

class Objects_Draw
{
public:
    Objects_Draw(My_pdf *pointer, float leftX, float rightX, float y_TopRail, float y_BottomRail, float heightTitle, float km_y);

private:

    My_pdf *m_pointer;

    float leftX, rightX, y_TopRail, y_BottomRail, y_CenterRail, heightTitle, km_y;

    float top_border, bottom_border;

    float half_top_border, half_bottom_border;

    int text_x = 100;

    float spacing, part_arrowLine_width;

    void drawLinesBorders();


    void drawArrowSensors(int x, int number, int index_position, bool isNeedChartLine, bool isNeedDot);

    void drawDoubleArrow(int x, int number, bool isNeedChartLine, bool isNeedDot);

    void drawArrow(QRectF rect, bool isTop);

    void drawCircle(int x);

    void drawBridge(int x_start, int width);

    void drawBranchBridge(int x_start, int width,  bool isTop);


    void drawArrow_Stage_2(int x, int text_x, int number, int left_line_x, int right_line_x, bool isNeedChartLine, bool isNeedDot);

    void drawIsolated_Junction(int x); // bool isTop

    void drawRailroad_Crossing(int x);

    void drawPillar(int x);

    void drawKm_Mark(int x);

    void drawArrow_2(int x, bool isTop);

    enum Positions_Arrow{
        Top_left,
        Top_right,
        Bottom_left,
        Bottom_right
    };
};

#endif // OBJECTS_DRAW_H
