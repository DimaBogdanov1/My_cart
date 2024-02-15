#ifndef CHART_PAGE_H
#define CHART_PAGE_H


#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>


#include "../Export_Lib/export_lib.h"

class Chart_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Defect_Model* My_Defect_Model MEMBER My_Defect_Model NOTIFY defectModel_Changed)

    Q_PROPERTY(Km_Mark_Model* My_Km_Mark_Model MEMBER My_Km_Mark_Model NOTIFY kmMarkModel_Changed)

public:

    inline explicit Chart_Page(QObject *parent = nullptr) : QObject(parent) {}


private:

    inline static Defect_Model *My_Defect_Model = &Export_Lib::defect_Model;

    inline static Km_Mark_Model *My_Km_Mark_Model = &Export_Lib::km_Mark_Model;

signals:
   void defectModel_Changed(const Defect_Model *value);
   void kmMarkModel_Changed(const Km_Mark_Model *value);

};

#endif // CHART_PAGE_H
