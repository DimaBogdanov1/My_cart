#ifndef MEASURE_BLOCK_H
#define MEASURE_BLOCK_H

#include <QList>
#include <QPointF>

class Measure_Block
{
public:
    Measure_Block(QString title,
                  float size,
                  float width_Measure,
                  QList<float> measureVal,
                  QList<int> noTextIndex,
                  QList<int> noLineIndex,
                  float startCorrect,
                  float finishCorrect
                  );

    QString title = "";

    float size = 9;

    float width_Measure = 4;

    QList<float> measureVal = {-10, 0, 10};

    QList<int> noTextIndex = {};

    QList<int> noLineIndex = {};

    float startCorrect = 0;

    float finishCorrect = 0;

   // float leftX = 0;

   // float rightX = 0;

    QList<QPointF> mainLine_Points;
};

#endif // MEASURE_BLOCK_H
