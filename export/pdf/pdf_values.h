#ifndef PDF_VALUES_H
#define PDF_VALUES_H

#include <QObject>
#include <QPrinter>
#include <QPen>
#include <QIODevice>


class Pdf_Values
{

public:
    Pdf_Values();


    enum Pens {

        Basic,
        BasicOpacity,
        Test,
        KmPen,
        Km_Opacity,
        Border,
        Error_Sensors
    };

    enum Fonts {
        Main_Font,
        Mini_Font
    };

   static QPen getPen(int index);

   static int getMargin(int index);

   static QString getCompanyName();

   static QString getDeviceName();

   static QFont getFont(int index);

private:


   inline static QString companyName =  "РАДИОАВИОНИКА";

   inline static QString deviceName = "МДК: МДК-498"; // tr( "РАДИОАВИОНИКА") const; // deviceName = "МДК: МДК-498";

   inline static QColor opacityBlack = "#80000000";

   inline static int bigSize = 12;

   inline static int miniSize = 6;

   inline static  QList<int> marginList = {10, 5, 10, 10};



   inline static int font_size =  7, mini_font_size = 4;

   inline static QPen *basicPen = new QPen(Qt::black, bigSize, Qt::SolidLine, Qt::RoundCap);

   inline static QPen *basic_OpacityPen = new QPen( opacityBlack, miniSize, Qt::DashLine, Qt::RoundCap);

   inline static QPen *testPen = new QPen(Qt::red, bigSize, Qt::SolidLine, Qt::RoundCap);

   inline static QPen *kmPen = new QPen(Qt::black, miniSize, Qt::SolidLine, Qt::RoundCap);

   inline static QPen *km_OpacityPen = new QPen(opacityBlack, miniSize, Qt::SolidLine, Qt::RoundCap);

   inline static QPen *borderPen = new QPen(opacityBlack, miniSize, Qt::DotLine, Qt::RoundCap);

   inline static QPen *errorSensorsPen = new QPen(Qt::green, miniSize, Qt::SolidLine, Qt::RoundCap);


};

#endif // PDF_VALUES_H
