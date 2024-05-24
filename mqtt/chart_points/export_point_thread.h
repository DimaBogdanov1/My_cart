#ifndef EXPORT_POINT_THREAD_H
#define EXPORT_POINT_THREAD_H

#include <QThread>
#include "../Export_Lib/file/export_db.h"
#include "../Export_Lib/export_lib.h"

class Export_Point_Thread : public QThread
{
    Q_OBJECT

public:

    explicit Export_Point_Thread(int index, float x, float y);

    void run();

private:

    int index;

    float x, y;
};

#endif // EXPORT_POINT_THREAD_H
