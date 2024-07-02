import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15

import qml.measure 1.0

import My_Sensors_Values 1.0
import Chart_Page 1.0
import Type_Sleepers 1.0
import Type_Picket_Position 1.0
import SubTypes_Line 1.0
import Type_Trains 1.0
import Top_Bar_Actions 1.0

import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int zoom_Chart: 0

    property real tmp_offset: 5.7

    property real y_0: 0

    signal back_Page_Signal


    Chart_Page{
        id: charts_Page

        onPlayChart_Changed: {

            chart_Block_Page.update_Play_Button()

        }

        onChart_Km_Values_Changed: {

            chart_Block_Page.draw_New_Km_Block()
        }

        onNew_Riht_Signal: {

            chart_Block_Page.draw_One_Riht()

        }

        onNew_Area_Signal: {

            chart_Block_Page.draw_Area(index)

        }

        onNew_Moving_Signal: {

            chart_Block_Page.change_Moving(value)

        }

        onNew_BackLine_Signal: {

            chart_Block_Page.add_new_Line(index, SubTypes_Line.Back_Correct_Line, index_list)

        }

        onNew_Line_Signal: {

            chart_Block_Page.add_new_Line(index, subType, index_list)

        }


        onNew_SpeedLine_Signal: {

            chart_Block_Page.draw_New_SpeedLine(type)

        }

        onRemove_Fisrst_Km_Signal: {

            chart_Block_Page.remove_first_Km()

        }

        onGrid_View_Changed: {

            chart_Block_Page.change_grid_View(value)

        }

        onMarkTable_View_Changed: {

            chart_Block_Page.change_Table_Position(value)

        }

        onAdditionalMeasure_View_Changed: {

            chart_Block_Page.change_additionalMeasure_View(value)

        }

        onOpen_Dialog_Signal: {

            dialog.open()
        }

    }


    My_Sensors_Values{
        id: sensorsVal
    }


    Chart_Block_Page{
        id: chart_Block_Page
        width: parent.width
        height: parent.height
        speed: charts_Page.moving_Values.speed
        charge_percent:  sensorsVal.charge_percent
        isPlay_Chart: charts_Page.moving_Values.isPlay_Chart
        map_top_bar_model: [charts_Page.map_top_Bars_Models.style_Model]
        top_bar_title: my_str.page_Names.chart_Page
        top_bar_needNotification: true
        top_bar_mainModel: [charts_Page.top_Bars_Models.chartView_Model, charts_Page.top_Bars_Models.chartMain_Model]
        top_bar_model: [

            {icon_path: "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg",
                typeAction: Top_Bar_Actions.Open_Popup_Action,
                source_Popup: "qrc:/my_components/Popups/Objects/Objects_Popup.qml"},

            {icon_path: "qrc:/my_components/icons/" + Style.theme + "/top_bar/zoom_in.svg",
                model_Menu: [charts_Page.top_Bars_Models.zoom_Model] }


        ]

        charts_Page: charts_Page


        onBack_Click_Signal: {

            back_Page_Signal()

            sub_index_HomePage = page_Loader.open_back(sub_index_HomePage, 1)

        }
    }

    Content_Dialog{
        id:dialog
        text: qsTr("Вы действительно хотите завершить маршрут?")

        onAgree_click: {


            toast.show("Завершаем маршрут!", 3000, 1) // Показываем Тоcт

        }

    }


    Connections{
        target: Mqqt_Client

        function onNewButtonClick_signal(num_Button){

            switch(num_Button){

            case 0:

                chart_Block_Page.open_object_Popup()


                break

            case 1:

                charts_Page.moving_Values.setPlay(true)

                break

            case 2:

                toast.show("Нажата кнопка номер " + num_Button, 3000, 1)

                break
            }

        }


        function onNewNotification_signal(message, status){

            if(status === Status_Indicator.Negative_Status){

               notification_Element.changeStatus(status)
            }
            else{

                if(status === Status_Indicator.Warning_Status){

                    notification_Element.changeStatus(status)
                }

            }


            push_Notification.openPush(message, status)

            Notifications_Model.addNotification(message, status)

            notification_Element.count = Notifications_Model.rowCount()

            //notidication_ListModel.append({"text_notification": message, "status_notification": status })
        }
    }



    Column{
        width:1000
        height: 48 * 2
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.bottom: parent.bottom


        Row{
            width:parent.width
            height: 48

            Button{
                width: 100
                height: parent.height
                text:  qsTr("вниз")
                onClicked: {

                    if(!chart_anim.checkScroll){

                        chart_anim.create_Scroll_on_Pause(chart_Rectangle.height / 10, true)

                    }
                    else{

                        toast.show("график не на паузе!!!", 3000, 1)
                    }


                }

            }

            Button{
                width: 100
                height: parent.height
                text:  qsTr("вверх")
                onClicked: {

                    if(!chart_anim.checkScroll){

                        chart_anim.create_Scroll_on_Pause(chart_Rectangle.height / 10, false)

                    }
                    else{

                        toast.show("график не на паузе!!!", 3000, 1)

                    }


                }

            }

            Button{
                id: coun_y_Btn
                width: 100
                height: parent.height
                onClicked: {


                }

            }

            Button{
                width: 100
                height: parent.height
                text:  qsTr("Drop line")
                onClicked: {

                   //chartView.drop_value += measure_Logic.dropLine(40)

                    charts_Page.remove_First_Km()


                   // Chart_Work.dropLine(40)
                }

            }

            Button{
                width: 100
                height: parent.height
                text:  qsTr("Доп. параметры")
                property bool check: false

                onClicked: {

                    if(!check){

                        chartView.scrollRight(allMeasure_Row.width)

                        animMeasure.to = -1 * allMeasure_Row.width - ui.basic_spacing

                        check = true

                    }
                    else{

                        chartView.scrollLeft(allMeasure_Row.width)

                        animMeasure.to = 0

                        check = false

                    }

                    animMeasure.stop()

                    animMeasure.start()

                     //level_MeasureLines.add_point_border()

                }


            }

            Button{
                width: 100
                height: parent.height
                text:  qsTr("test")
                onClicked: {

                   charts_Page.tmp_func()

                   // Chart_Work.dropLine(40)
                }

            }


            Button{
                width: 100
                height: parent.height
                text:  qsTr("Reset odometer")
                onClicked: {

                   Mqqt_Client.test_slot()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Километр 2")

                property bool check: false

                onClicked: {

                    charts_Page.set_New_Km("38", 320, Type_Sleepers.Reinforced_Concrete, Type_Picket_Position.Pickets_Ascending)


                }


            }

            Button{
                width: 100
                height: parent.height
                text:  qsTr("Новая скорость")

                onClicked: {

                    charts_Page.set_New_Speed(Type_Trains.Pass_Train, 120)


                }


            }


            Button{
                width: 100
                height: parent.height
                text:  qsTr("pdf из файла")

                onClicked: {

                    charts_Page.add_Pdf_Info()


                }


            }


        }

        Row{

             width:parent.width
             height: 48


             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("csv")
                 onClicked: Chart_Work.openCSV()

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("Уведомление")
                 onClicked: {

                    // sample_MeasureLines.add_area(10, 1, 20, 5)

                   //  push_Notification.open()

                     //push_Notification.openPush("sdsdsd", 2)

                     //Notifications_Model.addNotification("sdsdsd", 2)

                     Notification_Page.add_Notification("Не работает левый лазер!", 2)

                  //   chartView.zoomIn(Qt.rect(0, 0, charts_Item.width, charts_Item.height))

                //     chartView.zoomIn(Qt.rect(0, 0, charts_Item.width, 300))

                     //chartView.zoom(2)

                 }


             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("Пауза для скрола")

                 property bool checkButton: true


                 onClicked: {



                     chart_anim.change_Pause(checkButton, y_0)

                    // chartView.zoomReset()
                     //main_ChartView.zoom(1)

                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("добавить")
                 onClicked: {

                     level_MeasureLines.add_point_border()

                    // applicationWindow.flipped = false

                    // chartView.scrollLeft(100)

                 }

             }


             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("вниз")
                 onClicked: {

                    // chart_anim.create_Main_Scroll(chart_Rectangle.height / 10, false)

                     chart_Block_Page.create_Main_Scroll(30, false)

                    // console.log("chart height = " + charts_Item.height)

                     //chartView.scrollDown(100)

                     //measure_Km.update_Pickets(100)

                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("вверх")
                 onClicked: {


                     // Пропорция такая 20 - 446


                     //chart_anim.create_Main_Scroll(30, false)

                    // chart_anim.create_Main_Scroll(30, true)

                     chart_Block_Page.create_Main_Scroll(30, true)


                     //chartView.scrollDown(charts_Item.height / 10)
                    // measure_Km.updatePointPosition();


                    // chart_anim.create_Main_Scroll(charts_Item.height / 20, false)


                    // chartView.scrollUp(100)

                    // measure_Km.update_Pickets(-100)

                 }

             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("анимация")

                 property bool check: false

                 onClicked: {

                     if(!check){

                         check = true

                       //  km_Tables.open()

                     }
                     else{

                         check = false

                       //  km_Tables.close()


                     }

                     chart_Block_Page.change_Table_Position(check)

                      //level_MeasureLines.add_point_border()

                 }


             }


             Button{
                 width: 200
                 height: parent.height
                 text:  qsTr("Открыть файл")

                 property bool check: false

                 onClicked: {

                     charts_Page.open_file()

                 }


             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("Зоны")

                 property bool check: false

                 onClicked: {

                     charts_Page.set_New_Area()


                 }


             }

             Button{
                 width: 100
                 height: parent.height
                 text:  qsTr("линия из бд")

                 onClicked: {

                     charts_Page.get_DB_Line()


                 }


             }



         }

    }


}


