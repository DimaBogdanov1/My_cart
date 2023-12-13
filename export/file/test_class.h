#ifndef TEST_CLASS_H
#define TEST_CLASS_H

#include <QObject>
#include <QMqttClient>

class test_class : public QObject
{
    Q_OBJECT
public:
    explicit test_class(QObject *parent = nullptr);

    QMqttClient *m_client;

public slots:  // Слоты

    void create_json();


    void broker_test();

    void state_changed();

    void test_slot();

   // void isConnected();

signals:

    void test_signal(const QString& strqqqq);
};

#endif // TEST_CLASS_H
