#ifndef CORRECT_POINTS_H
#define CORRECT_POINTS_H

#include <QSettings>
#include "mqtt/chart_points/name_measures.h"

class Correct_Points
{
public:
    Correct_Points();

    static float correct_Point(int index, float value);

    static QPair<bool, float> check_Point(int index, float value);

    inline static void setParam_Measure(int index, float bias, float multi);

    static QPair<float, float> get_Borders(int index);

private:

    inline static QString bias_path = "biase_", multi_path = "multiplier_";

    static QString getPath(int index, QString halfPath);

    inline static QSettings *settings = new QSettings("settings_demo.conf", QSettings::IniFormat );

    inline static QMap<int, QPair<float, float> > bordersMap = {

        {Name_Measures::Level_Measure, {-80, 80}},

        {Name_Measures::Riht_Left_Measure, {-30, 30}},

        {Name_Measures::Riht_Right_Measure, {-30, 30}},

        {Name_Measures::Sample_Measure, {1510, 1550}},

        {Name_Measures::Down_Left_Measure, {-10, 10}},

        {Name_Measures::Down_Right_Measure, {-10, 10}},

        {Name_Measures::Side_Damage_Measure, {0, 35}},

        {Name_Measures::Vertical_Damage_Measure, {0, 15}},

        {Name_Measures::Bowing_Measure, {0, 15}},

        {Name_Measures::Rolling_Surface_Measure, {0, 15}}


    };
};

#endif // CORRECT_POINTS_H
