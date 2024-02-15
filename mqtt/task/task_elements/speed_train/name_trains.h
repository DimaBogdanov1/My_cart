#pragma once

#include <QObject>
#include <QMetaEnum>

class Name_Trains
{
    Q_GADGET

public:
     enum Names
          {
            Pass_Train,
            Freight_Train,
            SallowBird_Train,
            Sapsan_Train


          };

    Q_ENUM(Names)

private:
    explicit Name_Trains();
};

typedef Name_Trains::Names Status_Names;
