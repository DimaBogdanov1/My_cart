import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int block_width: 400

    Rectangle{
        width: parent.width < 1000 ? parent.width * 0.6 : 600
        height: 30 +  ui.height_Button * 4 + ui.block_height + 300 + 16 * 7 + 24
        radius: ui.radius
        anchors.centerIn: parent
        color: Style.light_Color

        Column{ // Создаём Основную Колонку
            width: 450
            height: parent.height - 24
            anchors.centerIn: parent
            spacing: ui.middle_spacing //ui.basic_spacing * 2


            Custom_Row_TextField{
                source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"
                start_Keyboard: root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                model: ListModel{

                    ListElement{
                        title: "Код дороги"
                        isLetter: false
                        maximumLength: 2
                    }

                    ListElement{
                        title: "Код направления"
                        isLetter: false
                        maximumLength: 5

                    }

                    ListElement{
                        title: "Номер пути"
                        isLetter: false
                        maximumLength: 1

                    }

                }
            }

            Custom_Row_TextField{
                id: startPoint_Row
                source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                start_Keyboard: 0
                model: ListModel{

                    ListElement{
                        title: "Километр"
                        isLetter: false
                        km: true

                    }

                    ListElement{
                        title: "Метр"
                        isLetter: false
                        meter: true

                    }

                }
            }

            Custom_Row_TextField{
                source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                start_Keyboard: 0
                model: ListModel{

                    ListElement{
                        title: "Скорость пассажирских"
                        isLetter: false
                        maximumLength: 3

                    }

                    ListElement{
                        title: "Скорость грузовых"
                        isLetter: false
                        maximumLength: 3

                    }

                }
            }

            Item{
                width: parent.width
                height: 40

                Custom_Slider{
                    width: parent.width
                    anchors.centerIn: parent

                }
            }

            Custom_Pick_Button{
                width: parent.width
                height: ui.height_Button
                model: ["Основное положение", "Дополнительное положение"]


            }

            Custom_Button{
                id: start_Button
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                text:  qsTr("Продолжить") + mytrans.emptyString
                onClicked_Signal: {



                }

            }



        }
    }

}
