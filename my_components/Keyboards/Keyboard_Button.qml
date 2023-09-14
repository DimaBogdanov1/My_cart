import QtQuick 2.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    signal clicked_Signal

    property string text

    property string color

    property string source: ""

    property bool isIcon

    property bool caps

    property int bottom_button_index: -1


    Custom_Button{
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        outlined: !isIcon
        anchors.horizontalCenter: parent.horizontalCenter
        pixelSize: ui.text_MiddleSize
        isIcon:  root_Item.isIcon
        source: root_Item.source
          isOnlyText: true
        text:  root_Item.caps ? root_Item.text : root_Item.text.toLowerCase()

        onClicked_Signal: {

          //  root_Item.clicked_Signal()

            if(bottom_button_index != -1){

                switch(bottom_button_index){

                case 0:

                    keyboard_Logic.change_language()

                    break

                case 1:

                    keyboard_Logic.add_dot()

                    break

                case 2:

                    keyboard_Logic.add_space()

                    break

                case 3:

                    keyboard_Logic.enter()

                    break

                case 4:

                    keyboard_Logic.change_caps()

                    break

                case 5:

                    keyboard_Logic.delete_symbol()

                    break

                case 6:

                    keyboard_Logic.add_dot_number()

                    break

                case 7:

                    keyboard_Logic.check_sign()

                    break
                }
            }
            else{

                keyboard_Logic.add_symbol(text)

            }



        }


    }

    /*Highlight_Glow{id: glow; target: bd_Rectangle}

    Rectangle {
        id: bd_Rectangle
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        anchors.centerIn: parent
        color: Style.background_Color //isIcon ? "transparent" : Style.background_Color
        radius: ui.radius
        layer.enabled: true
        layer.effect: Mask_Rectangle{target: parent}

        Main_Gradient{visible: isIcon}

        Hover_Anim{
            id: hover_Anim
            width: parent.width
            height: parent.height
            outlined: !isIcon //root_Item.outlined
            color: root_Item.color

            onHover_Signal: {

                if(isIcon){


                }
                glow.change_glow(value)

            }

            onClicked_Signal: {

                glow.change_glow(true)

              //  root_Item.clicked_Signal()

                if(bottom_button_index != -1){

                    switch(bottom_button_index){

                    case 0:

                        keyboard_Logic.change_language()

                        break

                    case 1:

                        keyboard_Logic.add_dot()

                        break

                    case 2:

                        keyboard_Logic.add_space()

                        break

                    case 3:

                        keyboard_Logic.enter()

                        break

                    case 4:

                        keyboard_Logic.change_caps()

                        break

                    case 5:

                        keyboard_Logic.delete_symbol()

                        break

                    }
                }
                else{

                    keyboard_Logic.add_symbol(label.text)

                }



            }
        }

        Custom_Label{
            id: label
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: ui.text_MiddleSize
            visible: !isIcon
            text: root_Item.caps ?  root_Item.text : root_Item.text.toLowerCase()

        }

        Custom_Icon{
            width: parent.width
            height: parent.height
            source: root_Item.source

            visible: isIcon

         }
    }

    */

}
