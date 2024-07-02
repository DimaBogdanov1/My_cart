#ifndef TASK_DB_PAGE_H
#define TASK_DB_PAGE_H

#include <QObject>
#include <QDebug>

#include "../Design_Values_Lib/top_bars_and_menu/models/task_top_bars_models.h"

#include "../Passport_DB_Lib/pages/task_block.h"

class Task_DB_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Task_Block* task_Block MEMBER task_Block NOTIFY task_Block_Changed)

    Q_PROPERTY(Task_Top_Bars_Models* top_Bars_Models MEMBER top_Bars_Models NOTIFY top_Bars_Models_Changed)

public:

    inline explicit Task_DB_Page(QObject *parent = nullptr) : QObject(parent) {

        connect(top_Bars_Models, &Task_Top_Bars_Models::save_Route_Signal, this, &Task_DB_Page::save_Route_Signal);

    }

private:

    inline static Task_Block *task_Block = new Task_Block;

    inline static Task_Top_Bars_Models *top_Bars_Models = new Task_Top_Bars_Models;

signals:

   void task_Block_Changed(Task_Block *value);

   void top_Bars_Models_Changed(const Task_Top_Bars_Models *value);

   void save_Route_Signal();

};

#endif // TASK_DB_PAGE_H
