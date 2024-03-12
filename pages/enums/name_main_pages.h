#pragma once

#include <QObject>
#include <QMetaEnum>

class Name_Main_Pages
{
    Q_GADGET

public:
     enum Main_Pages
          {
            Home_Page,
            Diagnostic_Page,
            History_Page,
            Login_Page,
            Settings_Page,
            Help_Page

          };

    Q_ENUM(Main_Pages)

private:
    explicit Name_Main_Pages();
};

typedef Name_Main_Pages::Main_Pages Status;
