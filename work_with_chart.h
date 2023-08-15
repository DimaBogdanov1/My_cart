#ifndef WORK_WITH_CHART_H
#define WORK_WITH_CHART_H

#include <QObject>

class Work_with_chart : public QObject
{
    Q_OBJECT
public:

    explicit Work_with_chart(QObject *parent = nullptr);
    void threadFunction();
    int tmp_y = 12;

public slots:  // Слоты
    void openCSV();
    void add_New_Picket();
    int max(int a, int b);


signals:
    void newPoint_Chart_signal(const int& x_val, const int& y_val);

    void newPicket_signal(const int& y_val);

};


#endif // WORK_WITH_CHART_H
