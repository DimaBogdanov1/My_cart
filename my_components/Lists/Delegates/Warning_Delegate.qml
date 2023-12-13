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

    property var listview: null


    Hover_Anim{
        id: hover_Anim
        width: parent.width - ui.basic_spacing / 2
        height: parent.height
        anchors.centerIn: parent
        outlined: true
        visible: listview !== null
       // color: root_Item.color
        scale: 20
        highlight: true
        width_start_highlight:  parent.width * 3 / scale
        height_start_highlight: parent.height

        onClicked_Signal: {




            /*if (!listview.moving && needHighlight){

                warning_Popup.open()
            }*/



        }

        onHover_Signal: {

            if (!listview.moving){


                glow.change_glow(value)

            }


        }
    }

    Item {
        width: parent.width - ui.big_spacing /// 2
        height: parent.height
        anchors.centerIn: parent

        Highlight_Glow{id: glow; target: back_Row;}

        Row{
            id: back_Row
            width: parent.width
            height: parent.height

            Row{
                id: account
                width: parent.width * root_Item.sizes[0]
                height: parent.height
                spacing: ui.basic_spacing / 2
               // color: "red"

                Account_Icon{
                    id: account_icon
                    size: Account_Icon.Size.Small
                    anchors.verticalCenter: parent.verticalCenter
                    width: height
                    login: root_Item.login
                    color_value:  root_Item.color_value
                }

                Custom_Rectangle_Label {
                    width: parent.width - account_icon.width - account.spacing
                    height: parent.height
                    needBack: true
                    horizontal: Text.AlignLeft
                    text: root_Item.login
                    color: "red"

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

                    width: parent.width *  root_Item.sizes[index + 1]
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
