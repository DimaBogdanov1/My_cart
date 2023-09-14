#ifndef BIG_DATABASE_H
#define BIG_DATABASE_H

#include <QObject>

class big_database : public QObject
{
    Q_OBJECT

public:

    explicit big_database(QObject *parent = nullptr);

    void set_roads();

public slots:  // Слоты
    void openDatabase(QString path_db);

    void update_numRoad(QString new_index);

    void update_upNom();

    void update_putNom(QString code);

    void update_Type(int index);

    void check_Coordination(QString up_nom, QString name_Direction, QString put_nom, int Input_KM, int Input_M);

signals:

    void newItem_Database_signal(const QString& code_Value, const QString& wayNum_Value, const QString& wayName_Value, const QString& startKm_Value, const QString& endKm_Value);

    void newRoad_signal(const QString& nameRoad_Value);

    void newUpNom_signal(const QString& code_Value, const QString& name_Value);

    void newPutNom_signal(const QString& put_Value, const QString& type_Value, const QString& km_Start_Value, const QString& m_Start_Value, const QString& km_End_Value, const QString& m_End_Value);

    void checkResult_signal(const bool& result_Value);

    void newTask_signal(const QString& upNom_Value, const QString& name_Value, const QString& put_Value);

    void mySignal(const QString& strqqqq);

};

#endif // BIG_DATABASE_H
