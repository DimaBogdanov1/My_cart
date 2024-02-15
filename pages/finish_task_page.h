#ifndef FINISH_TASK_PAGE_H
#define FINISH_TASK_PAGE_H


#include <QObject>
#include <QDebug>

#include "../User_DB_Lib/warnings/warnings.h"

class Finish_Task_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Warnings_Model* My_Warnings_Model MEMBER My_Warnings_Model NOTIFY model_Changed)

public:

    inline explicit Finish_Task_Page(QObject *parent = nullptr) : QObject(parent) {

       Warnings::get_All_Warnings();

    }

private:

    inline static Warnings_Model *My_Warnings_Model = &Warnings::warnings_Model;

signals:
   void model_Changed(const Warnings_Model *value);
};

#endif // FINISH_TASK_PAGE_H
