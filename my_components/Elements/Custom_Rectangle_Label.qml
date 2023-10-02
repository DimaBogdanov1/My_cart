import QtQuick 2.0
import QtQuick.Controls 2.15

import my_components 1.0
import Style 1.0


Item{
    id: root_Item

    property int radius: ui.radius //ui.radius_Button

    property int margin_text: 32

    property bool needBorder

    property string text

    property string color: Style.background_Color

    property string text_color: Style.primaryDark_Color

    property int horizontal: Text.AlignHCenter

    property int vertical: Text.AlignVCenter

    property bool needBack: true

    property int pixel_size: ui.text_SmallSize

    property string font_family: custom_FontLoader.name

    property int font_weight: ui.font_weight_Smallsize


    width: label.paintedWidth + margin_text
    height: label.paintedHeight + margin_text / 2


    Rectangle {
       width: parent.width
       height: parent.height
       color: root_Item.color
       radius: root_Item.radius
       visible: needBack

       Border_Gradient{visible: needBorder}


    }

   Custom_Label{
        id: label
        horizontalAlignment: root_Item.horizontal
        verticalAlignment: root_Item.vertical
        font.weight:  root_Item.font_weight
        font.family: root_Item.font_family
        font.pixelSize: root_Item.pixel_size
        text: root_Item.text
        color: root_Item.text_color

   }

}


