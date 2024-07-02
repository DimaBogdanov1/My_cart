import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Layouts 1.3

import Main_Page 1.0

import Qt.labs.platform 1.1 as Labs


import my_components 1.0


ApplicationWindow {
    id: applicationWindow
    width: 1920 * 0.75 //1920 //800
    height: 1080 * 0.75 //1080 //480
    visible: true

    //visibility: Qt.WindowFullScreen

    property bool flipped: false

   // title: qsTr("Проект")

    Component.onCompleted: {

        minimumWidth = applicationWindow.width
        minimumHeight = applicationWindow.height

        //applicationWindow.showFullScreen()

        //mytrans.updateLanguage(MyLang.ENG)

    }



   /* onClosing: {

        close.accepted = false

        toast_tmp.show("Хочу закрыть приложение!", 3000, 1) // Показываем Тоcт

    }

 */


    Main_Page{
        id: main_Page
    }

    StackLayout {
        id: stackLayout
        width: parent.width
        height: parent.height
        currentIndex: 3 // //2 // main_Page.main_Frame_Page.page_num

        Splash_Screen_Page_UI{
            width: parent.width
            height: parent.height

            onNext_Page_Signal: {

                //stackLayout.currentIndex = 2
            }
        }

        First_Launch_Frame_Page_UI{
            width: parent.width
            height: parent.height
        }

        Onboard_Page_UI{
            width: parent.width
            height: parent.height

            onNext_Page_Signal: {

                stackLayout.currentIndex = 2
            }
        }

        Flipable_Page{
            id: flipable_Page
            front_source: "qrc:/App_Page_UI.qml"  //"qrc:/pages/account_pages/Account_Pick_Page_UI.qml" // "qrc:/App_Page_UI.qml" //"qrc:/pages/Login_Page.qml"
            back_source:  "" //"qrc:/App_Page_UI.qml"
            flipped: applicationWindow.flipped
        }
    }

    Stories_Popup{
        id: stories_Popup
    }

    ToastManager {
         id: toast
     }



    My_Settings{  // Создаём Настройки Приложения

        id: app_Settings

    }


    FontLoader {  // Создаём Загрузчик Шрифтов
        id: custom_FontLoader
        source: "qrc:/my_components/fonts/CircularStd_Book.ttf" //"qrc:/my_components/fonts/Manrope-Medium.ttf" //"qrc:/my_components/fonts/CircularStd_Book.ttf"

    }

    FontLoader {  // Создаём Загрузчик Шрифтов
        id: customTitle_FontLoader
        source: "qrc:/my_components/fonts/Circular_Std_Bold.ttf" //"qrc:/my_components/fonts/Manrope-Bold.ttf" //"qrc:/my_components/fonts/Circular_Std_Bold.ttf"

    }



    Keyboard{
        id: keyboard
        width: parent.width
        page_target: flipable_Page
        z: 2
        number: true
    }
}
