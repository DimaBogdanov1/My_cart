import QtQuick 2.15
import Style 1.0

import my_components 1.0



Item{
    id: root_Item
    width: parent.width
    height: ui.height_Button

    property string source

    property string text

    signal clicked_Signal

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
        outlined: true

        onClicked_Signal: {

            popup.close()

            root_Item.clicked_Signal()

        }

    }

    Row{
        width: parent.width - ui.basic_spacing * 2
        height: parent.height
        anchors.centerIn: parent
        spacing: ui.basic_spacing

        Custom_Rectangle_Label {
            id: label
            width: parent.width - ui.icon_nav_size - ui.basic_spacing
            height: parent.height
            margin_text: 0
            needBack: false
            horizontal: Text.AlignLeft
            text: root_Item.text
        }

        Custom_Icon{
            height: parent.height
            icon_size: 24
            source: root_Item.source

         }
    }

}

