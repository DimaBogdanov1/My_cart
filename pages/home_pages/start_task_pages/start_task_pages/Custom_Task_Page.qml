import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Row{
        width: parent.width
        height: parent.height

        Rectangle{
            width: parent.width / 2
            height: parent.height
            radius: ui.radius
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
                    }
                }

                Custom_Row_TextField{
                    source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"
                    start_Keyboard: root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                    model: ListModel{

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


                Custom_Row_ComboBox{
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                    title: qsTr("Ширина колеи") + mytrans.emptyString
                    model: ["1520 мм", "1524 мм", "1435 мм", "1680 мм"]

                }

                Custom_Row_ComboBox{
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                    title: qsTr("Виды шпал") + mytrans.emptyString
                    model: [qsTr("После 1996 г.") + mytrans.emptyString ,qsTr("До 1996 г.") + mytrans.emptyString]

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


}
