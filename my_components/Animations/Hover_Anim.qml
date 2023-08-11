import QtQuick 2.0
import QtGraphicalEffects 1.15
import Style 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height
    clip: true
    signal clicked_Signal

    property int radius: ui.radius // Радиус Скругления Эффекта

    property bool outlined

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


    Rectangle {
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        opacity: 0
        clip: true
        color: "#20FFFFFF" //outlined ? Style.accent_Color  : "#20FFFFFF"

        layer.enabled: true
        layer.effect: OpacityMask {
               maskSource: Item {
                   width: bg_Rectangle.width
                   height: bg_Rectangle.height
                   Rectangle {
                       anchors.centerIn: parent
                       width: bg_Rectangle.width
                       height: bg_Rectangle.height
                       radius: root_Item.radius
                   }
               }
        }

       Rectangle {
           id: round_rec
           width: 20
           height: 20
           radius: width / 2
           opacity: 0
           color:  outlined ? Style.accent_Color : Style.background_Color

       }

    }





    MouseArea {
        id:button
         anchors.fill: parent
         hoverEnabled: true
         acceptedButtons: Qt.LeftButton | Qt.RightButton

         onEntered: {

             start_Anim(bg_Rectangle.opacity)
         }

         onExited: {

            stop_Anim(bg_Rectangle.opacity)

         }

         onPressed: {
             root_Item.clicked_Signal()

             round_rec.x = mouse.x - round_rec.width / 2
             round_rec.y = mouse.y - round_rec.height / 2

             test_Anim.stop()

             test_Anim.start()

        }

     }


    NumberAnimation {id: hoverAnim ; target: bg_Rectangle; property: "opacity"; from: 0; to: 0; duration: 200}

    ParallelAnimation {
        id: test_Anim

        NumberAnimation { target: round_rec; property: "scale"; from: 0; to: 10; duration: 400} // Math.round(parent.width / 20)

        NumberAnimation { target: round_rec; property: "opacity"; from: 0.4; to: 0; duration: 400}

    }

}
