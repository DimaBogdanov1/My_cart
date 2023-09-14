import QtQuick 2.15
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

    signal new_symbol_signal(string symbol)

    signal delete_symbol_signal()

    function open(value){

        if(app_Settings.tablet_mode){

            keyboard_Anim.up_val = value

            keyboard_Anim.up_content()
        }

    }

    function close(){

        keyboard_Anim.down_content()

    }

    Keyboard_Anim{
        id: keyboard_Anim
        page_target: root_Item.page_target
        keyboard_target: keyboard_Loader
    }

    Loader{
        id: keyboard_Loader
        width: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1 * keyboard_Loader.height

        Component.onCompleted: source = number ? "qrc:/my_components/Keyboards/Keyboard_Number.qml" : "qrc:/my_components/Keyboards/Keyboard_Letter.qml"

    }
}
