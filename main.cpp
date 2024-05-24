#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QStringListModel>
#include <QtTest/QtTest>
#include <QtCharts/QVXYModelMapper>


#include <QCoreApplication>
#include <QNetworkConfigurationManager>
#include <QNetworkConfiguration>
#include <QDebug>
#include <QNetworkSession>
#include <QStandardItemModel>

#include "translate_headers/mylang.h"
#include "translate_headers/mytranslator.h"

#include "databases/big_database.h"



#include "test_smart.h"

#include "test_class.h"

#include "mqtt/mqtt_client.h"
#include "mqtt/sensors/sensorsregister_microservice.h"



#include "../Test_Dynamic_Lib/test_dynamic_lib.h"
#include "../Log_Lib/log_lib.h"
#include "../Passport_DB_Lib/passport_db_lib.h"
#include "../Notifications_Lib/models/notifications_model.h"
#include "../Design_Values_Lib/design_values_lib.h"
#include "../Design_Values_Lib/style.h"

#include "../Strings_Lib/strings_lib.h"

#include "../User_DB_Lib/accounts/colors_profile.h"
#include "../User_DB_Lib/accounts/authorized_account.h"
#include "../Export_Lib/file/data_types/chart_types/enums/type_sleepers.h"
#include "../Export_Lib/file/data_types/chart_types/enums/type_arrows.h"
#include "../Export_Lib/file/data_types/chart_types/enums/type_objects.h"
#include "../Export_Lib/file/data_types/chart_types/enums/type_picket_position.h"
#include "../Export_Lib/file/data_types/chart_types/enums/types_line.h"
#include "../Export_Lib/file/data_types/chart_types/enums/subtypes_line.h"
#include "../Export_Lib/file/data_types/chart_types/enums/type_areas.h"
#include "../Export_Lib/file/data_types/chart_types/enums/type_trains.h"
#include "../Export_Lib/pages/history_charts_page.h"



#include "pages/chart_page.h"
#include "pages/warning_page.h"
#include "pages/register_page.h"
//#include "pages/authorized_account.h"
#include "pages/pick_account_page.h"
#include "pages/finish_task_page.h"
#include "pages/values/map_values.h"
#include "pages/values/my_sensors_values.h"

#include "../Passport_DB_Lib/pages/custom_task_page.h"
#include "../Passport_DB_Lib/pages/task_page.h"


#include "pages/enums/name_main_pages.h"

//#include <QtQuickTest>
//QUICK_TEST_MAIN(example)





void registerPages(){

    qmlRegisterType<Task_Page>("Task_Page", 1, 0, "Task_Page");

    qmlRegisterType<Chart_Page>("Chart_Page", 1, 0, "Chart_Page");

    qmlRegisterType<Warning_Page>("Warning_Page", 1, 0, "Warning_Page");

    qmlRegisterType<Register_Page>("Register_Page", 1, 0, "Register_Page");

    //qmlRegisterType<Authorized_Account>("Authorized_Account", 1, 0, "Authorized_Account");

    qmlRegisterType<Colors_Profile>("Colors_Profile", 1, 0, "Colors_Profile");

    qmlRegisterType<Pick_Account_Page>("Pick_Account_Page", 1, 0, "Pick_Account_Page");

    qmlRegisterType<Finish_Task_Page>("Finish_Task_Page", 1, 0, "Finish_Task_Page");

    qmlRegisterType<Custom_Task_Page>("Custom_Task_Page", 1, 0, "Custom_Task_Page");

    qmlRegisterType<History_Charts_Page>("History_Charts_Page", 1, 0, "History_Charts_Page");


    qmlRegisterUncreatableType<Type_Sleepers>("Type_Sleepers", 1, 0, "Type_Sleepers", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<Type_Arrows>("Type_Arrows", 1, 0, "Type_Arrows", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<Type_Objects>("Type_Objects", 1, 0, "Type_Objects", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<Type_Picket_Position>("Type_Picket_Position", 1, 0, "Type_Picket_Position", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<Name_Main_Pages>("Name_Main_Pages", 1, 0, "Name_Main_Pages", "Not creatable as it is an enum type");


    qmlRegisterType<Map_Values>("Map_Values", 1, 0, "Map_Values");

    qmlRegisterType<My_Sensors_Values>("My_Sensors_Values", 1, 0, "My_Sensors_Values");


    qmlRegisterUncreatableType<Types_Line>("Types_Line", 1, 0, "Types_Line", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<SubTypes_Line>("SubTypes_Line", 1, 0, "SubTypes_Line", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<Type_Areas>("Type_Areas", 1, 0, "Type_Areas", "Not creatable as it is an enum type");

    qmlRegisterUncreatableType<Type_Trains>("Type_Trains", 1, 0, "Type_Trains", "Not creatable as it is an enum type");

}

void test_func(){

    //Passport_DB_Lib::openDatabase("s");


    /*QList<QString> nameRoads = Passport_DB_Lib::get_SiteID();

    for(int i = 0; i < nameRoads.length(); i++){

        qDebug() << nameRoads.at(i);
    }*/

    Test_Dynamic_Lib ass;

    ass.sum(33,22);

    //Test_lib_7 a; a.sum(4, 7);



    //Log_Lib::Add_Row(Log_Lib::Tablet_App, Log_Lib::Basic_Action, "qqqqqqq");

    //Log_Lib *classA = new Log_Lib();

    //Log_Lib::;

   // QObject::connect(classA, &classA::messageChanged, classA, &classA::Add_Row(1,1,"aaaaaaa"));

   // Test_static_lib a; a.sum(4, 7);

}

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


   app.setWindowIcon(QIcon("qrc:/my_components/icons/test_icon.icns")); // Добавляем Иконку

   registerPages();

    test_func();

    big_database big_db;



   /* Accounts accounts;

    accounts.create_table();

    Warnings warnings;

    warnings.create_table(); */


    MQTT_Client mqtt_Client;

    //SensorsRegister_Microservice sensorsRegister_Microservice;



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



    engine.rootContext()->setContextProperty("Mqqt_Client", &mqtt_Client);





    Notifications_Model notification_model;

    notification_model.addNotification("У нас всё работает", 1);

    engine.rootContext()->setContextProperty("Notifications_Model", &notification_model);


    Authorized_Account authorized_Account;

    engine.rootContext()->setContextProperty("Authorized_Account", &authorized_Account);


    Strings_Lib strings_Lib;

    engine.rootContext()->setContextProperty("my_str", &strings_Lib);




    Design_Values_Lib design_Values_Lib;

    engine.rootContext()->setContextProperty("ui", &design_Values_Lib);


    //qmlRegisterSingletonType(QUrl("qrc:/my_components/Style.qml"), "Style", 1, 0, "Style"); // Регестрируем Тип Style В QML Для Изменения Темы В Приложении

    Style style;

    engine.rootContext()->setContextProperty("Style", &style);



    Test_Class test_Class;

    engine.rootContext()->setContextProperty("Test_Class", &test_Class);



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
