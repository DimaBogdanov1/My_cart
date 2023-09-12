import QtQuick 2.15
import Style 1.0

import my_components 1.0

Row{
    width: parent.width
    height: ui.height_Button

    property string title

    property string text_value

    Custom_Rectangle_Label{
        width: parent.width * 0.6
        height: parent.height
        needBack: false
       // color: "blue" // Меняем Цвет Текста
        horizontal: Text.AlignLeft
        //vertical: Text.AlignTop
        text: title

    }

    Custom_Rectangle_Label{
        width: parent.width * 0.4
        height: parent.height
        needBack: false
       // color: "blue" // Меняем Цвет Текста
        horizontal: Text.AlignRight
        //vertical: Text.AlignTop
        text: text_value

    }


}
