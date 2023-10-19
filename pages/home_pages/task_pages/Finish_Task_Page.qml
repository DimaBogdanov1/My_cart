import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int picked_siteID: 0

    property int picked_upNom: 0

    property int picked_putNom: 0


    Back_Arrow{

        onClicked_Signal: {

            index_Task = 0
        }
    }

    Rectangle{
        width: 800
        height:  ui.height_Button * 3 + ui.block_height * 2 + 300 + 16 * 7  + ui.big_spacing
        radius: ui.radius
        anchors.centerIn: parent
       // anchors.centerIn: parent
        color: Style.light_Color


    Item{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Column{ // Создаём Основную Колонку
            width: 450
            height: parent.height - 24
            anchors.centerIn: parent
            spacing: ui.middle_spacing //ui.basic_spacing * 2


            Custom_Tabs{
                width: parent.width
                height: ui.height_Button
                model: ["Основное положение", "Дополнительное положение"]


            }

            Custom_Row_ComboBox{
                width: parent.width
                height: ui.block_height
                source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                title: qsTr("Вид проверки") + mytrans.emptyString
                model:  [qsTr("Рабочая") + mytrans.emptyString , qsTr("Контрольная") + mytrans.emptyString , qsTr("Дополнительная") + mytrans.emptyString]

            }


            Custom_Row_Checkbox{
                title: qsTr("Дополнительные параметры") + mytrans.emptyString
            }

            Custom_Row_Checkbox{
                title: qsTr("Предупреждение") + mytrans.emptyString
            }

            /*Rectangle{
                width: parent.width //- ui.basic_spacing / 2
                height: 80
                color: Style.background_Color
                radius: ui.radius
                clip: true

                My_List{
                   id: list
                   width: parent.width
                   height: parent.height //- title_Row.height - ui.border_Size * 2
                   model: ListModel{id: upNom_ListModel}

                }

            }*/

            /*Item{
                width: parent.width
                height: ui.block_height

                Custom_Slider{
                    width: 200
                    minimumValue: 15
                    stepSize: 15
                    value: stepSize * 5
                    maximumValue: 150
                    anchors.centerIn: parent

                }
            }*/

            Custom_Row_ComboBox{
                id: speed_ComboBox
                width: parent.width
                height: ui.block_height
                source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                title: qsTr("Скорость") + mytrans.emptyString
                property int speed: 15
              //  model:  [qsTr("Рабочая") + mytrans.emptyString , qsTr("Контрольная") + mytrans.emptyString , qsTr("Дополнительная") + mytrans.emptyString]

                onCurrentIndexChanged: {

                    speed = speed_ComboBox.model[currentIndex].split(" ")[0]

                }

                Component.onCompleted: {

                    var a = new Array

                    //a.push()
                    for(var i = speed; i < 150; i+= 15){

                        a.push(i + qsTr(" Км/ч") + mytrans.emptyString)
                    }

                    model = a
                }
            }


            Custom_Row_TextField{
                id: startPoint_Row
                source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                start_Keyboard: 300
                model: ListModel{

                    ListElement{
                        title: "Начальный километр"
                        isLetter: false
                        km: true
                    }

                    ListElement{
                        title: "Начальный метр"
                        isLetter: false
                        meter: true


                    }

                }
            }

            Custom_Row_TextField{
                id: endPoint_Row
                source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                start_Keyboard: 300
                model: ListModel{

                    ListElement{
                        title: "Конечный километр"
                        isLetter: false
                        km: true
                    }

                    ListElement{
                        title: "Конечный метр"
                        isLetter: false
                        meter: true


                    }

                }
            }


            Custom_Date_Block {
                id: date_Block
                title: qsTr("Время действия") + mytrans.emptyString
                source:  "qrc:/icons/" + Style.theme + "/utils/calendar.svg"

            }

            /*Custom_Row_TextField{
                source:  "qrc:/icons/" + Style.theme + "/utils/calendar.svg"
                start_Keyboard: 300
                model: ListModel{

                    ListElement{
                        title: "Время действия"
                        isLetter: false
                        km: true
                    }

                    ListElement{
                        title: "Дата конца"
                        isLetter: false
                        meter: true


                    }

                }
            }

            */

            Custom_Button{
                width: parent.width
                text:  qsTr("Добавить предупреждение") + mytrans.emptyString
                onClicked_Signal: {

                   // console.log("picked_siteID = "  + picked_siteID , "picked_upNom = "  + picked_upNom , "picked_putNom = "  + picked_putNom )

                   Warnings.add_Warning(picked_siteID, picked_upNom, picked_putNom, startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

                }

            }


            Custom_Button{
                id: start_Button
                width: parent.width
                text:  qsTr("Начать маршрут") + mytrans.emptyString
                onClicked_Signal: {

                    sub_index_HomePage = 2


                }

            }

        }
    }


    }

}
