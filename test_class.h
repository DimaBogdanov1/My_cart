#ifndef TEST_CLASS_H
#define TEST_CLASS_H

#include <QObject>

class Test_Class : public QObject
{
    Q_OBJECT

public:

    explicit Test_Class(QObject *parent = nullptr);

public slots:

    void print_pdf();

    void test_slot_NewKm();

    void test_slot_NewParams();

    void add_New_CheckMeasure(int index);


    void test_slot_NewGeneralInfo();

    void test_slot_CloseExportMicroservice();

    void test_slot_add_sleepers();

    void test_slot_add_bridge();

    void test_slot_add_arrow();

    void test_slot_add_object();

    void test_slot_helpLine();

};

#endif // TEST_CLASS_H
