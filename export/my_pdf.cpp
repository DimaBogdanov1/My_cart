
#include <QPrinter>
#include <QTextDocument>
#include <QTextCharFormat>

#include <QApplication>
#include <QtCore>
#include <QPrinter>
#include <QPdfWriter>
#include <QPainter>
#include <QPrintDialog>
#include <measures/chart_work.h>


#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QNetworkAccessManager>

#include <QTcpServer>
#include <QTcpSocket>

#include "my_pdf.h"

//#include "qmqtt.h"

#include <QMqttClient>

#include <QTcpSocket>

#include <QtMqtt/QMqttClient>
#include <QtCore/QDateTime>

//using namespace QMQTT ;

My_pdf::My_pdf(QObject *parent) : QObject(parent)
{

    m_client = new QMqttClient(this);

    m_client->setHostname("127.0.0.1");
    m_client->setPort(1883);

    connect(m_client, &QMqttClient::stateChanged, this, &My_pdf::state_changed);


   // m_client = newQMqttClient(this);
     //  m_client->setHostname(ui->lineEditHost->text());
       //m_client->setPort(static_cast<quint16>(ui->spinBoxPort->value()));
}

int server_status;
QMap<int,QTcpSocket *> SClients;


QTcpServer *tcpServer;



//using namespace std::string_literals;

void My_pdf::state_changed(){

    const QString content = QDateTime::currentDateTime().toString()
                    + QLatin1String(": State Change")
                    + QString::number(m_client->state())
                    + QLatin1Char('\n');

qDebug() << "state_changed " + content;

}



void My_pdf::broker_test(){



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


void My_pdf::test_slot(){

    Chart_Work chart_work;

    //emit Chart_Work->newPointCha;

    chart_work.add_ChartPoint(0, 30, 30);
    //  Chart_Work::add_ChartPoint(0, 30, 30);


   // emit Chart_Work->add_ChartPoint(0, 30, 30);

   // emit chart_work->add  //  ->signalLogAppend("foo");


   // chart_work.add_ChartPoint(0, 30, 30);

    qDebug() << "aaaa";

    emit test_signal("qqqqqqq");
}

void My_pdf::print_pdf()
{

    broker_test();


    /*Chart_Work* a = new Chart_Work();

    QThread *thread = new QThread;

    a->moveToThread(thread);


     connect(thread, SIGNAL(started()), a, SLOT(openCSV()));

     connect(a, &Chart_Work::openCSV, a, &Chart_Work::openCSV);


     thread->start(); */



     //QObject::connect(this, My_pdf::test_signal("www"), this, SLOT(test_slot()) );


   // QObject::connect(&app, &QCoreApplication::aboutToQuit, &thread, &QThread::quit);





   // QPrinter printer;
    //printer.setOutputFileName("/Users/Shared/example.pdf");
    //printer.setOutputFormat(QPrinter::PdfFormat);

 /*   QString html =
    "<div align=right>"
       "City, 11/11/2015"
    "</div>"
    "<div align=left>"
       "Sender Name<br>"
       "street 34/56A<br>"
       "121-43 city"
    "</div>"
    "<h1 align=center>DOCUMENT TITLE</h1>"
    "<p align=justify>"
       "document content document content document content document content document content document content document content document content document content document content "
       "document content document content document content document content document content document content document content document content document content document content "
    "</p>"
    "<div align=right>sincerly</div>";

    QTextDocument document;
    document.setHtml(html);




    QPrinter printer(QPrinter::PrinterResolution);

   // QPainter painter(&printer);

    const QPoint imageCoordinates(0,0);

    const QImage image(":/icons/light_theme/home_page/arrow_right_long.svg");

    QPdfWriter pdfWriter("/Users/Shared/example.pdf");
      pdfWriter.setPageSize(QPageSize(QPageSize::A4));
      QPainter painter(&pdfWriter);

      for (int i=0; i<3; ++i) {
          painter.drawImage(imageCoordinates, image);
          pdfWriter.newPage();
      } */


}

void My_pdf::create_json(){

    QJsonObject addressObject;
    addressObject.insert("Street", "Downing Street 10");
    addressObject.insert("City", "London");
    addressObject.insert("Country", "Great Britain");

    QJsonDocument doc(addressObject);

       qDebug() << doc.toJson();
}

