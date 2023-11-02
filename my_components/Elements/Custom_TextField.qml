import QtQuick 2.0
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0


Column{
    id: root_Column
    width: parent.width
    height: ui.block_height //ui.height_Button +  ui.text_miniSize + ui.basic_spacing / 2
    spacing: ui.basic_spacing / 2

    property bool isReady: false

    property bool password: false

    property string title

    property string text

    property int maximumLength: 100

    property var validator

    property string error_message

    property bool error

    signal ready_to_write_signal

    function get_target(){

        return textField
    }

    function create_error(text){

        error_Message.text =  text

        textField_Anim.open_close_anim()
    }

    Mini_Title{
        id: title_Block
        error: root_Column.error
        text: root_Column.title

    }

    TextField {
        id: textField
        selectByMouse: true
        font.weight:  ui.font_weight_Smallsize
        font.family: custom_FontLoader.name
        font.pixelSize:  ui.text_SmallSize
        implicitWidth: parent.width
        implicitHeight: ui.height_Button //parent.height - title_Block.height - ui.basic_spacing / 2
        color: Style.primaryDark_Color
        maximumLength: root_Column.maximumLength
        validator: root_Column.validator
        selectionColor: Style.light_Color // Style.primaryDark_Color
        focus: false
        echoMode: password ? TextInput.Password : TextInput.Normal

        text: root_Column.text


        //text: " км"
        //property string color: Style.accent_Color

        Component.onCompleted: {

         //   textField.text = root_Column.text
          //  console.log("sdsd  ", isReady)
        }

       /* onHoveredChanged: {
            glow.change_glow(hovered)

        }

        onPressed:{

        }*/

        Hover_Anim{
            width: parent.width
            height: parent.height
            outlined: true

            onClicked_Signal: {

                if(textField.length > 0){

                   // mouse_enabled = false
                }
                else{

                    //mouse_enabled = true

                }

                textField.forceActiveFocus()


            }

            onHover_Signal: {

                glow.change_glow(value)

            }
        }




        background: Item {
            width: parent.width
            height: parent.height

            Highlight_Glow{id: glow; target: back_Rectangle;}

                Rectangle {
                id: back_Rectangle
                width: parent.width
                height: parent.height
                radius: ui.radius
                color: Style.background_Color //"transparent"

                Border_Gradient{visible: isReady}

                }

                Custom_Icon{
                    id: help_Icon
                    height: ui.height_Button
                    icon_size: 22
                    visible: password
                    anchors.right: parent.right
                    anchors.rightMargin: ui.basic_spacing / 2
                    source: "qrc:/icons/" + Style.theme + "/utils/eye.svg"

                    property bool checked: true

                    Hover_Anim{
                        width: parent.width
                        height: parent.height
                        outlined: true
                        mouse_enabled: help_Icon.visible

                        onClicked_Signal: {

                            if(help_Icon.checked){

                                help_Icon.source = "qrc:/icons/" + Style.theme + "/utils/eye_slash.svg"

                                help_Icon.checked = false
                            }
                            else{

                                help_Icon.source = "qrc:/icons/" + Style.theme + "/utils/eye.svg"

                                help_Icon.checked = true

                            }


                        }


                    }

                 }

                PropertyAnimation {
                    id: anim
                    target: back_Rectangle
                    property: "border.color"
                    to: "red"
                    duration: 250

                }
        }

        onTextChanged: {

            var patt = " км";

            root_Column.text = text

            if(!text.includes(patt)){

                //text += " км"

            }

        }

        onFocusChanged: {

           // opacity_Anim.open_anim()

            if(focus){

                isReady = true

               ready_to_write_signal()

               // opacity_Anim.open_anim()

              // anim.to = Style.accent_Color

                glow.change_glow(isReady)

            }
            else{

                isReady = false


               // opacity_Anim.close_anim()
                //anim.to = Style.primaryDark_Color

            }



           // opacity_Anim.open_anim()

        }


        ColorAnimation {
            id: sss
            target: back_Rectangle
            from: "white"
            to: "black"
            duration: 200
        }

       /* Opacity_Anim{
            id: opacity_Anim
            from: 0.4
            animation_target: error_Message //back_Rectangle

        }*/

        TextField_Anim{
            id: textField_Anim
            animation_target: error_Message
        }
    }

    Item{
       width: parent.width
       height: title_Block.height
       clip: true

        Mini_Title{
            id: error_Message
            error: true
            text: root_Column.error_message

        }
    }


}


