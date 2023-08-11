#ifndef MY_DATABASE_H
#define MY_DATABASE_H
#include <QSqlDatabase>


class my_database
{
public:
    my_database();
    ~my_database();

    QSqlDatabase Database;

    void create_database();
    void add();
};

#endif // MY_DATABASE_H
