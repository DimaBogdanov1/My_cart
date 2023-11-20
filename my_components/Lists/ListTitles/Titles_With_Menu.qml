import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_RowList

    property string color: Style.accent_Color

    property var sizes: [0.05, 0.15, 0.15, 0.15, 0.15, 0.15, 0.2]

    property var model: [ "№", qsTr("Координата"), qsTr("Неисправность"), qsTr("Степень"), qsTr("Амплитуда"), qsTr("Длинна"), qsTr("Количество отступлений")]

    property int picked_sort_index: 0

    signal newSort_Signal(index: int, isAscending: int)

    Item {
        width: parent.width - ui.big_spacing /// 2
        height: parent.height //- 10 //ui.big_spacing / 2 //- 6 //ui.big_spacing / 2
        anchors.centerIn: parent

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
                        font_weight: ui.font_weight_Bigsize
                        font_family: customTitle_FontLoader.name
                        needBack: false
                        horizontal: Text.AlignLeft
                        text: modelData
                        color: "red"


                    }


                }
            }



        }



    }


}


