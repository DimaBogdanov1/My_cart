#ifndef TEST_LIB_7_H
#define TEST_LIB_7_H

#include <QObject>

class Test_lib_7 : public QObject
{
    Q_OBJECT
public:
    explicit Test_lib_7(QObject *parent = nullptr);

    void sum(int a, int b);

signals:
    void messageChanged();
};

#endif // TEST_LIB_7_H
