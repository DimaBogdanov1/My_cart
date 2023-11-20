#ifndef CHART_WORK_H
#define CHART_WORK_H

#include <QObject>

class Chart_Work : public QObject
{
    Q_OBJECT

public:

    explicit Chart_Work(QObject *parent = nullptr);

    int count_measures;

    void threadFunction();
    int tmp_y = 0;

    void help_get_line(int index, std::string sk, int y);

private:

    bool check_drawChart = false;


public slots:  // Слоты
    void openCSV();
    void create_KmLine();
    void get_points_line(float y_viser);
    void clearPoints();
    void change_param_measure(int index, float bias_value, float multiplier_value);

    void calibPage_Ready();

    int max(int a, int b);

    void add_ChartPoint(int index, float val, int y);

    void change_check_Draw(bool check);


signals:
    void newPoint_Chart_signal(const int& index, const float& x_val, const float& y_val);

    void newPicket_signal(const int& y_val);

    void newViserValue_signal(const int& index, const float& value);

    void updateCalibBlock_signal(const int& index, const float& bias_value, const float& multiplier_value);

};

#endif // CHART_WORK_H
