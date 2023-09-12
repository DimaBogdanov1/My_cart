import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.blue_Color


        Custom_Slider{
            width: 200
            anchors.centerIn: parent

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

                 index_swipe_Home--

             }

         }

         Button{
             width: 100
             height: parent.height
             text:  qsTr("next") + mytrans.emptyString
             onClicked: {

             //    homePage_Loader.index_Page++
                 index_swipe_Home++
             }

         }

         Button{
             width: 100
             height: parent.height
             text:  qsTr("pdf / json") + mytrans.emptyString
             onClicked: {

              //   my_pdf.init()

              //  my_pdf.create_json()
                 my_pdf.print_pdf()

             }

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
