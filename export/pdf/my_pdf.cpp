#include <QPrinter>
#include <QPdfWriter>
#include <QPainter>
#include <QTextDocument>
#include <QFontDatabase>
#include <QPainterPath>
#include <QtMath>

#include "my_pdf.h"
#include "km/km_draw.h"
#include "measure_block.h"
#include "chart_draw.h"
#include "export/pdf/pdf_values.h"

My_pdf::My_pdf(QObject *parent) : QObject(parent)
{


}



void My_pdf::setCoef(QPrinter &printer){

    qreal left, top, right, bottom, size_mm, size_px;

    printer.getPageMargins(&left, &top, &right, &bottom, QPrinter::DevicePixel);

    qDebug() << "Marges px :" << left << top << right << bottom;

    size_px = left;

    printer.getPageMargins(&left, &top, &right, &bottom, QPrinter::Millimeter);


    qDebug() << "Marges mm :" << left << top << right << bottom;

    size_mm = left;

    qDebug() << "size_px : " + QString::number(size_px);

    qDebug() << "size_mm : " + QString::number(size_mm);

    coef = size_px / size_mm;

    spacingMeasure *= coef;

    width_Measure = 4 * coef;

    qDebug() << "spacingMeasure = " + QString::number(spacingMeasure);

    qDebug() << "coef = " + QString::number(coef);
}

QString My_pdf::addCharacters(QString str, bool isBrackets, bool addSpacing){

    QString leftChar = "<";

    QString rightChar = ">";

    QString spacing = "";

    if(isBrackets){

        leftChar = "(";

        rightChar = ")";

    }

    if(addSpacing){

        spacing = " ";
    }

    return leftChar + str + rightChar + spacing;
}

QList<float> My_pdf::getSize(QString str){

    QFontMetrics tailleMotPx = painter->fontMetrics();

  //  painter->setPen(Qt::black);

    float header_width = tailleMotPx.width(str);

    float header_height = tailleMotPx.height();

    QList<float> size;

    size.append(header_width);

    size.append(header_height);


    return size;
}

void My_pdf::drawTextByCentr(float width_block, float x, float y_start, float y_stop, QString title){

    painter->rotate(-90);

    QList<float> size = getSize(title);

    float a = (y_stop - size[0]) / 2 ;

    float b = (width_block - size[1])  * 1.5;


    painter->drawText(-1 * y_start + a,  x - b, title);

    painter->rotate(90);

}


void My_pdf::drawTextByLeft(float width_block, float x, float y_start,  QString title){

    painter->rotate(-90);

    QList<float> size = getSize(title);

    float b_1 = (width_Measure - size[1])  * 1.5;

    painter->drawText(-1 * y_start + spacingMeasure,  x - b_1, title);

    painter->rotate(90);

}

void My_pdf::drawLine(QPointF point_1, QPointF point_2, QPen pen){

    //painter->rotate(90);

  //  painter->setPen(QPen(Qt::black, 12, Qt::SolidLine, Qt::RoundCap));

    painter->setPen(pen);

   // qDebug() << "ddddd  " + QVariant(pen.color()).toString() ;

    painter->drawLine(point_1, point_2);

}


void My_pdf::drawText(QPointF point, QString text){

    painter->drawText(point.x(), point.y(), text);

}


void My_pdf::createHeader(){

    float header_height = 4 * coef;

    QString num = addCharacters(QString::number(counLayer), true, true);

    if(counLayer == 1){

        num = "";
    }

    QString header =
                    Pdf_Values::getCompanyName() + ": ПО " +
                    app_version + " " +
                    addCharacters(instructions_version, true, true) +
                    "от 25.04.22 " +
                    Pdf_Values::getDeviceName() + " " +
                    addCharacters("ПС Анциферов И.Н.", true, true) +
                    addCharacters("БПД от " + date_UpdateDB, true, true) +
                    addCharacters("Северо-Кавказская", false, false) +
                    addCharacters(date_Decoding, false, false) +
                    addCharacters(move[movingForward ? 1 : 0], false, false) +
                    addCharacters(orientation[orientationRight ? 1 : 0], false, false) +
                    addCharacters("Канон", false, false) +
                    addCharacters(reportingPeriod + " " + type_Check +  " Проезд: " +  date_Start + " Дубликат", false, true) +
                    "Л: 1 " + num
            ;


    // Cчитываем размеры
    QFontMetrics tailleMotPx = painter->fontMetrics();
   // int largeurLabel = tailleMotPx.width("titre");

    painter->setPen(Qt::black);
  //  painter.drawText(printer.width() / 2 - largeurLabel / 2, 50, "Заголовок");



    float header_width = tailleMotPx.width(header);

    float title_y = (header_height + tailleMotPx.height() / 2) / 2;

    painter->drawText(printer->width() - header_width, title_y, header); //  QString::fromUtf8(header)

    //qDebug() << "header_height = " + QString::number(header_height) +  " height_line = " + QString::number(height_line);

   // drawLine(QPointF(0, 0), QPointF(printer->width(), 0));

    drawLine(QPointF(0, header_height), QPointF(printer->width(), header_height),  Pdf_Values::getPen(Pdf_Values::Basic));

    createRouteBlock(header_height);
}

