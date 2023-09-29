import QtQuick 2.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Custom_Rectangle_Label {
    width: 16
    height: 16

    property int count: 12

    radius: height / 2
    y: -1 * height / 3
    x:  height + height / 2
   // pixel_size: root_Item.big ? ui.text_SmallSize : 10
    //anchors.right: parent.right
    margin_text: 4
    pixel_size: 12
    text: count.toString()
    color: "#FFA300"  //"#FB4143" //Style.errorBackground_Color
    text_color: Style.background_Color

}
