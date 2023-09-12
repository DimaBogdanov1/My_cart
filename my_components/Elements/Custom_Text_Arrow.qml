import QtQuick 2.0

import Style 1.0

Rectangle{
    width: parent.width
    height: ui.height_Button
    color: Style.background_Color
    radius: ui.radius

    property string text_1

    property string text_2

    Row{
        width: parent.width
        height: ui.height_Button
        spacing: ui.basic_spacing

        Custom_Rectangle_Label {
            id: startCoord_Label
            width: parent.width / 2 - ui.basic_spacing  - ui.icon_nav_size / 2
            height: parent.height
            needBack: false
            margin_text: 0
            text: text_1

        }

        Custom_Icon{
            width: ui.icon_nav_size
            height: parent.height
            source: "qrc:/icons/" + Style.theme + "/home_page/arrow_right_long.svg"

         }

        Custom_Rectangle_Label {
            id: finishCoord_Label
            width: parent.width / 2 - ui.basic_spacing - ui.icon_nav_size / 2
            height: parent.height
            margin_text: 0
            needBack: false
            text: text_2

        }

    }
}
