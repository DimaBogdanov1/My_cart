#include "export_point_thread.h"

Export_Point_Thread::Export_Point_Thread(int index, float x, float y)
{
    this->index = index;

    this->x = x;

    this->y = y;

}

void Export_Point_Thread::run(){

    Export_DB export_db(Export_Lib::db_path);

    export_db.insertPoint(index, x, y);

}
