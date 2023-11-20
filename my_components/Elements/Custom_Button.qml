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

    property bool icon_with_Text

    property string source: ""

    property string color: Style.background_Color

    property real pixelSize: ui.text_miniSize

    property bool isCheck


    property bool basic_text

    property bool tmp_gardient_check


   // text: text_Button // control.text

    function create_error_anim(){

        button_Anim.animation_target = bg_Rectangle

        button_Anim.create_error_anim()

    }

    function create_rotation_anim(){

        button_Anim.animation_target = icon

        button_Anim.create_rotation_anim()

        isCheck = button_Anim.isRotated

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
            color: !outlined ? Style.primaryDark_Color :  root_Item.color//Style.background_Color
            layer.enabled: true
            layer.effect: Mask_Rectangle{target: parent}


            Main_Gradient{visible: tmp_gardient_check}

           // Main_Gradient{visible: !outlined}


         //   Border_Gradient{visible: outlined ? isOnlyText ? false : true : false}

            border{
                width: outlined ? isOnlyText ? 0 : ui.border_Size : 0
                color: Style.primary_Color
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


            Custom_Rectangle_Label {
                id: label
                height: parent.height
                needBack: false
                //color: "green"
                //horizontal: Text.AlignLeft
                visible: !isIcon
                pixel_size:  !root_Item.basic_text ? root_Item.pixelSize : ui.text_SmallSize
                font_weight: !root_Item.basic_text ? ui.font_weight_Bigsize : ui.font_weight_Smallsize
                font_family: !root_Item.basic_text ?  customTitle_FontLoader.name : custom_FontLoader.name
                text_color: outlined || isOnlyText ? Style.primaryDark_Color : Style.background_Color
                anchors.horizontalCenter: parent.horizontalCenter
                text: root_Item.text

            }

            Custom_Icon{
                id: icon
                //width: parent.width
                //height: parent.height
                //icon_size: 24
                source: root_Item.source
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                visible: isIcon || icon_with_Text

                Component.onCompleted: {

                    if(icon_with_Text){

                      //  icon.icon_size = 24

                        const spacing = 0 //ui.basic_spacing  /// 2

                        const icon_deviation = 9

                        const all_width = (label.width + icon.width  + spacing ) / 2


                        var a = (label.width  + spacing / 2) / 2

                        var b = a - all_width


                        var c = (icon.width +  spacing / 2) / 2


                        var d = -1 *( c - all_width) + icon_deviation

                        label.anchors.horizontalCenterOffset = b //-1 * (label.width  - all_width)

                        icon.anchors.horizontalCenterOffset = d //-1 * (icon.width - all_width) //label.width / 2 + ui.icon_nav_size / 2 + ui.basic_spacing

                    }

                }
             }


            /*Custom_Label{
                id: label
                horizontalAlignment: Text.AlignHCenter
                visible: !isIcon
                color: outlined || isOnlyText ? Style.primaryDark_Color : Style.background_Color
                font.pixelSize:  12 //root_Item.pixelSize
                font.weight:  ui.font_weight_Bigsize
                font.family: customTitle_FontLoader.name

               // color: outlined ? root_Item.color : Style.primaryDark_Color
                text: root_Item.text


            }*/



        }



    }


    Button_Anim{
       id: button_Anim
       animation_target: bg_Rectangle
    }

}








