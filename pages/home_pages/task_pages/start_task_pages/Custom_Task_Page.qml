import QtQuick 2.15
import QtQuick.Controls 2.15

import Custom_Task_Page 1.0


import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Custom_Task_Page{
        id: custom_Task_Page
    }

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
                           { title: my_str.siteID, text: custom_Task_Page.task_Passport_DB.siteId, maximumLength: ui.text_Values.siteId_textLength}
                       ]

                    onTextChanged: {

                        custom_Task_Page.task_Passport_DB.set_Custom_SiteId(text)

                    }
                }

                Custom_Row_TextField{
                    source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
                    start_Keyboard: 0 //root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                    model: [
                           { title: my_str.upNom, text: custom_Task_Page.task_Passport_DB.upNom, maximumLength: ui.text_Values.upNom_textLength},
                           { title: my_str.putNom, text: custom_Task_Page.task_Passport_DB.putNom, maximumLength: ui.text_Values.putNom_textLength}
                       ]

                    onTextChanged: {

                        switch(index_model){

                        case 0:

                            custom_Task_Page.task_Passport_DB.set_Custom_UpNom(text)

                            break

                        case 1:

                            custom_Task_Page.task_Passport_DB.set_Custom_PutNom(text)

                            break
                        }
                    }
                }

                Custom_Row_TextField{
                    id: startPoint_Row
                    source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 0

                    model: [
                           { title: my_str.km, text: custom_Task_Page.task_Passport_DB.start_Km, maximumLength: ui.text_Values.km_textLength},
                           { title: my_str.meter, text: custom_Task_Page.task_Passport_DB.start_M, maximumLength: ui.text_Values.meter_textLength}
                       ]

                    onTextChanged: {

                        switch(index_model){

                        case 0:

                            custom_Task_Page.task_Passport_DB.set_StartKm(text)

                            break

                        case 1:

                            custom_Task_Page.task_Passport_DB.set_StartM(text)

                            break
                        }
                    }
                }

                Custom_Row_TextField{
                    source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 0

                    model: [
                           { title: "Скорость пассажирских", text: custom_Task_Page.task_Passport_DB.speed_Pass},
                           { title: "Скорость грузовых", text: custom_Task_Page.task_Passport_DB.speed_Freight}
                       ]

                    onTextChanged: {

                        switch(index_model){

                        case 0:

                            custom_Task_Page.task_Passport_DB.set_Speed_Pass(text)

                            break

                        case 1:

                            custom_Task_Page.task_Passport_DB.set_Speed_Freight(text)

                            break
                        }
                    }

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
