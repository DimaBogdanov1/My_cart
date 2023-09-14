#ifndef WORK_WITH_CHART_H
#define WORK_WITH_CHART_H

#include <QObject>

class Work_with_chart : public QObject
{
    Q_OBJECT
public:

    explicit Work_with_chart(QObject *parent = nullptr);
    void threadFunction();
    int tmp_y = 0;

public slots:  // Слоты
    void openCSV();
    void add_New_Picket();
    void get_points_line(float y_viser);
    void clearPoints();
    int max(int a, int b);



signals:
    void newPoint_Chart_signal(const float& x_val, const float& y_val);

    void newPicket_signal(const int& y_val);

    void newViserValue_signal(const float& value);

};


#endif // WORK_WITH_CHART_H
