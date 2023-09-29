#ifndef ACCOUNTS_H
#define ACCOUNTS_H

#include <QObject>
#include <QSqlQuery>


class Accounts : public QObject
{
    Q_OBJECT

public:

    explicit Accounts(QObject *parent = nullptr);

    QSqlDatabase Database;

    QString account_Table = "ACCOUNTS";

    QString id = "ID";

    QString login = "LOGIN";

    QString password = "PASSWORD";

    QString color = "COLOR";

    int ID_AuthorizationUser;

    void create_table();

    bool check_identity(QString login);

    void updateUser(QString login, int color);

public slots:

    void get_All_Users();

    void add_User(QString login, int password);

    void delete_User(int index);

    void check_Password(QString login, int password, int color);


signals:

    void result_of_Adding_signal(const bool& value);

    void result_of_Authorization_signal(const bool& value);

    void update_AuthorizationUser_signal(const QString& login, const int& color);

    void newUser_signal(const int& id, const QString& login, const int& password, const int& color);



};

#endif // ACCOUNTS_H
