import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import Style 1.0
import my_components 1.0


Item {
    id: root_Item
    width: parent.width
    height: ui.height_Button

    signal clicked_Signal

    property string text

    property bool outlined

    property bool isOnlyText

    property bool isIcon

    property string source: ""

    property string color: Style.accent_Color

    property real pixelSize: ui.text_SmallSize

   // text: text_Button // control.text

    function create_error_anim(){

        button_Anim.create_error_anim()

    }

    Item{
        id: aa
        width: parent.width
        height: parent.height

        Highlight_Glow{id: glow; target: bg_Rectangle}

        Rectangle {
            id: bg_Rectangle
            width: parent.width
            height: parent.height
            radius: ui.radius
            layer.enabled: true
            layer.effect: Mask_Rectangle{target: parent}


            Main_Gradient{visible: !outlined}


            Border_Gradient{visible: outlined ? isOnlyText ? false : true : false}

            border{
               // width: outlined ? isOnlyText ? 0 : ui.border_Size : 0
                //color: "red" //Style.accent_Color
            }



            Hover_Anim{
                id: hover_Anim
                width: parent.width
                height: parent.height
                outlined: root_Item.outlined
                color: root_Item.color

                onClicked_Signal: {

                    button_Anim.create_scale_anim()

                    glow.change_glow(true)

                    root_Item.clicked_Signal()

                }

                onHover_Signal: {

                    glow.change_glow(value)

                }
            }

            Custom_Label{
                id: label
                horizontalAlignment: Text.AlignHCenter
                visible: !isIcon
                font.pixelSize:  root_Item.pixelSize
               // color: outlined ? root_Item.color : Style.primaryDark_Color
                text: root_Item.text

            }

            Custom_Icon{
                width: parent.width
                height: parent.height
                source: root_Item.source

                visible: isIcon

             }


        }



    }


    Button_Anim{
       id: button_Anim
       animation_target: bg_Rectangle
    }

}








