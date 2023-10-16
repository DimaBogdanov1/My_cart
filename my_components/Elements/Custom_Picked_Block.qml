import QtQuick 2.0

import Style 1.0
import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: ui.height_Button

    signal clicked_Signal

    property string text

    property string source

    property real icon_size: ui.icon_nav_size

    Highlight_Glow{id: glow; target: bg_Rectangle}

    Rectangle {
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        radius: ui.radius
        color: "transparent"
        layer.enabled: true
        layer.effect: Mask_Rectangle{target: parent}

        Hover_Anim{
            id: hover_Anim
            width: parent.width
            height: parent.height
            //outlined: root_Item.outlined
            //color: root_Item.color

            onClicked_Signal: {

                glow.change_glow(true)

                root_Item.clicked_Signal()

            }

            onHover_Signal: {

                glow.change_glow(value)

            }
        }

        Item{
            width: parent.width - ui.big_spacing
            height: parent.height - ui.big_spacing
            anchors.centerIn: parent

            Row{
               width: label.width + icon_size + spacing
               height: parent.height
               spacing: ui.basic_spacing

               Custom_Icon{
                  // width: parent.width - label.width
                   height: parent.height
                   icon_size: root_Item.icon_size
                   source: root_Item.source

                }

               Custom_Rectangle_Label {
                   id: label
                   color: "transparent"
                   height: parent.height
                   text: root_Item.text

               }
            }

        }




    }

}

