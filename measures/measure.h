#ifndef MEASURE_H
#define MEASURE_H

#include <QList>
#include <QPointF>


class Measure
{
public:
    Measure();

    QList<QPointF> Chart_points;

    float bias_value = 0; // Смещение

    float multiplier_value = 1; // Множитель

    double x_coincidence(int index);

    double get_x_in_line(int index_1, int index_2, float y_viser);

    double get_points_line(float y_viser);


};

#endif // MEASURE_H
