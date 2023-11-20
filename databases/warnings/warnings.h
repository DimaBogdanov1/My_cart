#ifndef WARNINGS_H
#define WARNINGS_H

#include <QObject>
#include <QSqlQuery>

class Warnings : public QObject
{
    Q_OBJECT

public:

    explicit Warnings(QObject *parent = nullptr);

    //QSqlDatabase Database;

    QString name_Table = "WARNINGS";

    QString id = "ID";

    QString account_ID = "ACCOUNT_ID";

    QString siteID = "SITEID";

    QString upNom = "UP_NOM";

    QString putNom = "PUT_NOM";

    QString begin_Km = "BEGIN_KM";

    QString begin_M = "BEGIN_M";

    QString end_Km = "END_KM";

    QString end_M = "END_M";

    QString input_Date = "INPUT_DATE";

    QString begin_Date = "BEGIN_DATE";

    QString end_Date = "END_DATE";

    QString speed = "SPEED";

    void create_table();




public slots:

    void add_Warning(int account_ID, int siteID, int upNom, int putNom, int begin_Km, int begin_M, int end_Km, int end_M, QString input_Date, QString begin_Date, QString end_Date, int speed);

    void get_All_Warnings();

    void remove_Old_Warnings();


signals:

    void newWarning_signal(const QString& login, const int& color, const int& upNom, const int& putNom, const int& begin_Km, const int& begin_M, const int& end_Km, const int& end_M, const QString& input_Date, const QString& begin_Date, const QString& end_Date, const int& speed);

};

#endif // WARNINGS_H
