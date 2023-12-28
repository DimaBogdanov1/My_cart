#ifndef MEASURE_LINES_H
#define MEASURE_LINES_H

#include <QList>
#include <QPointF>


class Measure_Lines
{
public:
    Measure_Lines(QList<QPointF> main_Line_Points);

    QList<QPointF> main_Line_Points;

};

#endif // MEASURE_LINES_H
