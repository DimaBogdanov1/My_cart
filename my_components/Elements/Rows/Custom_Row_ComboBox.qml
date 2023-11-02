import QtQuick 2.0

import Style 1.0
import MyLang 1.0

import my_components 1.0

Row{
    id: root_Row
    width: parent.width
    height: ui.block_height
    spacing: ui.basic_spacing

    property int currentIndex

    property string source

    property string title

    property real start_Keyboard

    property var model

    function get_text(index){

        return repeater.itemAt(index).get_target().text

    }

    Icon_In_Row{}

    Custom_Combobox {
        width: parent.width - ui.icon_nav_size - ui.basic_spacing   /// root_Row.model.count - (ui.basic_spacing * (root_Row.model.count - 1)) / root_Row.model.count
        title: root_Row.title
        model: root_Row.model

        onCurrentIndexChanged: {

            root_Row.currentIndex = currentIndex

        }

    }



}
