import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height:  ui.size_Keyboard_Russia * 4 + ui.basic_spacing

    Keyboard_Logic{
        id: keyboard_Logic
        //isNumber_Keyboard: true

    }

    Item{
        width:  ui.size_Keyboard_Russia * 11 + ui.basic_spacing
        height: parent.height - ui.basic_spacing / 2
       // color: "blue"
        anchors.centerIn: parent

        Column{
            width: parent.width - ui.basic_spacing
            height: parent.height
            anchors.centerIn: parent

            Loader {
                id: keyboard_Loader
                property int num_model: 0

                width: parent.width
                height: ui.size_Keyboard_Russia * 3
                source: num_model === 0 ? "qrc:/my_components/Keyboards/Model_Russia.qml" : "qrc:/my_components/Keyboards/Model_English.qml"

            }

            Row{ // Строка С Нижними Кнопками
                width: parent.width
                height: ui.size_Keyboard_Russia

                Keyboard_Button{
                    width: ui.size_Keyboard_Russia * 1.25
                    height: ui.size_Keyboard_Russia
                    bottom_button_index: 0
                    isIcon: true
                    source: "qrc:/icons/" + Style.theme + "/utils/discovery.svg"

                }

                Keyboard_Button{
                    width: ui.size_Keyboard_Russia * 1.25
                    height: ui.size_Keyboard_Russia
                    bottom_button_index: 1
                    isIcon: true

                }

                Keyboard_Button{
                    width: parent.width - 5 * ui.size_Keyboard_Russia
                    height: ui.size_Keyboard_Russia
                    bottom_button_index: 2

                }

                Keyboard_Button{
                    width: ui.size_Keyboard_Russia * 2.5
                    height: ui.size_Keyboard_Russia
                    bottom_button_index: 3
                    isIcon: true
                    source: "qrc:/icons/" + Style.theme + "/utils/arrow_right.svg"

                }
            }

        }

    }

}
