
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

 broker_test();

   // m_client = newQMqttClient(this);
     //  m_client->setHostname(ui->lineEditHost->text());
       //m_client->setPort(static_cast<quint16>(ui->spinBoxPort->value()));
}

int server_status;
QMap<int,QTcpSocket *> SClients;


QTcpServer *tcpServer;



//using namespace std::string_literals;

void My_pdf::state_changed(){


}



void My_pdf::broker_test(){

 QMqttClient *m_client;

    m_client = new QMqttClient(this);

      m_client->setHostname("127.0.0.1");
      m_client->setUsername("admin");
      m_client->setPassword("public");

      m_client->setPort(1883);

      connect(m_client, &QMqttClient::stateChanged, this, &My_pdf::state_changed);

 QMqttSubscription *m_sub;

 //topic.setFilter("test");
   //auto subscription = m_client->subscribe(topic, qos0);

   QMqttTopicFilter test_Topic{"sensor/width"};

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

void My_pdf::on_stoping_clicked()
{
    if(server_status==1){
        foreach(int i,SClients.keys()){
            QTextStream os(SClients[i]);
            os.setAutoDetectUnicode(true);
            os << QDateTime::currentDateTime().toString() << "\n";
            SClients[i]->close();
            SClients.remove(i);
        }
        tcpServer->close();
      //  ui->textinfo->append(QString::fromUtf8("Сервер остановлен!"));
        qDebug() << QString::fromUtf8("Сервер остановлен!");
        server_status=0;
    }
}


void My_pdf::init()
{

 // https://github.com/valualit/QTcpServer01
  tcpServer = new QTcpServer(this);

        connect(tcpServer, SIGNAL(newConnection()), this, SLOT(newuser()));

        if (!tcpServer->listen(QHostAddress::Any, 33333) && server_status==0) {
            qDebug() <<  QObject::tr("Unable to start the server: %1.").arg(tcpServer->errorString());
          //  ui->textinfo->append(tcpServer->errorString());
        }
        else {
            server_status=1;
            qDebug() << tcpServer->isListening() << "TCPSocket listen on port";
         //   ui->textinfo->append(QString::fromUtf8("Сервер запущен!"));
            qDebug() << QString::fromUtf8("Сервер запущен!");
        }

}

void My_pdf::newuser()
{
    if(server_status==1){
        qDebug() << QString::fromUtf8("У нас новое соединение!");
       // ui->textinfo->append(QString::fromUtf8("У нас новое соединение!"));
        QTcpSocket* clientSocket=tcpServer->nextPendingConnection();
        int idusersocs=clientSocket->socketDescriptor();
        SClients[idusersocs]=clientSocket;
        connect(SClients[idusersocs],SIGNAL(readyRead()),this, SLOT(slotReadClient()));
    }
}

void My_pdf::slotReadClient()
{
    QTcpSocket* clientSocket = (QTcpSocket*)sender();
    int idusersocs=clientSocket->socketDescriptor();
    QTextStream os(clientSocket);
    os.setAutoDetectUnicode(true);
    os << "HTTP/1.0 200 Ok\r\n"
          "Content-Type: text/html; charset=\"utf-8\"\r\n"
          "\r\n"
          "<h1>Nothing to see here</h1>\n"
          << QDateTime::currentDateTime().toString() << "\n";
    //ui->textinfo->append("ReadClient:"+clientSocket->readAll()+"\n\r");
    // Если нужно закрыть сокет
    clientSocket->close();
    SClients.remove(idusersocs);
}

void My_pdf::print_pdf()
{

    Chart_Work* a = new Chart_Work();

    QThread *thread = new QThread;

    a->moveToThread(thread);

    connect(thread, SIGNAL(started()), a, SLOT(openCSV()));

    thread->start();


   // QPrinter printer;
    //printer.setOutputFileName("/Users/Shared/example.pdf");
    //printer.setOutputFormat(QPrinter::PdfFormat);

    QString html =
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


    /*QPrintDialog *dlg = new QPrintDialog(&printer,0);
           if(dlg->exec() == QDialog::Accepted) {
                   QImage img(":/icons/moon_stars_light.svg");
                   QPainter painter(&printer);
                   painter.drawImage(QPoint(0,0),img);
                   painter.end();
           }*/

   // QPainter painter(&printer);

    const QPoint imageCoordinates(0,0);

    const QImage image(":/icons/light_theme/home_page/arrow_right_long.svg");

    QPdfWriter pdfWriter("/Users/Shared/example.pdf");
      pdfWriter.setPageSize(QPageSize(QPageSize::A4));
      QPainter painter(&pdfWriter);

      for (int i=0; i<3; ++i) {
          painter.drawImage(imageCoordinates, image);
          pdfWriter.newPage();
      }


   /* printer.setOutputFormat(QPrinter::PdfFormat);
    printer.setPaperSize(QPrinter::A4);
    printer.setOutputFileName("/Users/Shared/example.pdf");
    printer.setPageMargins(QMarginsF(15, 15, 15, 15));

    document.print(&printer); */

}

void My_pdf::create_json(){

    QJsonObject addressObject;
    addressObject.insert("Street", "Downing Street 10");
    addressObject.insert("City", "London");
    addressObject.insert("Country", "Great Britain");

    QJsonDocument doc(addressObject);

       qDebug() << doc.toJson();
}

void My_pdf::insertApi(QString str)
{
    QUrl serviceUrl = QUrl(str);
    QNetworkRequest request(serviceUrl);
    QJsonObject json;

    json.insert("name", QString( "Amazing Pillow 92.10" ));
    json.insert("price", QString( "199" ));
    json.insert("description", QString( "The best pillow for amazing programmers." ));
    json.insert("category_id", QString( "2" ));
    json.insert("created",QString("2018-06-01 00:35:07"));
    request.setHeader(QNetworkRequest::ContentTypeHeader,"application/x-www-form-urlencoded");

    QNetworkAccessManager* networkManager = new QNetworkAccessManager(this);

    connect(networkManager,SIGNAL(finished(QNetworkReply)),this,SLOT(replyFinished(QNetworkReply*)));


    QJsonDocument doc(json);

    QByteArray data = doc.toJson();

    networkManager->post(request, data);

    qDebug() << "json:" << json;
}

void My_pdf::readAPI()
{
    QNetworkRequest request(QUrl("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=obamacare+socialism"));

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *m_nam=new QNetworkAccessManager();
    QNetworkReply *reply = m_nam->get(request);

    connect(reply, &QNetworkReply::finished, this, [this, reply] {
    reply->deleteLater();

    const QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
    const QJsonArray array = doc.array();

    for (const QJsonValue &value : array) {
    qDebug() << value.toObject();
   /* qDebug() << "EMPID:" << value.toObject().find("empId")->toString();
    qDebug() << "NCODE:" << value.toObject().find("ncode")->toString();
    qDebug() << "EMPCODE:" << value.toObject().find("empcode")->toString();
    qDebug() << "STATUES:" << value.toObject().find("statues")->toString(); */
    }

    });
}





