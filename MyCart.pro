TEMPLATE = app

QT += quick quickcontrols2 qml sql charts core testlib widgets printsupport network opengl mqtt positioning # qmqtt positioning location

CONFIG += c++17 qmltestcase console #sdk_no_version_check

CONFIG -= app_bundle

#QMAKE_MACOSX_DEPLOYMENT_TARGET = 13.5

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#QMAKE_MAC_SDK = macosx13.5


#static {
#    QT += svg
 #   QTPLUGIN += qtvirtualkeyboardplugin
#}

#disable-xcb {
 #   message("The disable-xcb option has been deprecated. Please use disable-desktop instead.")
  #  CONFIG += disable-desktop
#}

#disable-desktop|android-embedded|!isEmpty(CROSS_COMPILE)|qnx {
 #   DEFINES += MAIN_QML=\\\"basic-b2qt.qml\\\"
#} else {
 #   DEFINES += MAIN_QML=\\\"Basic.qml\\\"
#}

SOURCES += \
        databases/aprior/peregon.cpp \
        databases/big_database.cpp \
        databases/my_database.cpp \
        main.cpp \
        measures/chart_work.cpp \
        measures/measure.cpp \
        models/chartpoints_model.cpp \
        models/navigationmap_model.cpp \
        mqtt/chart_points/chartpoints_microservice.cpp \
        mqtt/chart_points/correct_points.cpp \
        mqtt/chart_points/down/calculate_down.cpp \
        mqtt/chart_points/down/down.cpp \
        mqtt/chart_points/riht/calculate_riht.cpp \
        mqtt/chart_points/riht/riht.cpp \
        mqtt/export_microservice.cpp \
        mqtt/mqtt_client.cpp \
        mqtt/mqtt_help.cpp \
        mqtt/sensors/sensorsregister_microservice.cpp \
        mqtt/sensors/track_sensor.cpp \
        mqtt/task/task_data.cpp \
        mqtt/task/task_microservice.cpp \
        mythread.cpp \
        test_smart.cpp



# Для статической библиотеки
#INCLUDEPATH += -L$$PWD/lib
#LIBS += -L$$PWD/lib -ltest_lib_7
#LIBS += -L$$PWD/lib -lLog_Lib





LIBS += -L$$OUT_PWD/../build-Test_Dynamic_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lTest_Dynamic_Lib
INCLUDEPATH += -$$PWD/../Test_Dynamic_Lib
DEPENDPATH += -$$PWD/../Test_Dynamic_Lib


LIBS += -L$$OUT_PWD/../build-Log_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lLog_Lib
INCLUDEPATH += -$$PWD/../Log_Lib
DEPENDPATH += -$$PWD/../Log_Lib


LIBS += -L$$OUT_PWD/../build-Passport_DB_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lPassport_DB_Lib
INCLUDEPATH += -$$PWD/../Passport_DB_Lib
DEPENDPATH += -$$PWD/../Passport_DB_Lib


LIBS += -L$$OUT_PWD/../build-Notifications_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug// -lNotifications_Lib
INCLUDEPATH += -$$PWD/../Notifications_Lib
DEPENDPATH += -$$PWD/../Notifications_Lib

LIBS += -L$$OUT_PWD/../build-Design_Values_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lDesign_Values_Lib
INCLUDEPATH += -$$PWD/../Design_Values_Lib
DEPENDPATH += -$$PWD/../Design_Values_Lib

LIBS += -L$$OUT_PWD/../build-Strings_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lStrings_Lib
INCLUDEPATH += -$$PWD/../Strings_Lib
DEPENDPATH += -$$PWD/../Strings_Lib


LIBS += -L$$OUT_PWD/../build-Export_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lExport_Lib
INCLUDEPATH += -$$PWD/../Export_Lib
DEPENDPATH += -$$PWD/../Export_Lib


LIBS += -L$$OUT_PWD/../build-User_DB_Lib-Desktop_Qt_5_15_2_clang_64bit-Debug/ -lUser_DB_Lib
INCLUDEPATH += -$$PWD/../User_DB_Lib
DEPENDPATH += -$$PWD/../User_DB_Lib

#win32:CONFIG (release, debug|release): LIBS += -L$$PWD/build-test_static_lib/ -lmylibrary
#else:win32:CONFIG (debug, debug|release): LIBS += -L$$PWD/build-test_static_lib/ -lmylibrary
#else:


#INCLUDEPATH += ../build-test_static_lib-Desktop_Qt_5_15_2_clang_64bit-Debug

#INCLUDEPATH += ../test_static_lib

#LIBS += -L../test_static_lib/debug -ltest_static_lib

#LIBS += -L$$PWD/lib -libtest_static_lib

#LIBS += -L$$PWD/build-test_static_lib-Desktop_Qt_5_15_2_clang_64bit-Release / -libloadlib

#INCLUDEPATH += $$PWD/build-test_static_lib-Desktop_Qt_5_15_2_clang_64bit-Release
#DEPENDPATH += $$PWD/build-test_static_lib-Desktop_Qt_5_15_2_clang_64bit-Release


TRANSLATIONS = translator/England.ts


RESOURCES += qml.qrc \
        #my_components.qrc
        /Users/dimabogdanov/QtProjects/My_UI_Kit/my_components.qrc

        #/Users/dimabogdanov/QtProjects/my_components/my_components.qrc

    #my_components.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


HEADERS += \
    databases/aprior/peregon.h \
    databases/big_database.h \
    databases/my_database.h \
    measures/chart_work.h \
    measures/measure.h \
    models/chartpoints_model.h \
    models/navigationmap_model.h \
    models_headers/big_database.h \
    mqtt/chart_points/chartpoints_microservice.h \
    mqtt/chart_points/correct_points.h \
    mqtt/chart_points/down/calculate_down.h \
    mqtt/chart_points/down/down.h \
    mqtt/chart_points/name_measures.h \
    mqtt/chart_points/riht/calculate_riht.h \
    mqtt/chart_points/riht/riht.h \
    mqtt/export_microservice.h \
    mqtt/mqtt_client.h \
    mqtt/mqtt_help.h \
    mqtt/sensors/sensors_values.h \
    mqtt/sensors/sensorsregister_microservice.h \
    mqtt/sensors/track_sensor.h \
    mqtt/task/task_data.h \
    mqtt/task/task_elements/direction.h \
    mqtt/task/task_elements/pch.h \
    mqtt/task/task_elements/speed_train/name_trains.h \
    mqtt/task/task_elements/speed_train/speed_train.h \
    mqtt/task/task_elements/station.h \
    mqtt/task/task_elements/task.h \
    mqtt/task/task_microservice.h \
    mqtt/task/task_values.h \
    mythread.h \
    pages/authorized_account.h \
    pages/chart_page.h \
    pages/finish_task_page.h \
    pages/pick_account_page.h \
    pages/register_page.h \
    pages/task_page.h \
    pages/warning_page.h \
    test_smart.h \
    translate_headers/mylang.h \
    translate_headers/mytranslator.h

DISTFILES += \
    my_components/qmldir \
    translator/England.ts
