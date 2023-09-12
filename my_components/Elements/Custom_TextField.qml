import QtQuick 2.0
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0


TextField {
    id: textField
    selectByMouse: true
    font.weight:  ui.font_weight_Smallsize
    font.family: custom_FontLoader.name
    font.pixelSize:  ui.text_SmallSize
    implicitWidth: parent.width
    implicitHeight: parent.height
    color: Style.primaryDark_Color
    selectionColor: Style.light_Color // Style.primaryDark_Color
    focus: false

    property bool isReady: false

    signal ready_to_write_signal

    //text: " км"
    //property string color: Style.accent_Color

    Component.onCompleted: {

      //  console.log("sdsd  ", isReady)
    }

    Hover_Anim{
        width: parent.width
        height: parent.height
        outlined: true

        onClicked_Signal: {

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

            /*Hover_Anim{
                id: hover_Anim
                width: parent.width
                height: parent.height
                outlined: true
                color: root_Item.color

                onClicked_Signal: {


                    textField.focus = true
                    //root_Item.clicked_Signal()

                }
            }*/
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

    /*Custom_Rectangle_Label {
        width: 50
        height: parent.height
        margin_text: 0
        needBack: false
        anchors.right: parent.right
        anchors.rightMargin: 10
        horizontal: Text.AlignRight
        text: " Км"

    }*/

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

