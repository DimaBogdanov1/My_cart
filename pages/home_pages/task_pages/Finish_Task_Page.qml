import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0

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
        width: ui.width_conetent_halfPage //900 //800
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
              //  title: qsTr("Дополнительные параметры")
            //}

            /*Custom_Row_Checkbox{
                title: qsTr("Предупреждение")
            }*/

            List_With_Title{
                id: warning_List_2
                title:  qsTr("Предупреждения")
                width: parent.width // 2
                height: 300
                color: Style.light_Color
                title_name_model: [ str.upNom, str.putNom, qsTr("Дистанция") , str.speed]
                title_size_model: [0.35, 0.15, 0.25, 0.25 ]

                onClickedDelegate_Signal: {

                    toast.show(index, 3000, 1) // Показываем Тоcт

                    warning_Popup.open_Popup(warning_ListModel_2.get(index)._login,
                                             warning_ListModel_2.get(index)._color_value,
                                             warning_ListModel_2.get(index).date_input,
                                             warning_ListModel_2.get(index).date_begin,
                                             warning_ListModel_2.get(index).date_end)

                }

                model: ListModel{
                    id: warning_ListModel_2

                    ListElement{
                        _login:"Dima Bogdanov"
                        _color_value: 4
                        upNom: 1
                        putNom: 1
                        date_input: "12.03.29"
                        date_begin: "12.03.29"
                        date_end: "12.03.29"
                        begin: "5 км 130 м"
                        end: "6 км 540 м"
                        speed: "90 км/ч"

                    }

                    ListElement{
                        _login: "Artem Ivanov"
                        _color_value: 2
                        upNom: 1
                        putNom: 1
                        date_input: "12.03.29"
                        date_begin: "12.03.29"
                        date_end: "12.03.29"
                        begin: "5 км 130 м"
                        end: "6 км 540 м"
                        speed: "90 км/ч"
                    }
                }

                delegate: List_Row{
                    //login: _login
                    //color_value: _color_value
                  //  needHighlight: true
                    listview: warning_List_2.get_list()
                    cur: warning_List_2.currentIndex
                    width: warning_List_2.width //- ui.big_spacing
                    model: [ upNom, putNom, begin, speed]
                    sizes: warning_List_2.title_size_model
                }


            }

            Warnings_Helps{
                id: warning_Popup
              //  login: root_Item.login
            //    color_value:  root_Item.color_value
                width: 600 //parent.width //- ui.big_spacing
                title_name_model:  [ str.user, str.data_Input, str.data_Start, str.data_End]
               title_size_model: [0.4, 0.2, 0.2, 0.2 ]
            }
            List_With_Title{
                id: warning_List
                width: 1000
                title:  qsTr("Предупреждения")
                height: 300
                color: Style.light_Color
                title_name_model: [ str.user, str.upNom, str.putNom, qsTr("Начало") , qsTr("Конец") , str.speed, qsTr("Дата окончания") ]
                title_size_model: [0.14, 0.14, 0.14, 0.14, 0.14, 0.14, 0.16 ]

                model: ListModel{
                    id: warning_ListModel

                    ListElement{
                        _login:"Dima Bogdanov"
                        _color_value: 4
                        upNom: 1
                        putNom: 1
                        date_input: "12.03.29"
                        date_begin: "12.03.29"
                        date_end: "12.03.29"
                        begin: "5 км 130 м - 6 км 540 м"
                        end: "6 км 540 м"
                        speed: "90 км/ч"

                    }

                    ListElement{
                        _login: "Artem Ivanov"
                        _color_value: 2
                        upNom: 1
                        putNom: 1
                        date_input: "12.03.29"
                        date_begin: "12.03.29"
                        date_end: "12.03.29"
                        begin: "5 км 130 м"
                        end: "6 км 540 м"
                        speed: "90 км/ч"
                    }
                }

                delegate: Warning_Delegate{
                    login: _login
                    color_value: _color_value
                    listview: warning_List.get_list()
                    width: warning_List.width //- ui.big_spacing
                    model: [ upNom, putNom, begin, end, speed, date_end]
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
                text:  qsTr("Начать маршрут")
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

       function onNewWarning_signal(login, color, upNom,  putNom, begin_Km, begin_M, end_Km, end_M, input_Date, begin_Date, end_Date, speed){

           var begin = begin_Km + str.km + " " + begin_M + str.meter

           var end = end_Km + str.km + " " + end_M + str.meter

           var speed_km = speed + str.km_hour


           warning_ListModel.append({   "_login": login,
                                        "_color_value": color,
                                        "upNom": upNom,
                                        "putNom": putNom,
                                        "date_input": input_Date,
                                        "date_begin": begin_Date,
                                        "date_end": end_Date,
                                        "begin": begin,
                                        "end": end,
                                        "speed": speed_km,
                                        "date": end_Date})

          // console.log(speed)

       }

    }
}
