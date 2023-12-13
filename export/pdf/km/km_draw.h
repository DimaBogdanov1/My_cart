#ifndef KM_DRAW_H
#define KM_DRAW_H

#include "export/pdf/my_pdf.h"

class Km_Draw
{
public:
    Km_Draw(My_pdf *pointer, float heightTitle, float leftX, float rightX, float heightKm);

    void createKm_Block(float heightTitle, float leftX, float rightX, float heightKm);

    int getLeftFinishX();

private:

    My_pdf *m_pointer;

    float heightKm;

    int counRiht = 35;

    int km_mm = 25;

    int coun_km;// 11;

    int diff, y_TopRail, y_BottomRail, leftX, rightX, left_finish_x;

    float basic_km_width;

    float one_km_width;

    float rihtHeight;

    float dop_value;

    float km_y;

    int coun_1996_sleepers_on_km = 10;

    enum typeSleepers {

        Wood,
        Reinforced_Concrete,
        Before_1996
    };

    void createKmValues(float km_y);

    void createSleepers(float y_TopRail, float y_BottomRail, float rightX, int index_type);

    void createRiht(int x_start, int x_stop, bool isTop);

    void createHelpLine(int x_start, int x_stop, int y);

    void createErrorSensorsLine(int x_start, int x_stop, int y);

};

#endif // KM_DRAW_H
