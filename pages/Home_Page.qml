import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
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
            currentIndex: 2
            interactive: false

            onCurrentIndexChanged: {

                switch(currentIndex){

                case 0:

                    topBar.hide_back()

                    break

                case 1:

                    topBar.open_back()

                    topBar.hide_more()

                    break

                case 2:

                    topBar.open_more()

                    break

                }
            }

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

        Custom_TopBar{
            id: topBar
            width: parent.width
            height: ui.toolBar_Size //ui.iconBlock_topBar_Size + ui.top_bar_margin
        }

    }



    Row{

         width: parent.width
         height: 48
         anchors.bottom: parent.bottom

         Button{
             width: 100
             height: parent.height
             text:  qsTr("back") + mytrans.emptyString
             onClicked: {

               //  homePage_Loader.index_Page--

                 main_SwipeView.currentIndex--

             }

         }

         Button{
             width: 100
             height: parent.height
             text:  qsTr("next") + mytrans.emptyString
             onClicked: {

             //    homePage_Loader.index_Page++
                 main_SwipeView.currentIndex++
             }

         }

         Button{
             width: 100
             height: parent.height
             text:  qsTr("pdf") + mytrans.emptyString
             onClicked: my_pdf.print_pdf()

         }


         Button{
             width: 100
             height: parent.height
             text:  qsTr("size+") + mytrans.emptyString
             onClicked: {

                 applicationWindow.width = 1920
                 applicationWindow.height = 1080

             }

         }


    }




    }


