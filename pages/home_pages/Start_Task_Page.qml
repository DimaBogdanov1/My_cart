import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Dialogs 1.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int index_Page: -1

    readonly property var sourcePages_Array: [
                                               "../home_pages/start_task_pages/Basic_Task_Page.qml",
                                               "../home_pages/start_task_pages/Custom_Task_Page.qml"
                                            ]

    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: Style.background_Color

        Loader{
            width: parent.width
            height: parent.height
            source: sourcePages_Array[index_Page]
            Component.onCompleted: index_Page = 0
        }

        Rectangle{
            width: 200
            height: 600
            //color: "orange"
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Column{ // Создаём Основную Колонку
                width: parent.width
                height: parent.height - 24
                //anchors.centerIn: parent
                spacing: 16 //ui.basic_spacing * 2

                Item{
                    width: parent.width
                    height: 20

                    Custom_Label{
                      //  id: title_1
                        horizontalAlignment: Text.AlignHCenter
                        font.weight:  ui.font_weight_Bigsize
                        font.family: customTitle_FontLoader.name
                        font.pixelSize:  ui.text_BigSize // Меняем Размер Шрифта
                        color: Style.primaryDark_Color // Меняем Цвет Текста
                     //   visible: false
                        text: qsTr("Создадим задание!") + mytrans.emptyString

                    }


                }


                Custom_Button{
                    width: 200
                     outlined: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("next sub page") + mytrans.emptyString
                    onClicked_Signal: {


                        root_Item.index_Page = 1
                    }

                }

                Custom_Button{
                    width: 200
                     outlined: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("back sub page") + mytrans.emptyString
                    onClicked_Signal: {


                        root_Item.index_Page = 0
                    }

                }


                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("Up") + mytrans.emptyString
                     onClicked_Signal: {
                    sub_index_HomePage = 0

                           // keyboard.open(100)
                     }

                 }


                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("Down") + mytrans.emptyString
                     onClicked_Signal: {


                            keyboard.close()

                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("next") + mytrans.emptyString
                     onClicked_Signal: {

                         sub_index_HomePage++


                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("open db") + mytrans.emptyString
                     onClicked_Signal: {

                         big_db.openDatabase("/Users/dimabogdanov/Documents/MyCart_res/ApBAZE.db")


                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("dialog") + mytrans.emptyString
                     onClicked_Signal: {

                         dialog.open()


                     }

                 }



            }
        }


    }

   /* Keyboard{
        id: keyboard
        width: parent.width
        page_target: page
        number: true
    }*/


}

