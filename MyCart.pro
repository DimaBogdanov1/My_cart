TEMPLATE = app

QT += quick quickcontrols2 qml sql charts core testlib widgets printsupport network opengl mqtt  # qmqtt positioning location

CONFIG += c++17 qmltestcase #sdk_no_version_check
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
        databases/accounts/accounts.cpp \
        databases/aprior/peregon.cpp \
        databases/big_database.cpp \
        databases/my_database.cpp \
        databases/warnings/warnings.cpp \
        #export/pdf/analysis/analysis_draw.cpp \
        #export/pdf/analysis/table_element.cpp \
        #export/pdf/chart/chart_draw.cpp \
        #export/pdf/chart/measure_block.cpp \
        #export/pdf/chart/measure_lines.cpp \
        #export/pdf/km/km_draw.cpp \
        #export/pdf/km/objects_draw.cpp \
        #export/pdf/my_pdf.cpp \
        #export/pdf/pdf_values.cpp \
        main.cpp \
        measures/chart_work.cpp \
        measures/measure.cpp \
        measures/name_measures.cpp \
        mqtt_client.cpp \
        mythread.cpp \
        test_smart.cpp

TRANSLATIONS = translator/England.ts


RESOURCES += qml.qrc \
    my_components.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


HEADERS += \
    databases/accounts/accounts.h \
    databases/accounts/colors_profile.h \
    databases/aprior/peregon.h \
    databases/big_database.h \
    databases/my_database.h \
    databases/warnings/warnings.h \
   # export/pdf/analysis/analysis_draw.h \
   # export/pdf/analysis/table_element.h \
   # export/pdf/chart/chart_draw.h \
   # export/pdf/chart/measure_block.h \
   # export/pdf/chart/measure_lines.h \
   # export/pdf/km/km_draw.h \
   # export/pdf/km/objects_draw.h \
   #export/pdf/my_pdf.h \
   # export/pdf/pdf_values.h \
    measures/chart_work.h \
    measures/measure.h \
    measures/name_measures.h \
    models_headers/big_database.h \
    mqtt_client.h \
    mythread.h \
    test_smart.h \
    translate_headers/mylang.h \
    translate_headers/mytranslator.h

DISTFILES += \
    my_components/qmldir \
    translator/England.ts
