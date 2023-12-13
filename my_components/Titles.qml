import QtQuick 2.15
import Style 1.0


import my_components 1.0


Column{
    width: parent.width
    height: ui.text_BigSize + 50 + ui.big_spacing
    spacing: ui.big_spacing

    property string first_title

    property string second_title

    Custom_Rectangle_Label {
        width: parent.width
        height: ui.text_BigSize
        margin_text: 0
        needBack: false
        vertical: Text.AlignTop
        horizontal: Text.AlignHCenter
        pixel_size: ui.text_BigSize
        font_weight:  ui.font_weight_Bigsize
        font_family: customTitle_FontLoader.name
        text: first_title


    }

    Custom_Rectangle_Label {
        width: parent.width
        height: 50
        margin_text: 0
        needBack: false
        vertical: Text.AlignTop
        horizontal: Text.AlignHCenter
        text: second_title


    }

}
