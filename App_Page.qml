import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import MyLang 1.0
import Style 1.0
import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    property int index_Page: -1

    readonly property var sourcePages_Array: [
                                               "../pages/Home_Page.qml",
                                               "../pages/Calib_Page.qml",
                                               "../pages/History_Page.qml",
                                               "../pages/Settings_Page.qml"
                                            ]

   // "../pages/Defect_Charts.qml",
   // "../pages/Charts_test.qml"

    Row{
        width: parent.width
        height: parent.height

        Rectangle {
           width: ui.width_Navigation
           height: parent.height
           color: Style.primaryDark_Color

           Item {
               width:  parent.width
               height: 72
             //  anchors.bottom: parent.bottom
              // anchors.bottomMargin: 16
                   Image {
                      width:  parent.height
                      height: parent.height
                      source: "../images/logo_white_trans.png"
                      anchors.centerIn: parent
                      smooth: false // Убираем Сглаживание
                      fillMode: Image.PreserveAspectCrop
                   }

           }

           Item{
              width: parent.width
              height: ui.iconBlock_Size * 9
              anchors.centerIn: parent

              Column {
                  width: parent.width
                  height: parent.height
                  spacing: ui.icon_nav_size

                  Navigation_Element{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 0
                      icon_path: "qrc:/icons/light_theme/navigation/home.svg"
                      icon_checked_path: "qrc:/icons/light_theme/navigation/home_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_anim(0)  // Переходим На Старт

                      }
                  }

                  Navigation_Element{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 1
                      icon_path: "qrc:/icons/light_theme/navigation/edit.svg"
                      icon_checked_path: "qrc:/icons/light_theme/navigation/edit_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_anim(1) // Переходим На Калибровку

                      }
                  }

                  Navigation_Element{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      icon_path: "qrc:/icons/light_theme/navigation/add.svg"
                      onClicked_Signal: {
                          toast.show("Добавление новой базы данных!", 3000, 1) // Показываем Тоcт

                      }
                  }

                  Navigation_Element{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 2
                      icon_path: "qrc:/icons/light_theme/navigation/document.svg"
                      icon_checked_path: "qrc:/icons/light_theme/navigation/document_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_anim(2) // Переходим В Историю

                      }
                  }

                  Navigation_Element{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 3
                      icon_path: "qrc:/icons/light_theme/navigation/setting.svg"
                      icon_checked_path: "qrc:/icons/light_theme/navigation/setting_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_anim(3) // Переходим В Настройки

                      }
                  }

              }


           }

        }

        Item {
            width: parent.width - ui.width_Navigation
            height: parent.height
            clip: true

            Loader{
                id: page_Loader
                width: parent.width
                height: parent.height
                source: sourcePages_Array[index_Page]
                Component.onCompleted: index_Page =  0 //1 //source = sourcePages_Array[index_Page]

            }

            // Создаём Объект Для Показа Тостов
           ToastManager {
                id: toast
            }
        }

        Opacity_Anim{
            id: opacity_Anim
            animation_target: page_Loader

        }

        Content_Up_Down_Anim{
            id: content_Anim
            animation_target: page_Loader
        }

    }



   /* Custom_Combobox{
        width: 200
        height: 40
        openIcon: "../icons/light_theme/navigation/setting.svg"
        closeIcon: "../icons/light_theme/navigation/document.svg"
        anchors.centerIn: parent
    }

    ComboBox{
        width: 200
        height: 50
        model: ["dd", "dd", "eee","eee"]
        anchors.verticalCenter: parent.verticalCenter
    }

    Test_cmb{
        width: 200
        height: 40
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }*/

    Loader{
        id: utils_Loader
        width: parent.width
        height: parent.height
        focus: true
        Component.onCompleted: source = "../Utils.qml"

    }


}
