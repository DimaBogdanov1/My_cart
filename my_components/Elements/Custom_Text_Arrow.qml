import QtQuick 2.0

import Style 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_Button

    property string text_1

    property string text_2

    property string color:  Style.background_Color

    Highlight_Glow{id: glow; target: bg_Rectangle}


    Rectangle{
        id: bg_Rectangle
        width: parent.width
        height: ui.height_Button
        color: root_Item.color //Style.background_Color
        radius: ui.radius

        Hover_Anim{
            id: hover_Anim
            width: parent.width
            height: parent.height
            outlined: true

            onClicked_Signal: {

               button_Anim.create_rotation_anim(true)

            }

            onHover_Signal: {

                glow.change_glow(value)

            }

        }


        Button_Anim{
           id: button_Anim
           animation_target: arrow_Icon
        }

        Row{
            width: parent.width
            height: ui.height_Button
            spacing: ui.basic_spacing

            Custom_Rectangle_Label {
                id: startCoord_Label
                width: parent.width / 2 - ui.basic_spacing  - ui.icon_nav_size / 2
                height: parent.height
                needBack: false
                margin_text: 0
                text: text_1

            }

            Custom_Icon{
                id: arrow_Icon
                width: ui.icon_nav_size
                height: parent.height
                source: "qrc:/icons/" + Style.theme + "/home_page/arrow_right_long.svg"


             }

            Custom_Rectangle_Label {
                id: finishCoord_Label
                width: parent.width / 2 - ui.basic_spacing - ui.icon_nav_size / 2
                height: parent.height
                margin_text: 0
                needBack: false
                text: text_2

            }

        }


    }

}

