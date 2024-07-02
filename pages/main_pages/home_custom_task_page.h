#ifndef HOME_CUSTOM_TASK_PAGE_H
#define HOME_CUSTOM_TASK_PAGE_H

#include <QObject>
#include <QDebug>

#include "../Passport_DB_Lib/pages/task_passport_db.h"
#include "../Design_Values_Lib/top_bars_and_menu/models/task_top_bars_models.h"

class Home_Custom_Task_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Task_Passport_DB* task_Passport_DB MEMBER task_Passport_DB NOTIFY task_Passport_DB_Changed)

    Q_PROPERTY(Task_Top_Bars_Models* top_Bars_Models MEMBER top_Bars_Models NOTIFY top_Bars_Models_Changed)

public:

    inline explicit Home_Custom_Task_Page(){

        connect(top_Bars_Models, &Task_Top_Bars_Models::save_Route_Signal, this, &Home_Custom_Task_Page::save_Route_Signal);

       // connect(top_Bars_Models, &Task_Top_Bars_Models::save_Route_Signal, this, &Home_Custom_Task_Page::slot_save_Route);

    }

private:

    inline static Task_Passport_DB *task_Passport_DB = new Task_Passport_DB;

    inline static Task_Top_Bars_Models *top_Bars_Models = new Task_Top_Bars_Models;


signals:

   void task_Passport_DB_Changed(const Task_Passport_DB *value);

   void top_Bars_Models_Changed(const Task_Top_Bars_Models *value);

   void save_Route_Signal();
};

#endif // HOME_CUSTOM_TASK_PAGE_H
