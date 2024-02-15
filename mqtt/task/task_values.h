#ifndef TASK_VALUES_H
#define TASK_VALUES_H

#include <QObject>

class Task_Values : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<int> now_pch_List MEMBER now_pch_List  WRITE setPch NOTIFY pchChanged)

    Q_PROPERTY(QList<QString> now_Station_Pair MEMBER now_Station_Pair  WRITE setStation NOTIFY pchChanged)

    Q_PROPERTY(int upNom MEMBER upNom WRITE setPutNom NOTIFY upNomChanged)

    Q_PROPERTY(QString nameDirection MEMBER nameDirection WRITE setNameDirection NOTIFY nameDirectionChanged)

    Q_PROPERTY(int putNom MEMBER putNom WRITE setPutNom NOTIFY putNomChanged)

    Q_PROPERTY(float startCood MEMBER startCood WRITE setStartCood NOTIFY startCoodChanged)

public:

    inline explicit Task_Values(QObject *parent = nullptr) : QObject(parent) {}

    inline static QList<int> now_pch_List = {44, 3, 3, 12};

    inline static QList<QString> now_Station_Pair = {"Станция 1", "Станция 2"};

    inline static int upNom = 112823;

    inline static QString nameDirection = "Москва-Рига";

    inline static int putNom = 17;

    inline static float startCood = 38.2;

public slots:

    void setPch(QList<int> value){

        now_pch_List = value;  //.clear();

        if(value.length() == 4){

            emit pchChanged(value.at(0), value.at(1), value.at(2), value.at(3));

        }
    }

    void setStation(QList<QString> value){now_Station_Pair = value; emit stationChanged(now_Station_Pair.at(0), now_Station_Pair.at(1));}

    void setUpNom(int value){upNom = value; emit upNomChanged(value);}

    void setNameDirection(QString value){nameDirection = value; emit nameDirectionChanged(value);}

    void setPutNom(int value){putNom = value; emit putNomChanged(value);}

    void setStartCood(float value){startCood = value; emit startCoodChanged(value);}

signals:

  void pchChanged(const int &pch, const int &pchy, const int &pd, const int &pdb);

  void stationChanged(const QString &station1, const QString &station2);

  void upNomChanged(const int &upNom);

  void nameDirectionChanged(const QString &nameDirection);

  void putNomChanged(const int &putNom);

  void startCoodChanged(const float &startCood);

};

#endif // TASK_VALUES_H
