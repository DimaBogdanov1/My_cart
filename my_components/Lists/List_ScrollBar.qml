import QtQuick 2.0
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

ScrollBar {

    property int width_bar: 3
    active: true

    policy: ScrollBar.AsNeeded

    snapMode: ScrollBar.NoSnap

    size: 0.5

    //stepSize: 0.2

    contentItem: Rectangle {
            implicitWidth: width_bar                      
            layer.enabled: true
           //color: Style.light_Color
            layer.effect: Mask_Rectangle{target: parent}

            Main_Gradient{}

        }
}
