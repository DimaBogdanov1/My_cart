import QtQuick 2.0
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0


Custom_Rectangle_Label{
    property bool error: false

    height: ui.height_MiniTitle // ui.text_miniSize
    horizontal: Text.AlignLeft
    needBack: false
    pixel_size: ui.text_miniSize
    text_color: error ? Style.error_Color : Style.primaryDark_Color
    opacity: error ? 0 : 1


    anchors {
        left: parent.left
        leftMargin:  10 //ui.basic_spacing //2

    }
}
