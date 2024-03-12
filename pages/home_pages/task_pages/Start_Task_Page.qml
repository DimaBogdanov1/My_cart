import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.15

import Style 1.0

import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int index_Page: 0 //-1

    readonly property var sourcePages_Array: [
                                               "../task_pages/start_task_pages/Basic_Task_Page.qml",
                                               "../task_pages/start_task_pages/Custom_Task_Page.qml",
                                               "../task_pages/start_task_pages/Warning_Page.qml"
                                            ]
    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: Style.background_Color

        Column{
            width: parent.width //- ui.big_spacing
            height: parent.height

            Item{
                width: parent.width
                height: ui.toolBar_Size

                Custom_Tabs{
                    id: tabs
                    width:  800
                    anchors.centerIn: parent
                    model: [qsTr("Маршрут из базы данных") , qsTr("Пользовательский маршрут") , qsTr("Предупреждения") ]

                    onIndexChanged: {

                        index_Page = index

                    }
                }
            }

            SwipeView{
                id: stackLayout
                width: parent.width
                height: parent.height - ui.toolBar_Size
                currentIndex: index_Page

                onCurrentIndexChanged: {

                   tabs.index = currentIndex

                    keyboard.check_close()

                }

                   Item {

                       Loader{
                           width: parent.width
                           height: parent.height
                           Component.onCompleted: source =  sourcePages_Array[0]
                       }
                   }

                   Item {

                       Loader{
                           width: parent.width
                           height: parent.height
                           Component.onCompleted: source =  sourcePages_Array[1]
                       }
                   }


                   Item {

                       Loader{
                           width: parent.width
                           height: parent.height
                           Component.onCompleted: source =  sourcePages_Array[2]
                       }
                   }


            }


        }



    }

    Item{
        width: 200
        height: parent.height - 100
        //color: "orange"
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Column{ // Создаём Основную Колонку
            width: parent.width
            height: parent.height - 24
            //anchors.centerIn: parent
            spacing: 16 //ui.basic_spacing * 2

            Custom_Button{
                width: 200
                type_Button:  Custom_Button.Type_Button.Outlined_Button
                anchors.horizontalCenter: parent.horizontalCenter
                text:  qsTr("finish task")
                onClicked_Signal: {


                    index_Task = 1

                }

            }

            Custom_Button{
                width: 200
                type_Button:  Custom_Button.Type_Button.Outlined_Button
                anchors.horizontalCenter: parent.horizontalCenter
                text:  qsTr("custom task")
                onClicked_Signal: {


                    root_Item.index_Page = 1
                }

            }

            Custom_Button{
                width: 200
                type_Button:  Custom_Button.Type_Button.Outlined_Button
                anchors.horizontalCenter: parent.horizontalCenter
                text:  qsTr("basic task")
                onClicked_Signal: {


                    root_Item.index_Page = 0
                }

            }


             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("Up")
                 onClicked_Signal: {
                sub_index_HomePage = 0

                       // keyboard.open(100)
                 }

             }


             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 type_Button:  Custom_Button.Type_Button.Outlined_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("Down")
                 onClicked_Signal: {


                        keyboard.close()

                 }

             }

             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 type_Button:  Custom_Button.Type_Button.Outlined_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("next")
                 onClicked_Signal: {

                     sub_index_HomePage++


                 }

             }

             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 type_Button:  Custom_Button.Type_Button.Outlined_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("open db")
                 onClicked_Signal: {

                     big_db.openDatabase("/Users/dimabogdanov/Documents/MyCart_res/ApBAZE.db")


                 }

             }

             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 type_Button:  Custom_Button.Type_Button.Outlined_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("dialog")
                 onClicked_Signal: {

                     dialog.open()


                 }

             }

             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 type_Button:  Custom_Button.Type_Button.Outlined_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("add old warning")
                 onClicked_Signal: {

                     Warnings.add_Warning(2, 1, "2", "2", "", "", "","", "10.03.2023", "06.07.2023", 40)


                 }

             }

             Custom_Button{
                 width: 200
                 height: ui.height_Button
                 type_Button:  Custom_Button.Type_Button.Outlined_Button
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("delete old warning")
                 onClicked_Signal: {

                     Warnings.remove_Old_Warnings()


                 }

             }


        }
    }


}
