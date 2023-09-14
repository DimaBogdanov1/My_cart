import QtQuick 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Row {
    id: root_Column
    width: 300 //parent.width
    height: ui.block_height //+ label.height + ui.basic_spacing//label.height
    spacing: ui.basic_spacing

    property string text

    Custom_Rectangle_Label {
        id: label
        width: 150
        height: ui.height_Button
        anchors.bottom: parent.bottom
        text: root_Column.text
        needBack: false
        vertical: Text.AlignVCenter
       // anchors.left: parent.left
        horizontal: Text.AlignLeft
       // needBorder: true

    }

    Row{
        width: parent.width
        height: parent.height - label.height - ui.basic_spacing
        spacing: ui.basic_spacing

        Custom_TextField {
            id: textField_1
            width: parent.width / 2 - ui.basic_spacing / 2
            title: qsTr("Смещение")
            maximumLength: 8
            validator: IntValidator{}

            onReady_to_write_signal: {

                keyboard.text_target = textField_1.get_target()

                keyboard.open(0)

            }

        }

        Custom_TextField {
            id: textField_2
            width: parent.width / 2 - ui.basic_spacing / 2
            title: qsTr("Множитель")
            maximumLength: 3
            validator: IntValidator{}

            onReady_to_write_signal: {

                keyboard.text_target = textField_2.get_target()

                keyboard.open(0)

            }

        }

    }


}
