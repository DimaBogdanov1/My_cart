#ifndef MAIN_PAGE_H
#define MAIN_PAGE_H

#include <QObject>
#include <QDebug>

#include "../Design_Values_Lib/frame_page.h"

class Main_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Frame_Page* main_Frame_Page MEMBER main_Frame_Page NOTIFY frame_Page_Changed)

public:

    inline explicit Main_Page(QObject *parent = nullptr) : QObject(parent) {}

private:

    inline static Frame_Page *main_Frame_Page = new Frame_Page;

signals:

    void frame_Page_Changed(const Frame_Page *value);

};

#endif // MAIN_PAGE_H
