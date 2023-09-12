import QtQuick 2.15

import Style 1.0
import my_components 1.0


Rectangle {
    id: bg_Rectangle
    width: 300
    height: ui.height_Button * 2
    radius: ui.radius

    anchors{
        left: parent.left
        bottom: parent.bottom
        leftMargin: ui.basic_spacing
        bottomMargin: ui.basic_spacing
    }

    layer.enabled: true
    layer.effect: Mask_Rectangle{target: parent}

    Border_Gradient{}

    Row{
        width: parent.width - ui.basic_spacing
        height: ui.height_Button
        anchors.centerIn: parent
        spacing: ui.basic_spacing

        Custom_Icon{
            height: parent.height
            source: "qrc:/icons/" + Style.theme + "/utils/notification.svg"

         }

        Custom_Rectangle_Label {
            id: startCoord_Label
            width: parent.width - ui.basic_spacing - ui.icon_nav_size
            height: parent.height
            needBack: false
            horizontal: Text.AlignLeft
            margin_text: 0
            text: "Уведомление бла бла бла....."

        }
    }
}