void My_pdf::createRouteBlock(float height){


   int widthRoute = 7 * coef;

   int heightRoute = height + 145 * coef;


   // Здесь должна быть проверка если большой километр, то шапку не рисуем

   ChartDraw chartDraw(this, height, widthRoute, heightRoute);

   drawLine(QPointF(0, heightRoute), QPointF(printer->width(), heightRoute), Pdf_Values::getPen(Pdf_Values::Basic));


   if(!needNextPage){


       drawLine(QPointF(0, height),  QPointF(0, printer->height()),  Pdf_Values::getPen(Pdf_Values::Basic));

       drawLine(QPointF(widthRoute, height), QPointF(widthRoute, heightRoute), Pdf_Values::getPen(Pdf_Values::Basic));

       drawLine(QPointF(0, heightRoute), QPointF(widthRoute, heightRoute), Pdf_Values::getPen(Pdf_Values::Basic));







        QString route =
                "Пискарёвка-Ладожское оз " +
                addCharacters(upNom, true, true) +
                tr("Путь: ") + putNom + " " +
                tr("Км: ") + QString::number(km) + " " +
                tr("ПЧ-") + QString::number(pch) + "/" +
                tr("ПЧУ-") + QString::number(pchy) + "/" +
                tr("ПД-") + QString::number(pd) + "/" +
                tr("ПДБ-") + QString::number(pdb) + " " +
                tr("Уст: ") + QString::number(setSpeed_1) + "/" + QString::number(setSpeed_2) + " " +
                tr("Скор: ") + QString::number(speed)

                ;



        QList<float> size = getSize(route);

       // qDebug() << "Size = " + QString::number(size[0]);

        painter->rotate(-90);

       // qDebug() << "printer->height() = " + QString::number(printer->height()) + " size[1] = " + QString::number(size[1]);

        painter->drawText(-1 * (size[0] + height + spacingMeasure),  (widthRoute - size[1] / 2) / 2, route);


        QString markString =
                tr("Балл: ") + QString::number(mark) + " " +
                tr("Кол.ст. - ") + "1:42;" + " 2:8;" + " 3:0" + " 4:0" +
                tr("Кол.огр.: ") + QString::number(coun_restrictions) +
                tr("Огр: ") +
                tr("Пред: -") +
                tr("КрдПЧ")
                ;

        size = getSize(markString);

        painter->drawText(-1 * (size[0] + height + spacingMeasure), (widthRoute / 2 +  ((widthRoute + size[1]) / 2) / 2) , markString); //  QString::fromUtf8(header)

        painter->rotate(90);

   }





}



void My_pdf::print_pdf()
{

    counLayer = 1;

    counKm_OnPages.clear();

    needNextPage = false;




    printer = new QPrinter(QPrinter::HighResolution);

    printer->setOutputFormat(QPrinter::PdfFormat);

    printer->setOutputFileName("/Users/Shared/examplse.pdf");

    printer->setOrientation(QPrinter::Landscape);

    printer->setPaperSize(QPrinter::A4);

    printer->setPageSize(QPrinter::A4);

   // qDebug() << "Margin top = " + QString::number( marginList[1]);

    printer->setPageMargins(Pdf_Values::getMargin(0), Pdf_Values::getMargin(1), Pdf_Values::getMargin(2), Pdf_Values::getMargin(3), QPrinter::Millimeter);

    setCoef(*printer);

   //qDebug() << "Page px :" << printer.pageRect() << printer.paperRect();
   //qDebug() << "Page mm :" << printer.pageRect(QPrinter::Millimeter) << printer.paperRect(QPrinter::Millimeter);





   painter = new QPainter(printer);

   //painter(&printer);


   int id = QFontDatabase::addApplicationFont(":/fonts/CircularStd_Book.ttf");

   QString family = QFontDatabase::applicationFontFamilies(id).at(0);
   QFont font(family, 7);

   qDebug() << "font_size = " + QString::number(font_size) + " value = " +  move[movingForward ? 1 : 0];

 //  auto page_size = printer.pageRect(QPrinter::Unit::Millimeter);
   //painter.setWindow(page_size.toRect());


   painter->setFont(font);

   float counPages =  (float) distanse / 100; //   float(distanse / 1000) / 11;  // qCeil( float(distanse / 1000) / 11);

   int a = counPages / 11;

   float b = counPages - a * 11;


   qDebug() << "a = " + QString::number(a);

   for(int i = 0; i < a; i++){

       counKm_OnPages.append(11);
   }

   qDebug() << "b = " + QString::number(b);

   counKm_OnPages.append(b);


   qDebug() << "Количество страниц = " + QString::number(counKm_OnPages.length());

   for(int i = 0; i < counKm_OnPages.length(); i++){

       if(i > 0){

           printer->newPage();

           counLayer++;
       }

       createHeader();

   }


   //drawLine(QPointF(11000, 3500), QPointF(11000, 3500 + 30 * coef), *testPen);

  /* QColor yellow("#f0d048");
   Qt::BrushStyle style = Qt::SolidPattern;
   QBrush brush(yellow, style);
   painter->setBrush(brush); */
  // painter->drawEllipse(800,800,400,400);



  /* painter->setRenderHint(QPainter::Antialiasing);
   QPainterPath path;
   path.addRoundedRect(QRectF(800,800,400,400), 100, 100);
   QPen pen(Qt::black, 10);
   painter->setPen(pen);
   painter->fillPath(path, Qt::red);
   painter->drawPath(path); */
 //  painter.drawText(printer.width() - header_width, printer.pageRect().y()*2, header); //  QString::fromUtf8(header)




   //painter.drawLine(QPoint(100,100), QPoint(5000,5000));

  // painter.drawText(0, printer.pageRect().y()*2, header); //  QString::fromUtf8(header)

  // painter.drawText(QRect(QPoint(100,100), QPoint(5000,5000)), Qt::AlignHCenter, header);


   // Нужно узнать сколько листов мы будем рисовать


  /* if(needNextPage){

       printer->newPage();

       counLayer++;

       createHeader();

   }*/

    painter->end();

}



