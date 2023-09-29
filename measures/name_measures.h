#pragma once

#include <QObject>
#include <QMetaEnum>

class Name_Measures
{
    Q_GADGET

public:
     enum Measures
          {
            Level_Measure,
            Riht_Left_Measure,
            Riht_Right_Measure,
            Sample_Measure,
            Down_Left_Measure,
            Down_Right_Measure
          };

    Q_ENUM(Measures)

private:
    explicit Name_Measures();
};

typedef Name_Measures::Measures Status;
