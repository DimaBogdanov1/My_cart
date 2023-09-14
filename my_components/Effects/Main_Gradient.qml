import QtQuick 2.15
import QtGraphicalEffects 1.0

import Style 1.0
import my_components 1.0

LinearGradient {

    property bool off: false

    property bool light: false

    property string off_color: Style.light_Color

    anchors.fill: parent
    start: Qt.point(0, 0)
    end: Qt.point(parent.width, parent.height)

    opacity: light ? 0.2 : 1

    gradient: Gradient {
        GradientStop { position: 0.0; color: !off ? Style.accent_Color : off_color}
        GradientStop { position: 1; color: !off ? Style.secondaryAccent_Color : off_color}
    }
}
