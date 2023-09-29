import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height
   // clip: true

    signal clicked_Signal

    signal hover_Signal(value: bool)

    signal pressed_Signal()

    signal pressed_and_Hold_Signal()

    property int radius: ui.radius // Радиус Скругления Эффекта

    property bool needTip

    property string tip_text

    property bool outlined

    property string color: Style.accent_Color

    property int scale: 10

    property bool highlight: false

    property int width_start_highlight

    property int height_start_highlight

    property bool mouse_enabled: true

    function start_Anim(from_value){

        hoverAnim.from = from_value
        hoverAnim.to = 1

        hoverAnim.stop()

        hoverAnim.start()

    }

    function stop_Anim(from_value){

        hoverAnim.from = from_value
        hoverAnim.to = 0

        hoverAnim.stop()

        hoverAnim.start()

    }


    Custom_ToolTip{
        id: toolTip
        needTip: root_Item.needTip
    }



    Rectangle {
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        opacity: 0
        clip: true
        color: "#20FFFFFF" // outlined ? "#40ffc3a0"  : "#20FFFFFF" // "blue" //

        layer.enabled: true
        layer.effect: Mask_Rectangle{target: parent}

        Main_Gradient{visible: outlined; light: true;}


       Rectangle {
           id: round_rec
           width: 20
           height: 20
           radius: width / 2
           opacity: 0
           color:  outlined ? root_Item.color : Style.background_Color

       }



       Rectangle {
           id: high_rec
           width: width_start_highlight
           height: height_start_highlight
           radius: width / 2
           opacity: 0
           color:  outlined ? root_Item.color : Style.background_Color

       }

    }


    MouseArea {
         anchors.fill: parent
         hoverEnabled: true
        // enabled: root_Item.mouse_enabled

         pressAndHoldInterval: 50

         acceptedButtons:  Qt.LeftButton //| Qt.RightButton

         onPressAndHold: {

             root_Item.pressed_and_Hold_Signal()

         }

         onEntered: {

              if(root_Item.mouse_enabled){

                  root_Item.hover_Signal(true)

                  toolTip.show_ToolTip(tip_text)

                  start_Anim(bg_Rectangle.opacity)
              }

         }

         onExited: {

            // toast.show("exit", 3000, 1)

             root_Item.hover_Signal(false)

            toolTip.close_ToolTip()

            stop_Anim(bg_Rectangle.opacity)

         }

         onPressed: {

             if(root_Item.mouse_enabled){

                 root_Item.clicked_Signal()


                 round_rec.x = mouse.x - round_rec.width / 2
                 round_rec.y = mouse.y - round_rec.height / 2

                 high_rec.x =  round_rec.x

                 high_rec.y =  round_rec.y

                 test_Anim.stop()

                 test_Anim.start()
             }



           //  highlight_Anim.start()

        }


     }


    NumberAnimation {id: hoverAnim ; target: bg_Rectangle; property: "opacity"; from: 0; to: 0; duration: 200}



    ParallelAnimation {
        id: test_Anim

        NumberAnimation { target: round_rec; property: "scale"; from: 0; to: 10; duration: 400} // Math.round(parent.width / 20)

        NumberAnimation { target: round_rec; property: "opacity"; from: 0.4; to: 0; duration: 400}

    }

    ParallelAnimation {
        id: highlight_Anim

        NumberAnimation { target: high_rec; property: "scale"; from: 0; to: root_Item.scale; duration: 400} // Math.round(parent.width / 20)

        NumberAnimation { target: high_rec; property: "opacity"; from: 0; to: 1; duration: 400}

    }

}
