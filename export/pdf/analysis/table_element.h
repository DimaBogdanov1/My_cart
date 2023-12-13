#ifndef TABLE_ELEMENT_H
#define TABLE_ELEMENT_H

#include <QString>

class Table_Element
{
public:
    Table_Element(int y_start, int y_stop, int y_line, QString title);

    int y_start;

    int y_stop;

    int y_line;

    QString title;

};

#endif // TABLE_ELEMENT_H
