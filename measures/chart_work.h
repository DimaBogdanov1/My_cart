#ifndef CHART_WORK_H
#define CHART_WORK_H

#include <QObject>

class Chart_Work : public QObject
{
    Q_OBJECT

public:

    explicit Chart_Work(QObject *parent = nullptr);

    void threadFunction();
    int tmp_y = 0;

    void help_get_line(int index, std::string sk, int y);

public slots:  // Слоты
    void openCSV();
    void add_New_Picket();
    void get_points_line(float y_viser);
    void clearPoints();
    void change_param_measure(int index, float bias_value, float multiplier_value);

    int max(int a, int b);

signals:
    void newPoint_Chart_signal(const int& index, const float& x_val, const float& y_val);

    void newPicket_signal(const int& y_val);

    void newViserValue_signal(const int& index, const float& value);
};

#endif // CHART_WORK_H
