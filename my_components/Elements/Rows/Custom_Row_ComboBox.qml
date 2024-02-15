import QtQuick 2.0

import Style 1.0


import my_components 1.0

Row{
    id: root_Row
    width: parent.width
    height: !miniSize ? ui.block_height : ui.mini_block_height
    spacing: ui.basic_spacing

    property int currentIndex

    property string source

    property string title

    property real start_Keyboard

    property bool needIcon: true

    property bool miniSize: false

    property var model

    property var backend_models: []

    property var picked_indexes: []

    signal change_index_signal(index_model: int, index: int)


    function get_text(index){

        return repeater.itemAt(index).get_target().text

    }

    Icon_In_Row{visible: needIcon}

    Row{
        width: needIcon ?  parent.width - ui.basic_spacing - ui.icon_nav_size : parent.width
        height: parent.height
        spacing: ui.basic_spacing

        Repeater{
            id: repeater
            width: parent.width
            height: parent.height
            model: root_Row.model

            Custom_Combobox {
                id: combo
                required property int index

                width: parent.width / root_Row.model.count - (ui.basic_spacing * (root_Row.model.count - 1)) / root_Row.model.count
                title: root_Row.model.get(index).title
                model:  root_Row.backend_models.length !== 0 ? (root_Row.backend_models[index] !== "" ? backend_models[index] : root_Row.model.get(index).values) : root_Row.model.get(index).values  //model.values
                tmp_currentIndex: root_Row.picked_indexes.length !== 0 ? root_Row.picked_indexes[index] : 0

                onCurrentIndexChanged: {

                    change_index_signal(index, currentIndex)

                    //root_Row.currentIndex = currentIndex

                }

            }
        }
    }

    /*Custom_Combobox {
        width: parent.width - ui.icon_nav_size - ui.basic_spacing   /// root_Row.model.count - (ui.basic_spacing * (root_Row.model.count - 1)) / root_Row.model.count
        title: root_Row.title
        model: root_Row.model

        onCurrentIndexChanged: {

            root_Row.currentIndex = currentIndex

        }

    }*/



}
