import QtQuick 2.15
import Style 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    property bool caps: true

    property var model: [
        [ "Q", "W" , "E", "R", "T", "Y", "U", "I", "O", "P"],
        [ "A", "S" , "D", "F", "G", "H", "J", "K", "L"],
        [ "Капс", "Z" , "X", "C", "V", "B", "N", "M","Дел" ]
    ]

    Column{
        width: parent.width
        height: parent.height


        Repeater{
            width: parent.width
            height: parent.height
            model: 3

            Row{
                id: letter_Row
                required property int index

                width: letter_Row.index === 1 ? 9 * ui.size_Keyboard_English : parent.width
                height: ui.size_Keyboard_Russia
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater{
                    width: parent.width
                    height: parent.height
                    model: root_Item.model[index]

                    Keyboard_Button{

                        required property string modelData

                        required property int index
                        isIcon:  letter_Row.index === 2 ? (index === 0 || index === 8) : false

                        width: isIcon ? ui.size_Keyboard_English * 1.5 : ui.size_Keyboard_English //* 1.25
                        height: ui.size_Keyboard_Russia
                        color: Style.primary_Color
                        caps: root_Item.caps
                        text: modelData

                    }
                }
            }
        }
    }
}
