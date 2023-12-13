#include "test_class.h"
#include <measures/chart_work.h>


#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QNetworkAccessManager>

#include <QTcpServer>
#include <QTcpSocket>


//#include "qmqtt.h"

#include <QMqttClient>

#include <QTcpSocket>

#include <QtMqtt/QMqttClient>
#include <QtCore/QDateTime>

test_class::test_class(QObject *parent) : QObject(parent)
{


   /* m_client = new QMqttClient(this);

    m_client->setHostname("127.0.0.1");
    m_client->setPort(1883);

    connect(m_client, &QMqttClient::stateChanged, this, &test_class::state_changed); */

}

int server_status;
QMap<int,QTcpSocket *> SClients;


QTcpServer *tcpServer;




void test_class::state_changed(){

    const QString content = QDateTime::currentDateTime().toString()
                    + QLatin1String(": State Change")
                    + QString::number(m_client->state())
                    + QLatin1Char('\n');

qDebug() << "state_changed " + content;

}

void test_class::test_slot(){

   // Chart_Work chart_work;

    //emit Chart_Work->newPointCha;

//    chart_work.add_ChartPoint(0, 30, 30);
    //  Chart_Work::add_ChartPoint(0, 30, 30);


   // emit Chart_Work->add_ChartPoint(0, 30, 30);

   // emit chart_work->add  //  ->signalLogAppend("foo");


   // chart_work.add_ChartPoint(0, 30, 30);

    qDebug() << "aaaa";

    emit test_signal("qqqqqqq");
}

void test_class::create_json(){

    QJsonObject addressObject;
    addressObject.insert("Street", "Downing Street 10");
    addressObject.insert("City", "London");
    addressObject.insert("Country", "Great Britain");

    QJsonDocument doc(addressObject);

       qDebug() << doc.toJson();
}


void test_class::broker_test(){



   /* m_client = new QMqttClient(this);

    m_client->setHostname("127.0.0.1");
    m_client->setPort(1883);

    connect(m_client, &QMqttClient::stateChanged, this, &My_pdf::state_changed);

    QMqttSubscription *m_sub;

 //topic.setFilter("test");
   //auto subscription = m_client->subscribe(topic, qos0);

    QMqttTopicFilter test_Topic{"test_topic"};

    m_client->subscribe(test_Topic, 1883);

    connect(m_client, &QMqttClient::messageReceived, this, [this](const QByteArray &message, const QMqttTopicName &topic) {
             const QString content = QDateTime::currentDateTime().toString()
                         + " Received Topic: "
                         + topic.name()
                         + " Message: "
                         + message
                         + u'\n';

             qDebug() << "messageReceived";

             //ui->editLog->insertPlainText(content);
         });

         */

    qDebug() << "finish func";


      //qDebug() << "sssssssssssss";

    //  m_client->me

    //  client.on_message = on_message1


     // auto subWindow = new SubscriptionWindow(subscription);


      //    connect(m_client, &QMqttClient::disconnected, this, &MainWindow::brokerDisconnected);

    //  m_client->subscribe(QMqttTopicFilter

   /* QMQTT::Client *client = new QMQTT::Client(QHostAddress::LocalHost, 1883);
    client->setClientId("clientId");
    client->setUsername("admin");
    client->setPassword("public");
    client->connectToHost(); */

   /* broker = "127.0.0.1"
    port = 1883

    # generate client ID with pub prefix randomly
    client_id = f"python-mqtt-{random.randint(0, 1000)}"
    username = "admin"
    password = "public" */

}
