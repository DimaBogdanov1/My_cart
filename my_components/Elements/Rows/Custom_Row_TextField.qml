import QtQuick 2.0

import Style 1.0
import MyLang 1.0

import my_components 1.0

Row{
    id: root_Row
    width: parent.width
    height: ui.block_height
    spacing: ui.basic_spacing

    property string source

    property real start_Keyboard

    property var model

    function get_text(index){

        return repeater.itemAt(index).get_target().text

    }

    Custom_Icon{
        height: ui.height_Button
        anchors.bottom: parent.bottom
        source: root_Row.source

     }

    Row{
        width: parent.width - ui.basic_spacing - ui.icon_nav_size
        height: parent.height
        spacing: ui.basic_spacing


        Repeater{
            id: repeater
            width: parent.width
            height: parent.height
            model: root_Row.model

            Custom_TextField {
                width: parent.width / root_Row.model.count - (ui.basic_spacing * (root_Row.model.count - 1)) / root_Row.model.count
                title: model.title
                password: model.password === undefined ? false : model.password
                maximumLength: model.km ? 4 : ( model.meter ? 3 : password ? 4 : model.maximumLength )
                validator: IntValidator{}

                onReady_to_write_signal: {

                    console.log("start_Keyboard = " + start_Keyboard)

                    keyboard.number = !model.isLetter

                    keyboard.text_target = get_target()

                    keyboard.open(root_Row.start_Keyboard)

                }

            }
        }
    }



}
