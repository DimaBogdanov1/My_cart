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

    void create_json();

    void insertApi(QString str);

    void readAPI();

    void init();

    void newuser();

    void on_stoping_clicked();

    void slotReadClient();

};

#endif // MY_PDF_H
