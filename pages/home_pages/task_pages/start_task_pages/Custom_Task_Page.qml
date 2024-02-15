import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0

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
            color: Style.background_Color //Style.light_Color

            Column{ // Создаём Основную Колонку
                width: ui.width_conetent_halfPage
                height: parent.height - 24
                anchors.centerIn: parent
                spacing: ui.middle_spacing //ui.basic_spacing * 2


                Custom_Row_TextField{
                    source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
                    start_Keyboard: 0//root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                    model: [
                           { title: my_str.siteID, text: "", maximumLength: ui.siteId_textLength}
                       ]
                }

                Custom_Row_TextField{
                    source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
                    start_Keyboard: 0 //root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                    model: [
                           { title: my_str.upNom, text: "", maximumLength: ui.upNom_textLength},
                           { title: my_str.putNom, text: "", maximumLength: ui.putNom_textLength}
                       ]

                }

                Custom_Row_TextField{
                    id: startPoint_Row
                    source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 0

                    model: [
                           { title: my_str.km, text: "", maximumLength: ui.km_textLength},
                           { title: my_str.meter, text: "", maximumLength: ui.meter_textLength}
                       ]
                }

                Custom_Row_TextField{
                    source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 0

                    model: [
                           { title: "Скорость пассажирских", text: ""},
                           { title: "Скорость грузовых", text: ""}
                       ]

                }

                Custom_Row_ComboBox{
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                    property var width_TrackModel: [1520, 1524, 1435, 1680]

                    model: [
                        { title: my_str.widthTrack, combo_model: width_TrackModel, picked_index: 0}
                    ]


                }

                Custom_Row_ComboBox{
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                    property var sleepersModel: ["После 1996 г.", "До 1996 г."]

                    model: [
                        { title: "Виды шпал", combo_model: sleepersModel, picked_index: 0}
                    ]

                }

                Custom_Button{
                    id: start_Button
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("Продолжить")
                    onClicked_Signal: {



                    }

                }



            }
        }

        Rectangle{
            width: parent.width / 2
            height: parent.height
            radius: ui.radius
            color: Style.light_Color



        }

    }


}
