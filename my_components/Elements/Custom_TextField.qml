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

    property string title

    property string text

    property int maximumLength: 100

    property var validator

    signal ready_to_write_signal

    function get_target(){

        return textField
    }

    Custom_Rectangle_Label{
        id: title_Block
        height:  ui.text_miniSize
        horizontal: Text.AlignLeft
        needBack: false
        pixel_size: ui.text_miniSize
       // color: 'red'
        text: root_Column.title

        anchors {

            left: parent.left
            leftMargin:  10 //ui.basic_spacing //2

        }
    }


    TextField {
        id: textField
        selectByMouse: true
        font.weight:  ui.font_weight_Smallsize
        font.family: custom_FontLoader.name
        font.pixelSize:  ui.text_SmallSize
        implicitWidth: parent.width
        implicitHeight: parent.height - title_Block.height - ui.basic_spacing / 2
        color: Style.primaryDark_Color
        maximumLength: root_Column.maximumLength
        validator: root_Column.validator
        selectionColor: Style.light_Color // Style.primaryDark_Color
        focus: false


        //text: " км"
        //property string color: Style.accent_Color

        Component.onCompleted: {

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

        Opacity_Anim{
            id: opacity_Anim
            from: 0.4
            animation_target: back_Rectangle

        }
    }

}


