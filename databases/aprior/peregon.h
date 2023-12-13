#ifndef PEREGON_H
#define PEREGON_H

#include <QObject>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDateTime>


//Определяем пергон или станцию
//При поиске шерстим с начала вектора и до того как найдем
//Маленькая структура и легкий поиск)))
struct Station
{
    QString NAME="";//имя станции
    int CODE=-1;//Код станции,если -1 то значение пустое
    int KM;//Начальный Км
    int M; //Начальный м
};

class Peregon : public QObject
{
    Q_OBJECT
public:
    explicit Peregon(QObject *parent = nullptr);

    static void Inp_station(const int Siteid, const int Upnom, const QString Putnom, QSqlDatabase &db);//Заполняем вектор со станциями
    static void Poisk(const int KM, const int M);//сам процесс поиска
    static QPair<Station,Station> Get_DataRezPeregon();//вывод пары данных между которыми мы находимся
    static QString Get_RezPeregon();//вывод перегона или станции в готовом виде

private:

    static QVector<Station> station;//Наш вектор со станциями
    static QPair<Station,Station> per;//собственно результат поиска где мы находимся перегон или какая то станция(это ид в нашем векторе)


};

#endif // PEREGON_H
