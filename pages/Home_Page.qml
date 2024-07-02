import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15



import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    Item{
        width: parent.width
        height: parent.height

        Page_Loader{

            id: page_Loader

            tmp_Index: sub_index_HomePage //1
            model: [
                "qrc:/pages/home_pages/Drop_db_Page.qml",
                "qrc:/pages/home_pages/Task_Page.qml",
                 "qrc:/pages/main_pages/Home_Chart_Page_UI.qml" //"qrc:/pages/home_pages/Charts_Page.qml"
             ]

        }

      /* Loader{
            id: homePage_Loader

            readonly property var sourcePages_Array: [
                                                       "../pages/home_pages/Drop_db_Page.qml",
                                                       "../pages/home_pages/Task_Page.qml",
                                                       "../pages/home_pages/Charts_Page.qml"
                                                    ]
            width: parent.width
            height: parent.height
            source: sourcePages_Array[sub_index_HomePage]
           //Component.onCompleted: sub_index_HomePage =  1 //2//1 //source = sourcePages_Array[index_Page]


        } */


        /*SwipeView {
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
                     Component.onCompleted: source = "../pages/home_pages/Task_Page.qml"

                 }
             }
             Item {


                 Loader{
                     width: parent.width
                     height: parent.height
                     Component.onCompleted: source = "../pages/home_pages/Charts_Page.qml"

                 }
             }



        }*/



    }


}


