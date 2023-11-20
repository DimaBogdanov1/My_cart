import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtCharts 2.15
import MqttClient 1.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    id:row
    width: parent.width
    height: parent.height

    property int tmp_Index: 0


    property var subscription: 0

    function addMessage(payload)
    {
        messageModel.insert(0, {"payload" : payload})

        if (messageModel.count >= 100)
            messageModel.remove(99)


        Chart_Work.add_ChartPoint(0, 10, 10)

    }


    MqttClient {
        id: client
        hostname: '127.0.0.1'
        port:  applicationWindow.port

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
        title: str.riht_Left
        maximumLength: 3
        validator: IntValidator{}

        onReady_to_write_signal: {

            keyboard.text_target = textField_1.get_target()

            keyboard.open(0)

        }

    }


    Button {
        id: connectButton
        Layout.columnSpan: 2
        Layout.fillWidth: true
        text: client.state === MqttClient.Connected ? "Disconnect" : "Connect"
        onClicked: {

           //  client.connectToHost()

           if (client.state === MqttClient.Connected) {
                client.disconnectFromHost()
                messageModel.clear()
                subscription.destroy()
                subscription = 0
            } else
                client.connectToHost()


        }
    }

    Button {
        id: subButton
        text: "Subscribe"
        onClicked: {

           // sensors/+/temperature
           subscription = client.subscribe("test_topic/+/ww")

            subscription.messageReceived.connect(addMessage)
        }
    }



    ListView {
        id: messageView
        model:     ListModel {
            id: messageModel
        }
        height: 300
        width: 200
        Layout.columnSpan: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        clip: true
        delegate: Rectangle {
            width: messageView.width
            height: 30
            color: index % 2 ? "white" : "orange"
            radius: 5
            Text {
                text: payload
                anchors.centerIn: parent
            }
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

         Button{
             width: 100
             height: parent.height
             text:  qsTr("back 1") + mytrans.emptyString
             onClicked: {

                 tmp_Index = page_Loader.open_back(tmp_Index, 0)



             }

         }

         Button{
             width: 100
             height: parent.height
             text:  qsTr("page 2") + mytrans.emptyString
             onClicked: {

              tmp_Index = page_Loader.open_next(1)

             }

         }

         Button{
             width: 100
             height: parent.height
             text:  qsTr("page 3") + mytrans.emptyString
             onClicked: {

              tmp_Index = page_Loader.open_next(2)

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
