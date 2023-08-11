TEMPLATE = app

QT += quick quickcontrols2 qml sql charts core testlib widgets printsupport

CONFIG += c++17 #sdk_no_version_check
#QMAKE_MACOSX_DEPLOYMENT_TARGET = 13.5

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#QMAKE_MAC_SDK = macosx13.5


SOURCES += \
        databases/big_database.cpp \
        databases/my_database.cpp \
        export/my_pdf.cpp \
        main.cpp \
        models/StartTask_Model.cpp \
        mythread.cpp \
        test_smart.cpp \
        work_with_chart.cpp

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
    databases/big_database.h \
    databases/my_database.h \
    export/my_pdf.h \
    models/StartTask_Model.h \
    models_headers/big_database.h \
    mythread.h \
    test_smart.h \
    translate_headers/mylang.h \
    translate_headers/mytranslator.h \
    work_with_chart.h

DISTFILES += \
    my_components/qmldir \
    translator/England.ts
