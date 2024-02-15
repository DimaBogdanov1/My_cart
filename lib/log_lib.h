#ifndef LOG_LIB_H
#define LOG_LIB_H

#include <QFile>
#include <QString>

class Log_Lib : public QObject
{
    Q_OBJECT
public:
    //Log_Lib();

    explicit Log_Lib(QObject *parent = nullptr);

    static void Add_Row(int num_App, int type_Action, QString message);

    enum Num_Apps {
        Tablet_App,
        PC_App,
        Utilite_App

    };

    enum Type_Actions {
        Basic_Action,
        Warning_Action,
        Error_Actions

    };

private:

    inline static QFile *log_File;


signals:
    void messageChanged();
};

#endif // LOG_LIB_H
