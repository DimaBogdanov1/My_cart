#ifndef MEASURE_H
#define MEASURE_H

#include <QList>
#include <QPointF>
#include <QSettings>


class Measure
{
public:
    Measure(int index);

    int index_Measure;

    QList<QPointF> Chart_points;

    float bias_value = 0; // Смещение

    float multiplier_value = 1; // Множитель

    QString bias_path, multiplier_path;

    double x_coincidence(int index);

    double get_x_in_line(int index_1, int index_2, float y_viser);

    double get_points_line(float y_viser);

    void update_from_setting();

    void set_params(float bias_value, float multiplier_value);

};

#endif // MEASURE_H
