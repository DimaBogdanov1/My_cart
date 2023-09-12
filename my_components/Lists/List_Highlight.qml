import QtQuick 2.0

import Style 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    function open_highlight(){

        highlight_Anim.open_anim()
    }

    function close_highlight(){

        highlight_Anim.close_anim()
    }

    Rectangle {
        id: root_Rectangle
        width: parent.width
        height: parent.width
        anchors.centerIn: parent
        layer.enabled: true
        layer.effect: Mask_Rectangle{target: root_Rectangle; radius: parent.width / 2}

        Main_Gradient{}




        Highlight_Anim{
            id: highlight_Anim
            animation_target: root_Item
        }
     }

}

