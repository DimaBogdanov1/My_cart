import QtQuick 2.15
import QtQuick.Controls 2.12

import Style 1.0
import my_components 1.0


Item {
    id: root_Item
    width: ui.height_Big * 1.6
    height: parent.height

    signal clicked_Signal

    property string text_theme

    property bool checked

    property int border_width: 3

    onCheckedChanged: {

        if(checked){

            opacity_Anim.open_anim()

        }
        else{

            opacity_Anim.close_anim()

        }
    }

    Column{
        width: parent.width
        height: parent.height

        Item{
            width: parent.width
            height: ui.height_Big

            Item{
                id: tmp_Item
                width: parent.width
                height: ui.height_Big
             //   radius: ui.radius
               // color: "red"
                layer.enabled: true
                layer.effect: Mask_Rectangle{target: parent}

                Border_Gradient{ border_width: root_Item.border_width}

                Component.onCompleted: {

                    if(!root_Item.checked)
                        opacity = 0
                }

            }

            Highlight_Glow{id: glow; target: theme_Rectangle}

            Rectangle {
                id: theme_Rectangle
                width: parent.width - root_Item.border_width * 2
                height: parent.height - root_Item.border_width * 2
                radius: ui.radius - root_Item.border_width
                anchors.centerIn: parent
                color: Style.background_Color

                Hover_Anim{
                    id: hover_Anim
                    width: parent.width
                    height: parent.height
                    //color: root_Item.color

                    onClicked_Signal: {

                        glow.change_glow(true)

                        root_Item.clicked_Signal()

                    }

                    onHover_Signal: {

                        glow.change_glow(value)

                    }
                }




            }


        }


        Custom_Rectangle_Label {
            width: parent.width
            height: parent.height - theme_Rectangle.height
            margin_text: 0
            needBack: false
          //  horizontal: Text.AlignLeft
            text: text_theme

        }

        Opacity_Anim{
            id: opacity_Anim
            from: 0.4
            animation_target: tmp_Item

        }

    }

}
