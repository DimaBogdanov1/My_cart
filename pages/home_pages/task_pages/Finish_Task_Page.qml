import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

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
                id: road_ComboBox
                width: parent.width
                height: ui.block_height
                source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                title: qsTr("Вид проверки") + mytrans.emptyString
                model:  [qsTr("Рабочая") + mytrans.emptyString , qsTr("Контрольная") + mytrans.emptyString , qsTr("Дополнительная") + mytrans.emptyString]

            }

            Custom_Rectangle_Label {
                needBack: false
                horizontal: Text.AlignLeft
                text: "Использовать дополнительные параметры"

            }

            CheckBox{

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
