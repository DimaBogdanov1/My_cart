#ifndef MY_PDF_H
#define MY_PDF_H

#include <QObject>
#include <QMqttClient>


class My_pdf : public QObject
{
    Q_OBJECT
public:
    explicit My_pdf(QObject *parent = nullptr);

    QMqttClient *m_client;

public slots:  // Слоты
    void print_pdf();

    void create_json();


    void broker_test();

    void state_changed();

    void test_slot();

   // void isConnected();

signals:

    void test_signal(const QString& strqqqq);
};

#endif // MY_PDF_H
