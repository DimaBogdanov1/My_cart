import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtCharts 2.15

import Style 1.0

import my_components 1.0

Item {
    id:row
    width: parent.width
    height: parent.height

    property int tmp_Index: 0


    function addMessage(payload)
    {
        messageModel.insert(0, {"payload" : payload})

        if (messageModel.count >= 100)
            messageModel.remove(99)


        Chart_Work.add_ChartPoint(0, 10, 10)

    }




    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.blue_Color





    }


    Column {
        width: parent.width
        height: parent.height
        spacing: 30




        Custom_TextField {
            id: textField_1
            width: parent.width
            title: my_str.riht_Left
            maximumLength: 3
            validator: IntValidator{}

            onReady_to_write_signal: {

                keyboard.text_target = textField_1.get_target()

                keyboard.open(0)

            }

        }

        Stories_Block{

            onClicked_Signal: {

             //   stories_Popup.open()

            }
        }


        Stories_Popup{
            id: stories_Popup
        }



        Rectangle {
            width: 300
            height: width
            color: "brown"


            Hover_Anim{
                id: hover_Anim
                width: parent.width
                height: parent.height
               // outlined: root_Item.outlined
               // color: root_Item.color

                onClicked_Signal: {

                  //  button_Anim.create_scale_anim()

                  //  glow.change_glow(true)

                   /// root_Item.clicked_Signal()

                }

                onHover_Signal: {

                   // glow.change_glow(value)

                }
            }
        }


    }


    Column{
        width: parent.width
        height: 100
        anchors.bottom: parent.bottom

        Row{
             width: parent.width
             height: 48

             Button{
                 width: 200
                 height: parent.height
                 text:  qsTr("Начать диагностику")
                 property bool isStart: false
                 onClicked: {

                     if(isStart){

                         text = qsTr("Начать диагностику")
                         isStart = false
                     }
                     else{

                         text = qsTr("Остановить диагностику")

                         isStart = true

                     }

                     Mqqt_Client.get_Diagnostic(isStart)

                 }

             }

             Custom_Rectangle_Label {
                 id: laser_1_Label
                 width: 200
                 height: parent.height
                 color: "grey"
                 text: "2"

             }

             Custom_Rectangle_Label {
                 id: laser_2_Label
                 width: 200
                 height: parent.height
                 color: "grey"
                 text: "2"

             }

        }
        Row{

             width: parent.width
             height: 48

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("back")
                 onClicked: {

                   //  homePage_Loader.index_Page--

                     index_swipe_Home--

                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("next")
                 onClicked: {

                 //    homePage_Loader.index_Page++
                     index_swipe_Home++
                 }

             }


             Connections{
                 target: Mqqt_Client



                 function onNewDiagnostic_signal(laser_left, laser_right){

                     if(laser_left){

                         laser_1_Label.text = "левый лазер работает"
                     }
                     else{

                         laser_1_Label.text = "левый лазер не работает"

                     }

                     if(laser_right){

                         laser_2_Label.text = "правый лазер работает"
                     }
                     else{

                         laser_2_Label.text = "правый лазер не работает"

                     }
                 }
             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("size+")
                 onClicked: {

                     applicationWindow.width = 1920
                     applicationWindow.height = 1080

                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("back 1")
                 onClicked: {

                     tmp_Index = page_Loader.open_back(tmp_Index, 0)



                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("page 2")
                 onClicked: {

                  tmp_Index = page_Loader.open_next(1)

                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("page 3")
                 onClicked: {

                  tmp_Index = page_Loader.open_next(2)

                 }

             }


        }

    }




    Page_Loader{

        id: page_Loader

        width: 300
        height: 300

        anchors.centerIn: parent
        model: [
            "qrc:/my_components/Page_Components/test_Page/Page_1.qml",
            "qrc:/my_components/Page_Components/test_Page/Page_2.qml",
            "qrc:/my_components/Page_Components/test_Page/Page_3.qml"
         ]


    }




    Custom_Slider{
        width: 200
        anchors.right: parent.right
        anchors.top: parent.top

        anchors.margins: 50

    }

}
