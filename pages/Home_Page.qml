import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    Item{
        width: parent.width
        height: parent.height

       /* Loader{
            id: homePage_Loader
            property int index_Page: -1

            readonly property var sourcePages_Array: [
                                                       "../pages/home_pages/Drop_db_Page.qml",
                                                       "../pages/home_pages/Start_Task_Page.qml",
                                                       "../pages/home_pages/Charts_Page.qml"
                                                    ]
            width: parent.width
            height: parent.height
            source: sourcePages_Array[index_Page]
            Component.onCompleted: index_Page =  0 //1 //source = sourcePages_Array[index_Page]

        }*/


        SwipeView {
            id: main_SwipeView
            width: parent.width
            height: parent.height
            currentIndex: sub_index_HomePage
            interactive: false

            Item {


                 Loader{
                     width: parent.width
                     height: parent.height
                     Component.onCompleted: source = "../pages/home_pages/Drop_db_Page.qml"

                 }
             }
             Item {


                 Loader{
                     width: parent.width
                     height: parent.height
                     Component.onCompleted: source = "../pages/home_pages/Start_Task_Page.qml"

                 }
             }
             Item {


                 Loader{
                     width: parent.width
                     height: parent.height
                     Component.onCompleted: source = "../pages/home_pages/Charts_Page.qml"

                 }
             }



        }



    }






    }


