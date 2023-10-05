import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtCharts 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    id:row
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.blue_Color





    }
    Column {
        width: parent.width
        height: parent.height




    Custom_TextField {
        id: textField_1
        width: parent.width
        title: str.riht_Left
        maximumLength: 3
        validator: IntValidator{}

        onReady_to_write_signal: {

            keyboard.text_target = textField_1.get_target()

            keyboard.open(0)

        }

    }

    Row{
        width: parent.width
        height: 60

        ChartView {

           width: parent.width  /2
           height: parent.height
           dropShadowEnabled: false
           antialiasing: true
           backgroundColor: Style.background_Color //"red"//Style.background_Color
           legend.visible:false
           plotAreaColor: Style.background_Color


        }

        ChartView {

           width: parent.width  /2
           height: parent.height + 71//96 //95
           dropShadowEnabled: false
           antialiasing: true
           backgroundColor: Style.background_Color //"red"//Style.background_Color
           legend.visible:false
           plotAreaColor: Style.background_Color


        }
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



    Custom_Slider{
        width: 200
        anchors.centerIn: parent

    }

}
