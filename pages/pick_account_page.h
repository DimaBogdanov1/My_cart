#ifndef PICK_ACCOUNT_PAGE_H
#define PICK_ACCOUNT_PAGE_H

#include <QObject>
#include <QDebug>

#include "../User_DB_Lib/accounts/accounts.h"

class Pick_Account_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Accounts_Model* My_Accounts_Model MEMBER My_Accounts_Model NOTIFY model_Changed)

public:

    inline explicit Pick_Account_Page(QObject *parent = nullptr) : QObject(parent) {

       Accounts::get_All_Users();

    }

private:

    inline static Accounts_Model *My_Accounts_Model = &Accounts::accounts_Model;

signals:
   void model_Changed(const Accounts_Model *value);
};

#endif // PICK_ACCOUNT_PAGE_H
