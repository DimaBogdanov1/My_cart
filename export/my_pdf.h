#ifndef MY_PDF_H
#define MY_PDF_H

#include <QObject>

class My_pdf : public QObject
{
    Q_OBJECT
public:
    explicit My_pdf(QObject *parent = nullptr);

public slots:  // Слоты
    void print_pdf();
};

#endif // MY_PDF_H
