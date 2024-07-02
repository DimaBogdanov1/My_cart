#pragma once

#include <QObject>
#include <QMetaEnum>

class Home_Page_Names
{
    Q_GADGET

public:

    enum Name_Pages{
        Start_Page,
        Task_DB_Page,
        Custom_Task_DB_Page,
        Warning_Page,
        Diagnostic_Page,
        Finish_Task_Page,
        Chart_Page
    };

   Q_ENUM(Name_Pages)

private:
    explicit Home_Page_Names();
};

typedef Home_Page_Names::Name_Pages My_Home_Name_Pages;

