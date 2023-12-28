#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QStringListModel>
#include <QtTest/QtTest>


#include <QCoreApplication>
#include <QNetworkConfigurationManager>
#include <QNetworkConfiguration>
#include <QDebug>
#include <QNetworkSession>

#include "translate_headers/mylang.h"
#include "translate_headers/mytranslator.h"

#include "databases/big_database.h"
//#include "databases/my_database.h"

#include "databases/accounts/accounts.h"
#include "databases/warnings/warnings.h"


#include "measures/chart_work.h"
#include "measures/name_measures.h"

#include "test_smart.h"

#include "export/pdf/my_pdf.h"


#include "mqtt_client.h"


//#include <QtQuickTest>
//QUICK_TEST_MAIN(example)


int main(int argc, char *argv[])
{
    #if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    #endif

    QApplication app(argc, argv);


    //QQuickStyle::setStyle("Material");
    app.setOrganizationName("Some Company");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("MyCart");


   // app.setWindowIcon(QIcon(":/icons/test_icon.icns")); // Добавляем Иконку

    big_database big_db;

    Chart_Work chart_work;

    //My_pdf my_pdf;

    //My_Database my_db;

    Accounts accounts;

    accounts.create_table();

    Warnings warnings;

    warnings.create_table();


    MQTT_Client mqtt_Client;

    qmlRegisterSingletonType(QUrl("qrc:/Style.qml"), "Style", 1, 0, "Style"); // Регестрируем Тип Style В QML Для Изменения Темы В Приложении

   // qmlRegisterType<MyLang>("MyLang", 1, 0, "MyLang");

    //qmlRegisterType<StartTask_Model>("StartTask_Model", 1, 0, "StartTask_Model");


   // qmlRegisterType<QmlMqttClient>("MqttClient", 1, 0, "MqttClient");

    //qmlRegisterUncreatableType<QmlMqttSubscription>("MqttClient", 1, 0, "MqttSubscription", QLatin1String("Subscriptions are read-only"));


   // MyTranslator mTrans(&app);

    QTranslator mTranslator;

    mTranslator.load("England", ":/translator");

    app.installTranslator(&mTranslator);


    QQmlApplicationEngine engine;    
   // engine.rootContext()->setContextProperty("mytrans", (QObject*)&mTrans);

    engine.rootContext()->setContextProperty("big_db", &big_db);

    engine.rootContext()->setContextProperty("Chart_Work", &chart_work);

    engine.rootContext()->setContextProperty("Accounts", &accounts);

    engine.rootContext()->setContextProperty("Warnings", &warnings);

 //   engine.rootContext()->setContextProperty("my_pdf", &my_pdf);

    engine.rootContext()->setContextProperty("Mqqt_Client", &mqtt_Client);




    engine.addImportPath("qrc:/");


    engine.load(QUrl("qrc:/main.qml")); // Загружаем QML



//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   /* qDebug() << "currentCpuArchitecture():" << QSysInfo::currentCpuArchitecture();
    qDebug() << "productType():" << QSysInfo::productType();
    qDebug() << "productVersion():" << QSysInfo::productVersion();
    qDebug() << "prettyProductName():" << QSysInfo::prettyProductName();
    */

   // QTest::qExec(new Test_Smart, argc, argv); // Запускаем Тест

   // QColor color = QPalette().color(QPalette::Window); // Для Определения Темы

    return app.exec();
}
