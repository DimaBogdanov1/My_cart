#include "measure_block.h"

Measure_Block::Measure_Block(QString title, float size,  float width_Measure, QList<float> measureVal, QList<int> noTextIndex, QList<int> noLineIndex, float startCorrect, float finishCorrect, float leftX, float rightX  )
{

    this->title = title;

    this->size = size;

    this->width_Measure = width_Measure;

    this->measureVal = measureVal;

    this->noTextIndex = noTextIndex;

    this->noLineIndex = noLineIndex;

    this->startCorrect = startCorrect;

    this->finishCorrect = finishCorrect;

    this->leftX = leftX;

    this->rightX = rightX;

}
