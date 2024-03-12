#ifndef CUSTOM_TASK_PAGE_H
#define CUSTOM_TASK_PAGE_H

#include <QObject>
#include <QDebug>

class Custom_Task_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString siteId MEMBER siteId WRITE set_SiteId NOTIFY string_changed)

    Q_PROPERTY(QString upNom MEMBER upNom WRITE set_UpNom NOTIFY string_changed)

    Q_PROPERTY(QString putNom MEMBER putNom WRITE set_PutNom NOTIFY string_changed)

    Q_PROPERTY(QString startKm MEMBER startKm WRITE set_StartKm NOTIFY string_changed)

    Q_PROPERTY(QString startM MEMBER startM WRITE set_StartM NOTIFY string_changed)

    Q_PROPERTY(QString speed_Pass MEMBER speed_Pass WRITE set_Speed_Pass NOTIFY string_changed)

    Q_PROPERTY(QString speed_Freight MEMBER speed_Freight WRITE set_Speed_Freight NOTIFY string_changed)


public:

    inline explicit Custom_Task_Page(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void set_SiteId(QString value){siteId = value;}

    Q_INVOKABLE void set_UpNom(QString value){upNom = value;}

    Q_INVOKABLE void set_PutNom(QString value){putNom = value;}

    Q_INVOKABLE void set_StartKm(QString value){startKm = value;}

    Q_INVOKABLE void set_StartM(QString value){startM = value;}

    Q_INVOKABLE void set_Speed_Pass(QString value){speed_Pass = value;}

    Q_INVOKABLE void set_Speed_Freight(QString value){speed_Freight = value;}

private:

    inline static QString siteId, upNom, putNom, startKm, startM, speed_Pass, speed_Freight;

signals:
   void string_changed(const QString &value);
};

#endif // CUSTOM_TASK_PAGE_H
