#ifndef TEST_THREAD_H
#define TEST_THREAD_H


#include <QThread>
class test_thread : public QThread
{
   Q_OBJECT
protected:
    void run ()
    {
        //Код который будет выполнятся в новом потоке
    }
}
#endif // TEST_THREAD_H
