import QtQuick 2.15
import Style 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    property bool caps: true

    property var model: [
        [ "Й", "Ц" , "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З" ,"Х" ],
        [ "Ф", "Ы" , "В", "А", "П", "Р", "О", "Л", "Д", "Ж" ,"Э" ],
        [ "Капс", "Я" , "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю" ,"Дел" ]
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
                width: parent.width
                height: ui.size_Keyboard_Russia

                required property int index

                Repeater{
                    width: parent.width
                    height: parent.height
                    model: root_Item.model[index]

                    Keyboard_Button{

                        required property string modelData

                        required property int index

                        width: ui.size_Keyboard_Russia //* 1.25
                        height: ui.size_Keyboard_Russia
                        isIcon:  letter_Row.index === 2 ? (index === 0 || index === 10) : false
                        bottom_button_index: isIcon ?
                                                 (index === 0 ? 4 :

                                                      index === 10 ? 5 : -1) : -1
                        source:  isIcon ?
                                     (index === 0 ? "qrc:/icons/" + Style.theme + "/utils/arrow_top.svg" :
                                                         "qrc:/icons/" + Style.theme + "/utils/delete.svg") : ""
                        color: Style.primary_Color
                        caps: root_Item.caps
                        text: modelData

                    }
                }

            }
        }


    }


}
