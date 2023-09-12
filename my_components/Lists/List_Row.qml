import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_RowList

    property var listview: null

    property string color: Style.accent_Color

    property var sizes: [0.05, 0.15, 0.15, 0.15, 0.15, 0.15, 0.2]

    property var model: [ "№", qsTr("Координата"), qsTr("Неисправность"), qsTr("Степень"), qsTr("Амплитуда"), qsTr("Длинна"), qsTr("Количество отступлений")]

    property int cur

    onCurChanged: {

        if(listview.last_index === index){

            highlight.close_highlight()

        }

    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width - ui.big_spacing / 2
        height: parent.height
        outlined: true
        visible: listview !== null
        color: root_Item.color
        scale: 20
        highlight: true
        width_start_highlight:  parent.width * 3 / scale
        height_start_highlight: parent.height

        onClicked_Signal: {

            if(listview !== null){

                //console.log( highlight.x)

                highlight.open_highlight()

                if(listview.currentIndex !== index){

                    listview.last_index = listview.currentIndex

                    listview.currentIndex = index
                }

            }

        }

        onHover_Signal: {

            glow.change_glow(value)

            back_Rectangle.z = 10
        }
    }


    Item {
        width: parent.width - ui.big_spacing / 2/// 2
        height: parent.height //- 10 //ui.big_spacing / 2 //- 6 //ui.big_spacing / 2
         anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    //    anchors.top: parent.top
      //  anchors.left: parent.left
        //anchors.leftMargin: ui.big_spacing / 3

        Highlight_Glow{id: glow; target: back_Rectangle;}

        Item{
            id:back_Rectangle
            width: parent.width
            height: parent.height
           // color: Style.background_Color
           // radius: ui.radius

            Row{
                width: parent.width
                height: parent.height

                Repeater{
                    id: repeater
                    width: parent.width
                    height: parent.height
                    model: root_Item.model

                    Custom_Rectangle_Label {
                        id: label

                        required property int index

                        required property string modelData

                        width: parent.width * root_Item.sizes[index]
                        height: parent.height
                        margin_text: 0
                        needBack: false
                        horizontal: Text.AlignLeft
                        text: modelData
                        color: "red"

                    }


                }
            }



        }



    }

    List_Highlight{
        id: highlight
        width: 12 //parent.width - ui.big_spacing / 2
        height: parent.height //parent.height // - ui.basic_spacing / 2
        anchors.right: parent.right
        anchors.rightMargin: ui.basic_spacing * 1.5

       // anchors.centerIn: parent
     //   anchors.verticalCenter: parent.verticalCenter
        opacity: 0 // listview !== null ? false : false //listview !== null

        Component.onCompleted: {

            if(listview !== null){

                 if(listview.currentIndex === index){

                     highlight.open_highlight()

                 }

            }

        }
    }

}

