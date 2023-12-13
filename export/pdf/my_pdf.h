#ifndef MY_PDF_H
#define MY_PDF_H

#include <QObject>
#include <QMqttClient>
#include <QPrinter>

#include "measure_block.h"

class My_pdf : public QObject
{
    Q_OBJECT

public:
    explicit My_pdf(QObject *parent = nullptr);

    QString app_version = "1.0", instructions_version = "436/р", date_UpdateDB = "12.06.2023 17:35", date_Decoding = "17.04.2023 12:35", date_Start = "17.04.2023 12:10";

    QString reportingPeriod = "04-2022", type_Check = "раб.";

    bool movingForward = true, orientationRight = true;

    QString upNom = "15231";

    QString putNom = "1";

    int siteID = 0, km = 38, pch = 14, pchy = 3,  pd = 7, pdb = 7, mark = 20, coun_restrictions = 0;

    float setSpeed_1 = 60, setSpeed_2 = 60, speed = 20;

    //QList<int> extents {42, 8, 0, 0};

    void drawLine(QPointF point_1, QPointF point_2, QPen pen);


    QPrinter *printer;

    QPainter *painter;


    float coef = 1, spacingMeasure = 1, width_Measure;


    QList<float> counKm_OnPages = {};

    int distanse = 730; // 28600; //6300; // 10000; // 6300;



    int counLayer = 1, pageMargin = 5, font_size = 6;

    bool needNextPage = false;

    QList<float> getSize(QString str);

    void drawText(QPointF point, QString text);




    void drawTextByCentr(float width_block, float x, float y_start, float y_stop, QString title);

    void drawTextByLeft(float width_block, float x, float y_start,  QString title);

private:

    QList<QString> move {tr("Обратный"), tr("Прямой")} , orientation {tr("Дополнительная"), tr("Базовая") };

    void createHeader();

    QString addCharacters(QString str, bool isBrackets, bool addSpacing);

    void setCoef(QPrinter &printer);

    void createRouteBlock(float height);


protected:

public slots:
    void print_pdf();


};

#endif // MY_PDF_H
