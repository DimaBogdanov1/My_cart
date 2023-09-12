import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: ui.size_Keyboard_Russia * 4 + ui.basic_spacing

    property var model: [
        [ "1", "2" , "3" ],
        [ "4", "5" , "6" ],
        [ "7", "8" , "9" ],
        [ "", "0" , ""  ]
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
    Rectangle {
        id: keyboard_Rectangle
        width: parent.width
        height: parent.height
        color: Style.light_Color
        radius: ui.radius

     //   Border_Gradient{}

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
                                    isIcon: index === 3 ? (number_Row.index === 0 || number_Row.index === 1) : false
                                    source:  isIcon ?
                                                 (number_Row.index === 0 ? "qrc:/icons/" + Style.theme + "/utils/delete.svg" :
                                                                     "qrc:/icons/" + Style.theme + "/utils/arrow_right.svg") : ""
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
                            isIcon: index === 0 || index === 1
                            source:  isIcon ?
                                         (index === 0 ? "qrc:/icons/" + Style.theme + "/utils/delete.svg" :
                                                             "qrc:/icons/" + Style.theme + "/utils/arrow_right.svg") : ""
                            color: Style.primary_Color
                            bottom_button_index:  index === 0 ? 5 : index === 1 ? 3 : -1
                            enabled: isIcon
                            text: ""

                        }
                    }
                }
            }

        }
    }
}
