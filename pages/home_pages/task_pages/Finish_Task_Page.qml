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

            /*Custom_Row_Checkbox{
                title: qsTr("Предупреждение") + mytrans.emptyString
            }*/

            List_With_Title{
                title:  qsTr("Предупреждения код направления 1 номер пути 3") + mytrans.emptyString
                height: 300
                title_name_model: [ "№", qsTr("Начало") + mytrans.emptyString, qsTr("Конец") + mytrans.emptyString, qsTr("Скорость") + mytrans.emptyString]
                title_size_model: [0.1 , 0.3, 0.3 , 0.3]
                model: [1]
            }

            /*
                             List_Row{
                                 id: title_Row2
                                 model: [ qsTr("Путь"), qsTr("Тип")]
                                 sizes: [0.3, 0.7]
                             }

                             Custom_Border{}

                             My_List{
                                id: list2
                                width: parent.width
                                height: parent.height - title_Row.height - ui.border_Size * 2
                                model: ListModel{id: putNom_ListModel}



                                delegate: List_Row{
                                    listview: list2
                                    width: list2.width
                                    model: [put, type]
                                    sizes: title_Row2.sizes
                                    cur: list2.currentIndex

                                }

                             }

              */

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


            Custom_Button{
                id: start_Button
                width: parent.width
                text:  qsTr("Начать маршрут") + mytrans.emptyString
                onClicked_Signal: {

                    sub_index_HomePage = page_Loader.open_next(2)

                //    sub_index_HomePage = 2


                }

            }

        }
    }


    }

}
