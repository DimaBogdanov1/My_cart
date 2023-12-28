#ifndef ANALYSIS_DRAW_H
#define ANALYSIS_DRAW_H

#include "export/pdf/my_pdf.h"
#include "table_element.h"

class Analysis_Draw
{
public:
    Analysis_Draw(My_pdf *pointer, float y_top, float rightX);

private:
    My_pdf *m_pointer;

    float y_top, rightX;

    void drawTable(QList<QString> titles,  QList<float> sizes, float x, bool needDrawLine, bool isBasicPen);

    void drawTitle(Table_Element element, float x, bool needDrawLine, bool isBasicPen);

    void drawInfoBlock_Stage_1(QString num, QString r, QString h, QString sample, QString tmp, float x, bool isCurve);

    void drawInfoBlock_Stage_1(bool isRepair, bool isUp, float x);

    void drawInfoBlock_Stage_2(QString title, float x, bool isNeedRect);

    void drawCorrect_or_Station_Block(bool isCorrectBlock, float x, int meter_value, int index, int value);



    QList<QString> titles = {"м", "Отст.", "Ст.", "Откл.", "Дл.", "Балл", "Огр. ск."};

    QList<float> sizes = {6, 7, 5, 7, 5, 7, 10.4};

   // QPen *analysisis_Pen;

    enum Correct_Names
         {
           Correct_Not_Required,
           Correct_Km_Pole,
           Correct_GNSS,
           Correct_Arrow
         };
};

#endif // ANALYSIS_DRAW_H
