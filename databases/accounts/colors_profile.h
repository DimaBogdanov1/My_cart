#ifndef COLORS_PROFILE_H
#define COLORS_PROFILE_H

#include <QObject>

class Colors_Profile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QString> colors_List READ getList CONSTANT)

public:
    inline explicit Colors_Profile(QObject *parent = nullptr) : QObject(parent) {}

    //inline static const QList<QString> list{"#BAEFC1", "#BCEBFF", "#D9CDFB", "#FDEA9E", "#A3CDB7", "#B798E6"};

    inline static const QList<QString> list{"#BEBDFD", "#FF897F", "#99D7C4", "#FEC338", "#FF8E52", "#9B84DE"};

    Q_INVOKABLE inline static QList<QString> getList() {return list;}

};

#endif // COLORS_PROFILE_H
