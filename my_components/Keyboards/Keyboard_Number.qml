import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: ui.size_Keyboard_Russia * 4 + ui.basic_spacing

    readonly property var model: [
        [ "1", "2" , "3" ],
        [ "4", "5" , "6" ],
        [ "7", "8" , "9" ],
        [ "", "0" , ""  ]
    ]

    readonly property var icons_keyboard: [

        ["qrc:/icons/" + Style.theme + "/utils/delete.svg", 5],
        ["qrc:/icons/" + Style.theme + "/utils/arrow_right.svg", 3],
        ["qrc:/icons/" + Style.theme + "/utils/arrow_right.svg", 6],
        ["qrc:/icons/" + Style.theme + "/utils/arrow_right.svg", 7]

    ]


    Keyboard_Logic{
        id: keyboard_Logic
        isNumber_Keyboard: true

        onValueChanged: {

            if(number){

                //root_Item.value = parseInt(value)

            }

            //root_Item.value = value

            //toast.show(root_Item.value.toString(), 3000, 1)

        }
    }

    Item{
        width:  ui.size_Keyboard_Russia * 4 * 1.25 + ui.basic_spacing
        height: parent.height - ui.basic_spacing
       // color: "blue"
        anchors.centerIn: parent

        Row{
            width: parent.width - ui.basic_spacing
            height: parent.height
            anchors.centerIn: parent

            Column{
                width: parent.width * 0.75
                height: parent.height

                Repeater{
                    width: parent.width
                    height: parent.height
                    model: 4

                    Row{
                        id: number_Row
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

                                width: parent.width / 3
                                height: ui.size_Keyboard_Russia

                                color: Style.primary_Color
                                enabled: modelData != ""
                                text: modelData

                            }
                        }

                    }

                }

            }

            Column{
                width: parent.width * 0.25
                height: parent.height

                Repeater{
                    width: parent.width
                    height: parent.height
                    model: 4

                    Keyboard_Button{

                        required property int index

                        width: parent.width
                        height: ui.size_Keyboard_Russia
                        isIcon: full_number_keyboard ? true: index === 0 || index === 1
                        source:  isIcon ? icons_keyboard[index][0] : ""

                        color: Style.primary_Color
                        bottom_button_index: isIcon ? icons_keyboard[index][1] : -1 // index === 0 ? 5 : index === 1 ? 3 : full_number_keyboard ? 6 : -1
                        enabled: isIcon
                        text: ""

                    }
                }
            }
        }

    }

}
