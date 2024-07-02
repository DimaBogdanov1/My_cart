#ifndef HOME_START_PAGE_H
#define HOME_START_PAGE_H

#include <QObject>
#include <QDebug>

#include <QProcess>

class Home_Start_Page : public QObject
{
    Q_OBJECT

public:

    inline explicit Home_Start_Page(){

      //  connect(top_Bars_Models, &Task_Top_Bars_Models::save_Route_Signal, this, &Home_Custom_Task_Page::slot_save_Route);
    }

    Q_INVOKABLE void connect_Broker(bool value){

        QProcess process;

        QString script = "start_2.sh";

        if(!value){

            script = "stop_2.sh";
        }

        process.startDetached("/bin/sh", QStringList()<< "/Users/dimabogdanov/Documents/MyCart_res/broker/mac64/" + script);
    }

private:



};

#endif // HOME_START_PAGE_H
