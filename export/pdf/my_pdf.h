#ifndef MY_PDF_H
#define MY_PDF_H

#include <QObject>
#include <QMqttClient>
#include <QPrinter>

#include "export/pdf/chart/measure_block.h"

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

    int distanse = 1730; // 28600; //6300; // 10000; // 6300;



    int counLayer = 1; // font_size = 7;//

    bool needNextPage = false;

    QList<float> getSize(QString str);

    void drawText(QPointF point, QString text);



    void drawRotateText(float x_start, float y_start, float x_finish, float y_finish,  QString title, int index_position);





    QList<QPointF> level_Points; //= {QPointF(-40, 8), QPointF(-30, 4), QPointF(-20, 4), QPointF(-10, 4), QPointF(0, 4), QPointF(-10, 4) };

    QList<QPointF> rihtLeft_Points;

    QList<QPointF> rihtRight_Points;

    QList<QPointF> sample_Points;

    QList<QPointF> downLeft_Points;

    QList<QPointF> downRight_Points;



    QList<QList<QPointF>> pointList;

private:

    QList<QString> move {tr("Обратный"), tr("Прямой")} , orientation {tr("Дополнительная"), tr("Базовая") };

    void createHeader();

    QString addCharacters(QString str, bool isBrackets, bool addSpacing);

    void setCoef(QPrinter &printer);

    void createRouteBlock(float height);



    void openCSV();

    void help_get_line( int index, std::string sk, int y);

protected:

public slots:
    void print_pdf();


};

#endif // MY_PDF_H
