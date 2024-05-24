import QtQuick 2.15
import QtQuick.Controls 2.15

import Finish_Task_Page 1.0


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

       // warning_ListModel.clear()
    }


    Finish_Task_Page{
        id: finish_Task_Page
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
                source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                property var typeCheck_Model: ["Рабочая", "Контрольная", "Дополнительная"]

                property var orientation_Model: ["Основное", "Дополнительное"]

                model: [
                    { title: "Вид проверки", combo_model: typeCheck_Model, picked_index: 0},
                    { title: "Положение тележки", combo_model: orientation_Model, picked_index: 0}
                ]

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

                header_model: [
                        { title: my_str.upNom, size: 0.35},
                        { title: my_str.putNom, size: 0.15},
                        { title: qsTr("Дистанция"), size: 0.25},
                        { title: my_str.speed, size: 0.25},
                    ]



                model: finish_Task_Page.My_Warnings_Model

                delegate: List_Row{
                    //login: _login
                    //color_value: _color_value
                  //  needHighlight: true
                    listview: warning_List_2.get_list()
                    cur: warning_List_2.currentIndex
                    width: warning_List_2.width //- ui.big_spacing
                    model: [ upNom, putNom, my_str.convertCoord(startKm, startM), speed]
                    header_model: warning_List_2.header_model

                    onClickedDelegate_Signal: {

                        toast.show(index, 3000, 1) // Показываем Тоcт

                        warning_Popup.open_Popup(finish_Task_Page.My_Warnings_Model.get(index).login,
                                                 finish_Task_Page.My_Warnings_Model.get(index).color,
                                                 finish_Task_Page.My_Warnings_Model.get(index).dateInput,
                                                 finish_Task_Page.My_Warnings_Model.get(index).dateInput,
                                                 finish_Task_Page.My_Warnings_Model.get(index).dateStart,
                                                 finish_Task_Page.My_Warnings_Model.get(index).dateEnd

                                                 )

                    }
                }


            }

            Warnings_Helps{
                id: warning_Popup
              //  login: root_Item.login
            //    color_value:  root_Item.color_value
                width: 600 //parent.width //- ui.big_spacing

                header_model: [
                        { title: my_str.user, size: 0.4},
                        { title: my_str.date_Input, size: 0.2},
                        { title: my_str.date_Start, size: 0.2},
                        { title: my_str.date_End, size: 0.2},
                    ]
            }
            List_With_Title{
                id: warning_List
                width: 1000
                title:  qsTr("Предупреждения")
                height: 300
                color: Style.light_Color

                header_model: [
                        { title: my_str.user, size: 0.14},
                        { title: my_str.upNom, size: 0.14},
                        { title: my_str.putNom, size: 0.14},
                        { title: qsTr("Начало"), size: 0.14},
                        { title: qsTr("Конец"), size: 0.14},
                        { title: my_str.speed, size: 0.14},
                        { title:  qsTr("Дата окончания"), size: 0.16}
                    ]

               // title_name_model: [ my_str.user, my_str.upNom, my_str.putNom, qsTr("Начало") , qsTr("Конец") , my_str.speed, qsTr("Дата окончания") ]
               // title_size_model: [0.14, 0.14, 0.14, 0.14, 0.14, 0.14, 0.16 ]

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
                    sizes: warning_List.header_model

                }

            }

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


    /*Connections{

       target: Warnings

       function onNewWarning_signal(login, color, upNom,  putNom, begin_Km, begin_M, end_Km, end_M, input_Date, begin_Date, end_Date, speed){

           var begin = begin_Km + my_str.km + " " + begin_M + my_str.meter

           var end = end_Km + my_str.km + " " + end_M + my_str.meter

           var speed_km = speed + my_str.km_hour


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

    }*/
}
