import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width - ui.big_spacing
        height: parent.height - ui.big_spacing
        radius: ui.radius
        anchors.centerIn: parent
        color: Style.light_Color

    }
}
