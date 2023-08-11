#ifndef BIG_DATABASE_H
#define BIG_DATABASE_H

#include <QObject>

class big_database : public QObject
{
    Q_OBJECT

public:

    explicit big_database(QObject *parent = nullptr);


public slots:  // Слоты
    void openDatabase(QString path_db);

signals:

    void newItem_Database_signal(const QString& code_Value, const QString& wayNum_Value, const QString& wayName_Value, const QString& startKm_Value, const QString& endKm_Value);

    void mySignal(const QString& strqqqq);

};

#endif // BIG_DATABASE_H
