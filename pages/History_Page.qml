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

    property var subscription: 0

    function addMessage(payload)
    {
        messageModel.insert(0, {"payload" : payload})

        if (messageModel.count >= 100)
            messageModel.remove(99)
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

            subscription = client.subscribe("test_topic")

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

        Label {
            function stateToString(value) {
                if (value === 0)
                    return "Disconnected"
                else if (value === 1)
                    return "Connecting"
                else if (value === 2)
                    return "Connected"
                else
                    return "Unknown"
            }
            color: "white"
            text: "Status:" + stateToString(client.state) + "(" + client.state + ")"
            enabled: client.state === MqttClient.Connected
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
