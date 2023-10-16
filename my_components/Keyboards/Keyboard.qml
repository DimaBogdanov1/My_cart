import QtQuick 2.15
import Style 1.0
import QtQuick.Controls 2.15

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    property var page_target

    property var text_target

    property bool number

    property bool full_number_keyboard

    property string value

    property bool on_keyboard

    signal new_symbol_signal(string symbol)

    signal delete_symbol_signal()

    function open(value){

        if(app_Settings.tablet_mode){

            keyboard_Anim.up_val = value

            on_keyboard = true

            keyboard_Anim.up_content()

        }

    }

    function close(){

        text_target.focus = false

        keyboard_Anim.down_content()

    }

    function check_close(){

        if(on_keyboard){

            close()
        }
    }

    enum Actions {
           Change_Language,
           Add_Dot,
           Add_Space,
           Enter,
           Change_Caps,
           Delete_Symbol,
           Add_Dot_Number,
           Check_Sign
       }

    Keyboard_Anim{
        id: keyboard_Anim
        page_target: root_Item.page_target
        keyboard_target: keyboard_Rectangle //keyboard_Loader
    }

    Item{
        id: keyboard_Rectangle
        width: parent.width
        height:  ui.size_Keyboard_Russia * 4 + ui.basic_spacing
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1 * keyboard_Rectangle.height

        Item{
            width: parent.width
            height:  parent.height

            Flickable{
                width: parent.width
                height:  parent.height
            }

            //Highlight_Glow{target: bg_Rectangle; shadow: true; glowRadius: 1}

            Rectangle {
                id: bg_Rectangle
                width: parent.width
                height:  parent.height
                enabled: false
                color: Style.light_Color
                radius: ui.radius

                Rectangle { // Создаём Блок Для Того ЧТобы Скругления Были Только С Одной Стороны
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: bg_Rectangle.color

                }
            }
        }



        Loader{
            id: keyboard_Loader
            width: parent.width
            height: parent.height
            source: on_keyboard ? (number ? "qrc:/my_components/Keyboards/Keyboard_Number.qml" : "qrc:/my_components/Keyboards/Keyboard_Letter.qml") : ""

            onLoaded: {

                if(on_keyboard){


                }
            }

            onSourceChanged: {

                opacity_Anim.open_anim()
            }

         //   Component.onCompleted: source = number ? "qrc:/my_components/Keyboards/Keyboard_Number.qml" : "qrc:/my_components/Keyboards/Keyboard_Letter.qml"

        }

    }




    Opacity_Anim{
        id: opacity_Anim
        animation_target: keyboard_Loader

    }
}
