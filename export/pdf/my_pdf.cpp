#include <QPrinter>
#include <QPdfWriter>
#include <QPainter>
#include <QTextDocument>
#include <QFontDatabase>
#include <QPainterPath>
#include <QtMath>

#include "my_pdf.h"
#include "km/km_draw.h"

#include "export/pdf/chart/chart_draw.h"
#include "export/pdf/pdf_values.h"


#include <sstream>
#include <fstream>

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

void My_pdf::drawRotateText(float x_start, float y_start, float x_finish, float y_finish,  QString title, int index_position){


    painter->rotate(-90);


    float height = y_finish - y_start;

    float x_centr = (x_start + x_finish) / 2;


   // QList<float> size = getSize(title);

    QList<float> size = getSize("м");

    QList<float> size_2 = getSize(title);


    float e = (height - size_2[0]) / 2;  //  2 * spacing =  height

    float t = (height  - size_2[0]) - spacingMeasure; // height;


    float y_value;

    float x_value = size[0] / 2;

    switch(index_position){

    case 0: // Центр

        y_value = y_finish - e;

        break;

    case 1: // Левый край

        y_value = y_finish - spacingMeasure;

        break;

    case 2: // Правый край

        y_value = y_finish - t;//     + spacingMeasure;

        break;
    }

    if(title == "к"){

        // 7 - size[0]
        // 4 - ?
        //

        qDebug() << "x_value = " + QString::number(x_value - ((7 - 4) * 2) );


        x_value -= (7 - 4) * 2; // 17; // (4 * size[0]) / 7;

        qDebug() << "size[0] = " + QString::number(size[0]);
    }

    /*if(!isCentr){

        y_value = y_finish - spacingMeasure;
    } */


   // qDebug() << " size[0] / 2 = " + QString::number(size[0] / 2);

    painter->drawText (-1 * y_value,  x_centr + x_value, title); // half_top_border - y_start   // x центр + size[0] / 2   // width_block / 2

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




        QString markString =
                tr("Балл: ") + QString::number(mark) + " " +
                tr("Кол.ст. - ") + "1:42;" + " 2:8;" + " 3:0" + " 4:0" +
                tr("Кол.огр.: ") + QString::number(coun_restrictions) +
                tr("Огр: ") +
                tr("Пред: -") +
                tr("КрдПЧ")
                ;



     /*   painter->rotate(-90);

       // qDebug() << "printer->height() = " + QString::number(printer->height()) + " size[1] = " + QString::number(size[1]);

        painter->drawText(-1 * (size[0] + height + spacingMeasure),  (widthRoute - size[1] / 2) / 2, route);



        size = getSize(markString);

        painter->drawText(-1 * (size[0] + height + spacingMeasure), (widthRoute / 2 +  ((widthRoute + size[1]) / 2) / 2) , markString); //  QString::fromUtf8(header)

        painter->rotate(90); */


        drawRotateText(0, height, widthRoute / 2, heightRoute, route, 2);

        drawRotateText(widthRoute / 2, height, widthRoute, heightRoute, markString, 2);


   }





}


using namespace std;





void My_pdf::print_pdf()
{

    level_Points.clear();

    pointList.clear();

    openCSV();


    pointList.append(downRight_Points);

    pointList.append(downLeft_Points);

    pointList.append(sample_Points);

    pointList.append(rihtRight_Points);

    pointList.append(rihtLeft_Points);

    pointList.append(level_Points);



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


   painter->setFont(Pdf_Values::getFont(Pdf_Values::Main_Font));


   float counPages =  (float) distanse / 100; //   float(distanse / 1000) / 11;  // qCeil( float(distanse / 1000) / 11);

   int a = counPages / 11;

   float b;

   if(a > 0){

       b = (counPages - a * 11) ;
   }
   else{

       b = (counPages - a * 11) ; //- 1;
   }

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


void My_pdf::help_get_line( int index, string sk, int y){

    QString aa = QString::fromStdString(sk);

    aa = aa.simplified();

    aa.replace(" ","");

   // qDebug() <<  QString::number(delete_space(sk));

   qDebug() <<  QString::number(QString(aa).toDouble()); // + " + bias = " + QString::number(Measure_List[index].bias_value);  // QString::fromStdString(sk);

   float e = aa.toDouble();

   switch(index){

    case 0:

       //level_Points.append( QPointF(-73.5, 0) );

     //  level_Points.append( QPointF(55.5, 0) );


       level_Points.append( QPointF(e, 0) );

       break;

   case 1:

 //     rihtLeft_Points.append( QPointF(46, 0) );

      rihtLeft_Points.append( QPointF(e, 0) );

      break;

   case 2:

       //rihtRight_Points.append( QPointF(-46, 0) );

      rihtRight_Points.append( QPointF(e, 0) );

      break;

   case 3:

      sample_Points.append( QPointF(e, 0) );

      break;

   case 4:

      downLeft_Points.append( QPointF(e, 0) );

      break;

   case 5:

      downRight_Points.append( QPointF(e, 0) );

      break;

   }

}

void My_pdf::openCSV(){

   std:: ifstream work_file("/Users/dimabogdanov/Documents/MyCart_res/railway.csv");

    string line;

    char delimiter = ';';

    //Читаем первую строку, чтобы отбросить ее, так как она является заголовком
    getline(work_file, line);

    int count = 0;

    // Прочитали все строчки
    while (getline(work_file, line))
    {
        if(count >= 300){

            break;
        }

        stringstream stream(line); // Преобразование строки в поток

        string num_frame, sk, down_left, down_right, riht_left, riht_right, level;

        for(int i = 0; i < 8; i++){

            // Извлечение всех значений в этой строке

            getline(stream, num_frame, delimiter);
        }

        getline(stream, level, delimiter);

        help_get_line( 0, level, 0);


        getline(stream, num_frame, delimiter);

        getline(stream, sk, delimiter);

        getline(stream, down_left, delimiter);

        getline(stream, down_right, delimiter);

        getline(stream, riht_left, delimiter);

        getline(stream, riht_right, delimiter);



        help_get_line( 3, sk, 0);

        help_get_line( 4, down_left, 0);

        help_get_line( 5, down_right, 0);

        help_get_line( 1, riht_left, 0);

        help_get_line( 2, riht_right, 0);


        count++;

    }

    work_file.close();



}


