import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_Button //ui.height_RowList

    property var sizes: [0.05, 0.15, 0.15, 0.15, 0.15, 0.15, 0.2]

    property var model: [ "№", qsTr("Координата"), qsTr("Неисправность"), qsTr("Степень"), qsTr("Амплитуда"), qsTr("Длинна"), qsTr("Количество отступлений")]

    property int color_value: 3

    property string login

    property real account_width


    Item {
        width: parent.width - ui.big_spacing /// 2
        height: parent.height
        anchors.centerIn: parent

        Row{
            width: parent.width
            height: parent.height

            Item{
                id: account
                width: parent.width * root_Item.sizes[0]
                height: parent.height
               // color: "red"

                Account_Icon{
                    size: Account_Icon.Size.Small
                    anchors.verticalCenter: parent.verticalCenter
                    width: height
                    login: root_Item.login
                    color_value:  root_Item.color_value
                }
            }


            Repeater{
                id: repeater
                width: parent.width - account.width
                height: parent.height
                model: root_Item.model  //.length - 1

                Custom_Rectangle_Label {
                    id: label

                    required property int index

                    required property string modelData

                    width: parent.width *  root_Item.sizes[index]
                    height: parent.height
                    needBack: false
                    horizontal: Text.AlignLeft
                    text: modelData // root_Item.model[index] //  modelData
                    color: "red"

                }


            }
        }

    }


    function get_size(index){

      //  root_Item.sizes[index]
    }

    Component.onCompleted: {


       // console.log("account_width = " + account_width)

       // console.log(sizes)
    }
}
