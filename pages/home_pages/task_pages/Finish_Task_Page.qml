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

    function clear(){

        warning_ListModel.clear()
    }

    Rectangle{
        width: 1000 //800
        height:  ui.height_Button * 3 + ui.block_height * 2 + 300 + 16 * 7  + ui.big_spacing
        radius: ui.radius
        anchors.centerIn: parent
       // anchors.centerIn: parent
        color: Style.background_Color


        Item{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Column{ // Создаём Основную Колонку
            width: parent.width - ui.big_spacing
            height: parent.height - 24
            anchors.centerIn: parent
            spacing: ui.middle_spacing //ui.basic_spacing * 2


           /* Custom_Tabs{
                width: parent.width
                height: ui.height_Button
                model: ["Основное положение", "Дополнительное положение"]


            }*/

            Custom_Row_ComboBox{
                width: parent.width
                height: ui.block_height
                source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                model:ListModel {

                    ListElement {
                        title: "Вид проверки"
                        values: [
                            ListElement { value: "Рабочая" },
                            ListElement { value: "Контрольная" },
                            ListElement { value: "Дополнительная" }
                            ]

                    }

                    ListElement {
                        title: "Положение тележки"
                        values: [
                            ListElement { value: "Основное" },
                            ListElement { value: "Дополнительное" }
                            ]

                    }

                }

            }

            //Custom_Row_Checkbox{
              //  title: qsTr("Дополнительные параметры") + mytrans.emptyString
            //}

            /*Custom_Row_Checkbox{
                title: qsTr("Предупреждение") + mytrans.emptyString
            }*/

            List_With_Title{
                id: warning_List
                title:  qsTr("Предупреждения") + mytrans.emptyString
                height: 300
                color: Style.light_Color
                title_name_model: [ str.user, str.upNom, str.putNom, qsTr("Начало") + mytrans.emptyString, qsTr("Конец") + mytrans.emptyString, str.speed, qsTr("Дата окончания") + mytrans.emptyString]
                title_size_model: [0.14, 0.14, 0.14, 0.14, 0.14, 0.14, 0.16 ]

                model: ListModel{
                    id: warning_ListModel

                    ListElement{
                        _login:"Dima Bogdanov"
                        _color_value: 4
                        upNom: 1
                        putNom: 1
                        begin: "5 км 130 м"
                        end: "6 км 540 м"
                        speed: "90 км/ч"
                        date: "13.04.2023"

                    }

                    ListElement{
                        _login: "Artem Ivanov"
                        _color_value: 2
                        upNom: 1
                        putNom: 1
                        begin: "5 км 130 м"
                        end: "6 км 540 м"
                        speed: "90 км/ч"
                        date: "13.04.2023"

                    }
                }

                delegate: Warning_Delegate{
                    login: _login
                    color_value: _color_value
                    width: warning_List.width //- ui.big_spacing
                    model: [ upNom, putNom, begin, end, speed, date]
                    sizes: warning_List.title_size_model
                }

               /* delegate: List_Row{
                    listview: warning_List.get_list()
                    width: warning_List.width //- ui.big_spacing
                    model: [put, begin, end, speed]
                    sizes: warning_List.title_size_model
                    cur: listview.currentIndex

                }*/


               /* delegate: Row{
                    Loader {
                            sourceComponent: warning_List.internalDelegate
                          }

                }

                internalDelegate:  List_Row{
                    width: warning_List.width
                    model: [code, name]
                    sizes: warning_List.title_size_model
                    //cur: list.currentIndex

                } */



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
                width: parent.width / 2
                anchors.horizontalCenter: parent.horizontalCenter
                text:  qsTr("Начать маршрут") + mytrans.emptyString
                onClicked_Signal: {

                    sub_index_HomePage = page_Loader.open_next(2)

                //    sub_index_HomePage = 2


                }

            }

        }
    }


    }


    Connections{

       target: Warnings

       function onNewWarning_signal(login, color, upNom,  putNom, begin_Km, begin_M, end_Km, end_M, begin_Date, end_Date, speed){

           var begin = begin_Km + str.km + " " + begin_M + str.meter

           var end = end_Km + str.km + " " + end_M + str.meter

           var speed_km = speed + str.km_hour


           warning_ListModel.append({"_login": login, "_color_value": color, "upNom": upNom, "putNom": putNom, "begin": begin, "end": end, "speed": speed_km, "date": end_Date})

          // console.log(speed)

       }

    }
}
