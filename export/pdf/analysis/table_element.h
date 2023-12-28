#ifndef TABLE_ELEMENT_H
#define TABLE_ELEMENT_H

#include <QString>

class Table_Element
{
public:

   // Table_Element(int y_start, int y_stop, int y_line, QString title);

    Table_Element(float x_start, float y_start, float x_finish, float y_finish,  QString title);

    float x_start;

    float y_start;

    float x_finish;

    float y_finish;

    QString title;

};

#endif // TABLE_ELEMENT_H
