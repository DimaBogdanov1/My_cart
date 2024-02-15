import QtQuick 2.15

import Style 1.0
import my_components 1.0

Custom_Flipable {
    id: flipable
    width: parent.width
    height: parent.height

    property string source

    front:  Touch_Image {
        width: parent.width
        height: parent.height
        source: flipable.source

     }

    back: Navigation_Map{
        width: parent.width
        height: parent.height

    }
}
