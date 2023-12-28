#include <QDebug>
#include <QFontDatabase>

#include "pdf_values.h"

Pdf_Values::Pdf_Values()
{

}

int Pdf_Values::getMargin(int index){

    return marginList[index];
}

QString Pdf_Values::getCompanyName(){

    return companyName;
}


QString Pdf_Values::getDeviceName(){

    return  deviceName;
}

QFont Pdf_Values::getFont(int index){

    int id = QFontDatabase::addApplicationFont(":/fonts/CircularStd_Book.ttf");

    QString family = QFontDatabase::applicationFontFamilies(id).at(0);

    int answer_font_Size;

    switch(index){

    case Main_Font:

        answer_font_Size = font_size;

        break;

    case Mini_Font:

        answer_font_Size = mini_font_size;

        break;
    }

    return QFont(family, answer_font_Size);

}


QPen Pdf_Values::getPen(int index){

    QPen picked_pen;

    switch(index){

    case Basic:

        picked_pen = *basicPen;

        break;

    case BasicOpacity:

        picked_pen = *basic_OpacityPen;

        break;

   case Test:

        picked_pen = *testPen;

        break;

    case KmPen:

         picked_pen = *kmPen;

         break;

    case Km_Opacity:

        picked_pen = *km_OpacityPen;

        break;

    case Border:

        picked_pen = *borderPen;

        break;

    case Error_Sensors:

        picked_pen = *errorSensorsPen;

        break;

    }

    return picked_pen;
}
