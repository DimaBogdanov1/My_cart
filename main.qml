import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import Style 1.0
import Qt.labs.platform 1.1 as Labs

import MyLang 1.0
import StartTask_Model 1.0
import my_components 1.0

ApplicationWindow {
    id: applicationWindow
    width: 1344 //1920 //800
    height: 756 //1080 //480
    visible: true

    title: qsTr("Проект") + mytrans.emptyString


    Component.onCompleted: {

        minimumWidth = applicationWindow.width
        minimumHeight = applicationWindow.height

      //  mytrans.updateLanguage(MyLang.ENG)

    }


    Loader{
        width: parent.width
        height: parent.height
        focus: true
        Component.onCompleted: source = "../App_Page.qml"
    }

    Loader{
        id: start_Loader
        property int index_Start: -1
        readonly property var sourceStarts_Array: [ "../starts_elements/Splash_Screen.qml","../starts_elements/Onboard_Screen.qml"]

        width: parent.width
        height: parent.height
        //source: sourceStarts_Array[index_Start]
        Component.onCompleted: index_Start =  0

    }


    My_Settings{  // Создаём Настройки Приложения

        id: app_Settings

    }

    Design_Values{

        id: ui
    }

    Strings{
        id: str
    }

    FontLoader {  // Создаём Загрузчик Шрифтов
        id: custom_FontLoader
        source: "qrc:/fonts/CircularStd_Book.ttf"

    }

    FontLoader {  // Создаём Загрузчик Шрифтов
        id: customTitle_FontLoader
        source: "qrc:/fonts/Circular_Std_Bold.ttf"

    }



}
