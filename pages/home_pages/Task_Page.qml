import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.15



import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int index_Task: 0 //1 //0

    readonly property var sourcePages_Array: [
                                               "../home_pages/task_pages/Start_Task_Page.qml",
                                               "../home_pages/task_pages/Finish_Task_Page.qml"
                                            ]

    onIndex_TaskChanged: {

        if(index_Task == 1){

            finish_Task_Loader.item.clear()

            //Warnings.get_All_Warnings()

        }
    }

    StackLayout{
        id: task_StackLayout
        width: parent.width
        height: parent.height
        currentIndex: index_Task

        Loader{
            width: parent.width
            height: parent.height
            Component.onCompleted: source = sourcePages_Array[0]
        }

        Loader{
            id: finish_Task_Loader
            width: parent.width
            height: parent.height
            Component.onCompleted: source = sourcePages_Array[1]
        }
    }


    /*Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: Style.background_Color



        Column{
            width: parent.width //- ui.big_spacing
            height: parent.height //- ui.big_spacing
            anchors.centerIn: parent
           // spacing: ui.middle_spacing

            Item{
                width: parent.width
                height: ui.toolBar_Size

                Custom_Tabs{
                    id: tabs
                    width: 800 //parent.width * 0.7
                    anchors.centerIn: parent
                    model: [qsTr("Маршрут из базы данных") + mytrans.emptyString, qsTr("Пользовательский маршрут") + mytrans.emptyString, qsTr("Предупреждения") + mytrans.emptyString]

                    onIndexChanged: {

                        index_Page = index

                    }
                }
            }

            Rectangle{
                width: tabs.width // parent.width < 1000 ? parent.width * 0.6 : tabs.width
                height:   ui.height_Button * 3 + ui.block_height * 2 + 300 + 16 * 7  + ui.big_spacing
                radius: ui.radius
                anchors.horizontalCenter: parent.horizontalCenter
               // anchors.centerIn: parent
                color: Style.light_Color

                Item{
                    width: parent.width - ui.big_spacing
                    height: parent.height - ui.big_spacing
                    anchors.centerIn: parent

                    StackLayout{
                        id: stackLayout
                        width: parent.width
                        height: parent.height - tabs.height - ui.middle_spacing
                        currentIndex: index_Page

                        Loader{
                            width: parent.width
                            height: parent.height
                            Component.onCompleted: source =  sourcePages_Array[0]
                        }

                        Loader{
                            width: parent.width
                            height: parent.height
                            source: sourcePages_Array[index_Page]
                            Component.onCompleted: source = sourcePages_Array[1]
                        }

                        Loader{
                            width: parent.width
                            height: parent.height
                            source: sourcePages_Array[index_Page]
                            Component.onCompleted: source =  sourcePages_Array[2]
                        }

                        Loader{
                            width: parent.width
                            height: parent.height
                            source: sourcePages_Array[index_Page]
                            Component.onCompleted: source =  sourcePages_Array[3]
                        }
                    }

                }




            }

        }

        */





    Component.onCompleted: {

      //  big_db.openDatabase("/Users/dimabogdanov/Documents/MyCart_res/ApBAZE.db")

    }

   /* Keyboard{
        id: keyboard
        width: parent.width
        page_target: page
        number: true
    }*/


}

