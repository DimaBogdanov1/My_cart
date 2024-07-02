#ifndef APP_PAGE_H
#define APP_PAGE_H

#include <QObject>
#include <QDebug>

#include "../Design_Values_Lib/frame_page.h"

class App_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Frame_Page* home_Frame_Page MEMBER home_Frame_Page NOTIFY frame_Page_Changed)

    Q_PROPERTY(Frame_Page* history_Frame_Page MEMBER history_Frame_Page NOTIFY frame_Page_Changed)

    Q_PROPERTY(Frame_Page* help_Frame_Page MEMBER help_Frame_Page NOTIFY frame_Page_Changed)

    Q_PROPERTY(Frame_Page* settings_Frame_Page MEMBER settings_Frame_Page NOTIFY frame_Page_Changed)



public:

    inline explicit App_Page(QObject *parent = nullptr) : QObject(parent) {}

private:

    inline static Frame_Page *home_Frame_Page = new Frame_Page;

    inline static Frame_Page *history_Frame_Page = new Frame_Page;

    inline static Frame_Page *help_Frame_Page = new Frame_Page;

    inline static Frame_Page *settings_Frame_Page = new Frame_Page;

signals:

    void frame_Page_Changed(const Frame_Page *value);

};

#endif // APP_PAGE_H
