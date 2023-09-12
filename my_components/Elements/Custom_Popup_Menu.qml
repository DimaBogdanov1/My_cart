import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    x: parent.width - 200 - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing
    width: 200
    height:300
    clip: true
    padding: ui.basic_spacing / 2

    enter: popups_Anim.get_enter()

    exit: popups_Anim.get_exit()


    background: Rectangle {
       color: Style.background_Color
       radius: ui.radius
       width: parent.width
       height:  parent.height

       Border_Gradient{}

    }

    Popups_Anim{
        id: popups_Anim

    }
}
