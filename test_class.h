#ifndef TEST_CLASS_H
#define TEST_CLASS_H

#include <QObject>
#include "../Export_Lib/file/export_db.h"
#include "../Export_Lib/export_lib.h"

class Test_Class : public QObject
{
    Q_OBJECT

public:

    explicit Test_Class(QObject *parent = nullptr);

private:

    int num_km_id = 1; //0;

    int num_km = 38;

    Params add_New_CheckMeasure(int index);

    void add_New_Km(int num_Km, QString name_SiteId, int site_Id, int distance);

public slots:

    void print_pdf();

    void addNew_Km();

    void addGeneral_Info();


    void test_slot_NewKm();

    void test_slot_CloseExportMicroservice();



};

#endif // TEST_CLASS_H
