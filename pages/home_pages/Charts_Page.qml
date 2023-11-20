import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15
import MqttClient 1.0

import qml.measure 1.0
import Style 1.0
import MyLang 1.0
import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int zoom_Chart: 0

    property int max: 100

    property real tmp_offset: 5.7

    property int start_scroll: 90 // 80 // 100

    property real y_0: 0

    Column{
      width: parent.width
      height: parent.height

        Custom_TopBar{
            id: topBar
            width: parent.width
            height: ui.toolBar_Size //ui.iconBlock_topBar_Size + ui.top_bar_margin
            focus: true
        }

        Rectangle {
            width: parent.width
            height: parent.height - ui.toolBar_Size
            clip: true
            color: Style.background_Color

            property int zoom_Chart: 0

            Rectangle{
                width: parent.width
                height: parent.height //- ui.toolBar_Size
               // radius: ui.radius
              //  anchors.bottom: parent.bottom
                color: Style.light_Color
                layer.enabled: true
                layer.effect: Mask_Rectangle{target: parent; botom_rec: true}

                Column {
                    id: main_Column
                    width: parent.width - ui.big_spacing
                    height: parent.height - ui.big_spacing
                    anchors.centerIn: parent
                    spacing: ui.basic_spacing /// 2 /// 2

                    Item{ // Общая Информация
                        id: task_Item
                        width: parent.width
                        height:  40 //96

                        Row{
                            id: row
                            width: parent.width
                            height: parent.height
                            spacing: ui.basic_spacing / 2

                            readonly property real offset: ui.basic_spacing * 2 / 5

                            Rectangle{ // Общая Информация
                                width: parent.width * 0.28 - row.offset
                                radius: ui.radius
                                height:  parent.height
                                color: Style.background_Color

                                Row{
                                    width: parent.width
                                    height: parent.height

                                    Custom_Rectangle_Label {
                                        id: upNom_Label
                                        width: parent.width * 0.3
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("11233") + mytrans.emptyString

                                    }

                                    Custom_Rectangle_Label {
                                        id: direction_Label
                                        width: parent.width * 0.4
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("Москва-Рига") + mytrans.emptyString

                                    }



                                    Custom_Rectangle_Label {
                                        id: putNom_Label
                                        width: parent.width * 0.3
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("Путь: 1") + mytrans.emptyString

                                    }
                                }

                            }

                            Rectangle{
                                width: parent.width * 0.28 - row.offset
                                radius: ui.radius
                                height:  parent.height
                                color: Style.background_Color

                                Row{
                                    width: parent.width
                                    height: parent.height

                                    Custom_Rectangle_Label {
                                        width: parent.width * 0.25
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("ПЧ: 1") + mytrans.emptyString

                                    }

                                    Custom_Rectangle_Label {
                                        width: parent.width * 0.25
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("ПЧУ: 1") + mytrans.emptyString

                                    }

                                    Custom_Rectangle_Label {
                                        width: parent.width * 0.25
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("ПД: 1") + mytrans.emptyString

                                    }

                                    Custom_Rectangle_Label {
                                        width: parent.width * 0.25
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("ПДБ: 1") + mytrans.emptyString

                                    }
                                }

                            }

                            Custom_Text_Arrow{
                               width: parent.width * 0.28 - row.offset
                               height: ui.height_Button
                               enabled: false
                               text_1:  qsTr("Станиция 1") + mytrans.emptyString
                               text_2:  qsTr("Станиция 2") + mytrans.emptyString

                            }

                            /*Rectangle{ // Общая Информация
                                width: parent.width - 200 -  ui.basic_spacing
                                radius: ui.radius
                                height:  parent.height
                                color: Style.background_Color

                                Row{
                                    width: parent.width
                                    height: parent.height


                                    Row{
                                        width: parent.width * 0.3
                                        height: parent.height

                                        Custom_Rectangle_Label {
                                            width: parent.width * 0.25
                                            height: parent.height
                                            needBack: false
                                            text: qsTr("ПЧ: 1") + mytrans.emptyString

                                        }

                                        Custom_Rectangle_Label {
                                            width: parent.width * 0.25
                                            height: parent.height
                                            needBack: false
                                            text: qsTr("ПЧУ: 1") + mytrans.emptyString

                                        }

                                        Custom_Rectangle_Label {
                                            width: parent.width * 0.25
                                            height: parent.height
                                            needBack: false
                                            text: qsTr("ПД: 1") + mytrans.emptyString

                                        }

                                        Custom_Rectangle_Label {
                                            width: parent.width * 0.25
                                            height: parent.height
                                            needBack: false
                                            text: qsTr("ПДБ: 1") + mytrans.emptyString

                                        }
                                    }



                                    Custom_Text_Arrow{
                                       width: parent.width * 0.4 //- ui.basic_spacing
                                       height: ui.height_Button
                                       enabled: false
                                       text_1:  qsTr("Станиция 1") + mytrans.emptyString
                                       text_2:  qsTr("Станиция 2") + mytrans.emptyString

                                    }
                                }
                            }

                            */

                            Custom_Rectangle_Label {
                                width: parent.width * 0.08 - row.offset
                                height: parent.height
                                color: Style.background_Color
                                property real speed: 6

                                text: speed + qsTr(" км/ч") + mytrans.emptyString

                            }

                            Rectangle{
                                width: parent.width * 0.08 - row.offset
                                radius: ui.radius
                                height:  parent.height
                                color: Style.background_Color

                                Custom_Text_With_Icon{
                                  //  width: parent.width
                                    height: parent.height
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    icon_size: 24
                                    source: "qrc:/icons/"+ Style.theme + "/utils/battery.svg"
                                    text: "100%"
                                }
                            }

                        }

                    }

                    Item{ // Грaфик
                        id: charts_Item
                         width: parent.width
                         height:  parent.height - bootom_Row.height - task_Item.height -  ui.basic_spacing * 2
                       //radius: ui.radius
                        // color: Style.secondaryAccent_Color


                         Item{
                            width: parent.width
                            height: parent.height
                           // spacing: ui.basic_spacing / 2

                            Column{
                                id: charts_Column
                                width: parent.width //- viser_Rectangle.width - ui.basic_spacing / 2
                                height: parent.height
                                anchors.left: parent.left
                                spacing: ui.basic_spacing / 2

                                Item{
                                   width: parent.width
                                   height:  48

                                   Row{
                                     id: measure_Row
                                     width: parent.width
                                     height:  parent.height
                                     spacing: ui.basic_spacing / 2
                                     property real spacing_value: ui.basic_spacing * 3.5 / 8

                                     Rectangle{ // Километр
                                          id: km_MeasureBlock
                                          width: parent.width * 0.055 - measure_Row.spacing_value
                                          height:  parent.height
                                          radius: ui.radius
                                          color: Style.background_Color

                                          Custom_Label{
                                              horizontalAlignment: Text.AlignHCenter
                                              text: qsTr("255.50") + mytrans.emptyString

                                          }
                                     }


                                     Measure_Block {
                                         id: speed_MeasureBlock
                                         width:  parent.width * 0.124 -  measure_Row.spacing_value
                                         height:  parent.height
                                         reverse: true
                                         measure_model: [0, 60, 100, 250]
                                         no_values_model: [0, 250]
                                         x_start: 7.2 //- tmp_offset // 1.2
                                         x_finish: 16.8 // - tmp_offset // 10.8
                                         value: 10
                                         title: str.speed

                                         Component.onCompleted: {

                                           //  speed_MeasureLines.create_Line(x_finish, 0,x_finish, chartView.y_finish, "red", Qt.DotLine, "name") // Создаём Границу

                                             speed_MeasureLines.create_BorderSeries()
                                         }
                                     }

                                     Measure_Block {
                                         id: level_MeasureBlock
                                         width: parent.width * 0.165 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [-75, -35, -6, 0, 6, 35, 75]
                                         no_values_model: [-6, 6]
                                         x_start: 19.2 //- 4.8
                                         x_finish: 33.3 //- 4.8
                                         value: 1
                                         title: str.level

                                         Component.onCompleted: {

                                             level_MeasureLines.create_BorderSeries()
                                         }

                                     }

                                     Measure_Block {
                                         id: riht_Left_MeasureBlock
                                         width:  parent.width * 0.124 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [-30, 0, 3, 30]
                                         no_values_model: [ 3, 30]
                                         no_x_index: 3
                                         x_start: 35.8 //- 3.95
                                         x_finish: 45.5  //- 3.95 //41.355 // x_start + 0.17 * (level_MeasureBlock.x_finish - level_MeasureBlock.x_start) / 0.2
                                         value: 1
                                         title: str.riht_Left

                                         Component.onCompleted: {

                                             riht_Left_MeasureLines.create_BorderSeries()
                                         }
                                     }

                                     Measure_Block {
                                         id: riht_Right_MeasureBlock
                                         width:  parent.width * 0.124 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [-30, -3, 0, 30]
                                         no_values_model: [-30, -3]
                                         no_x_index: 0
                                         x_start: 47.9 //- 2.95
                                         x_finish: x_start + riht_Left_MeasureBlock.x_finish - riht_Left_MeasureBlock.x_start
                                         value: 1
                                         title: str.riht_Right

                                         Component.onCompleted: {

                                             riht_Right_MeasureLines.create_BorderSeries()

                                         }
                                     }

                                     Measure_Block {
                                         id: sample_MeasureBlock
                                         width:  parent.width * 0.16 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [1510, 1512, 1520, 1538, 1546]
                                         no_values_model: [1510]
                                         x_start: 60.8 //- 2.3
                                         x_finish: 73 //- 2.3
                                         value: 1
                                         title: str.sample

                                         Component.onCompleted: {

                                             tmp_offset = tmp_offset + 10

                                             sample_MeasureLines.create_BorderSeries()

                                         }
                                     }

                                     Measure_Block {
                                         id: down_Left_MeasureBlock
                                         width:  parent.width * 0.124 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [-10, 0, 10]
                                         x_start: 75.8 //- 1
                                         x_finish: 85.8 //- 1
                                         value: 8
                                         title: str.down_Left

                                         Component.onCompleted: {

                                             down_Left_MeasureLines.create_BorderSeries()

                                         }
                                     }

                                     Measure_Block {
                                         id: down_Right_MeasureBlock
                                         width:  parent.width * 0.124 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [-10, 0, 10]
                                         x_start: 88.2 //- 0.5
                                         x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                         value: 10
                                         title: str.down_Right

                                         Component.onCompleted: {

                                             down_Right_MeasureLines.create_BorderSeries()

                                         }
                                     }

                                   }

                                }

                                Item{
                                   width: parent.width
                                   height:  parent.height - 48 - ui.basic_spacing / 2

                                   Rectangle{
                                       id: chart_Rectangle
                                       width: parent.width //- viser_Rectangle.width - ui.basic_spacing / 2
                                       height:  parent.height
                                       anchors.left: parent.left
                                       color: Style.light_Color //"transparent"
                                       radius: ui.radius
                                       layer.enabled: true
                                       layer.effect: Mask_Rectangle{target: parent}

                                       Row{
                                           width: parent.width
                                           height: parent.height

                                           Item{
                                                width: parent.width //- km_Item.width
                                                height: parent.height
                                                clip: true

                                                ChartView {
                                                   id: chartView
                                                   x: -56
                                                   y: -34 // -41
                                                   width: parent.width + 100
                                                   height: parent.height + 75//96 //95
                                                   dropShadowEnabled: false
                                                   antialiasing: true
                                                   backgroundColor:  Style.background_Color //"red"//Style.background_Color
                                                   legend.visible:false
                                                   plotAreaColor: Style.background_Color

                                                   property int y_finish: 40

                                                   Charts_Anim{
                                                       id: chart_anim
                                                   }


                                                      onWidthChanged: measure_Km.updatePointPosition();
                                                      onHeightChanged: measure_Km.updatePointPosition();



                                                   Measure_Km{
                                                       id: measure_Km

                                                       Component.onCompleted: {

                                                          // km_ChartView.setAxisY(yKm_ValueAxis)

                                                           create_RailsLine()

                                                        //   create_KmLine(20)
                                                       }

                                                   }

                                                   Measure_Lines{  // Скорость
                                                     id: speed_MeasureLines
                                                     line_name: 6
                                                     model: speed_MeasureBlock.x_values_model
                                                     x_start: speed_MeasureBlock.x_start
                                                     x_finish: speed_MeasureBlock.x_finish

                                                   }


                                                   Measure_Lines{  // Уровень
                                                     id: level_MeasureLines
                                                     line_name: 0
                                                     model: level_MeasureBlock.x_values_model
                                                     x_start: level_MeasureBlock.x_start
                                                     x_finish: level_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{ // Рихтовка левая
                                                     id: riht_Left_MeasureLines
                                                     line_name: 1
                                                     model: riht_Left_MeasureBlock.x_values_model
                                                     no_values_model: [30]
                                                     x_start: riht_Left_MeasureBlock.x_start
                                                     x_finish: riht_Left_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{  // Рихтовка правая
                                                     id: riht_Right_MeasureLines
                                                     line_name: 2
                                                     model: riht_Right_MeasureBlock.x_values_model
                                                     x_start: riht_Right_MeasureBlock.x_start
                                                     x_finish: riht_Right_MeasureBlock.x_finish
                                                   }

                                                   Measure_Lines{ // Шаблон
                                                     id: sample_MeasureLines
                                                     line_name: 3
                                                     model: sample_MeasureBlock.x_values_model
                                                     x_start: sample_MeasureBlock.x_start
                                                     x_finish: sample_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{ // Просадка левая
                                                     id: down_Left_MeasureLines
                                                     line_name: 4
                                                     model: down_Left_MeasureBlock.x_values_model
                                                     x_start: down_Left_MeasureBlock.x_start
                                                     x_finish: down_Left_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{ // Просадка правая
                                                     id: down_Right_MeasureLines
                                                     line_name: 5
                                                     model: down_Right_MeasureBlock.x_values_model
                                                     x_start: down_Right_MeasureBlock.x_start
                                                     x_finish: down_Right_MeasureBlock.x_finish
                                                   }

                                                   Measure_ViserLine{
                                                       id: viser_Line

                                                   }


                                                   // Создаём Границы По X Для Нашего Графика
                                                   ValueAxis {
                                                      id: x_ValueAxis
                                                      min: 0
                                                      max: 100
                                                      tickType: ValueAxis.TicksDynamic
                                                      tickInterval: 10
                                                      labelFormat: "%i" // Делаем int Значения
                                                      color: Style.light_Color
                                                      gridLineColor: Style.light_Color  // Цвет Сетки
                                                     // labelsColor: Style.primaryDark_Color // Цвет Чисел
                                                     // labelsAngle: 90
                                                     //labelsVisible: false

                                                     // labelsFont: test_label.font// Копируем Шрифт С Вспомогательного Label
                                                      labelsFont:Qt.font({pointSize: 1})

                                                   }

                                                   // Создаём Границы По Y Для Нашего Графика
                                                   ValueAxis {
                                                      id: y_ValueAxis
                                                      min: 0
                                                      max: root_Item.max
                                                      tickType: ValueAxis.TicksFixed
                                                      tickInterval: 10
                                                     // reverse: true

                                                      labelsVisible: false
                                                      //labelFormat: "%i" // Делаем int Значения
                                                      //color: "red" //Style.light_Color //"#d0d0d0"//Style.light_Color //Style.secondaryText_Color
                                                      gridLineColor: Style.light_Color //  "#d0d0d0"//Style.light_Color// Style.secondaryText_Color // Цвет Сетки
                                                      //labelsColor: Style.primaryDark_Color
                                                      labelsFont:Qt.font({pointSize: 1})
                                                   }


                                                }

                                            }


                                       }



                                       Rectangle {
                                           anchors.centerIn: parent
                                           width: parent.width
                                           height: parent.height
                                           color: "transparent"
                                           border.width: ui.border_Size
                                           border.color:  Style.light_Color
                                           radius: ui.radius
                                       }

                                   }

                                }


                            }

                            Rectangle{
                                id: viser_Rectangle
                                width:  48 //ui.iconBlock_Size
                                height:  parent.height
                                anchors.right: parent.right

                                anchors.rightMargin: -width  - ui.basic_spacing
                                color:  "transparent"//Style.background_Color
                                radius: ui.radius

                                Column{
                                    width: 48 //ui.iconBlock_Size
                                    height:  parent.height
                                    spacing: ui.basic_spacing / 2

                                    Custom_Icon_Button{
                                        id: picket_Element
                                        width: parent.width
                                        height: 48 //ui.iconBlock_Size
                                        isNeedRectangle: true
                                        color_rec: Style.background_Color
                                        icon_path: "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                                       // needTip: true
                                        //tip_text: qsTr("Отметить пикет") + mytrans.emptyString
                                        onClicked_Signal: {

                                          // Chart_Work.add_New_Picket()

                                        }
                                    }

                                    Rectangle{
                                        width: parent.width
                                        height:  parent.height - 48 - 6//ui.iconBlock_Size - ui.basic_spacing / 2
                                        color:  Style.background_Color
                                        radius: ui.radius
                                       // layer.enabled: true
                                        //layer.effect: Mask_Rectangle{target: parent}

                                        Measure_Viser{
                                            id: measure_Viser
                                            value: 0.5
                                             onValueChanged: {

                                               // level_MeasureBlock.title = (value * 100).toString()

                                                 // console.log(value)

                                                    // это мой у

                                                          Chart_Work.get_points_line(value * 100)


                                                 viser_Line.update_ViserLine((value * 100))
                                             }

                                             Component.onCompleted: {
                                                 viser_Line.create_ViserLine(50)
                                             }
                                        }
                                    }

                                }

                            }

                         }


                    }

                    Row{
                        id: bootom_Row
                        width: parent.width
                        height:  200 //parent.height * 0.35 - main_Column.spacing * 3
                        anchors.left: parent.left

                        spacing: ui.basic_spacing

                        Column{
                            id: button_Map_Column
                            width: parent.width *  0.15
                            height:  parent.height
                           // anchors.left: parent.left
                            spacing: ui.basic_spacing

                            Custom_Button{
                                id: startStop_Button
                                width: parent.width
                                height: ui.height_Button
                                outlined: true
                                isIcon: true

                                source: isCheck ? "qrc:/icons/"+ Style.theme + "/utils/pause.svg" : "qrc:/icons/"+ Style.theme + "/utils/play.svg"


                                onClicked_Signal: {

                                    create_rotation_anim()

                                    Chart_Work.change_check_Draw(isCheck)


                                   /* if(outlined){

                                        outlined = false

                                        source = "qrc:/icons/"+ Style.theme + "/utils/play.svg"

                                    }
                                    else{

                                        outlined = true

                                        source = "qrc:/icons/"+ Style.theme + "/utils/pause.svg"



                                    } */

                                }

                            }


                           /* Navigation_Map{

                                     width: parent.width
                                     height: parent.height - ui.height_Button -  ui.basic_spacing/// 2 - ui.basic_spacing / 2

                                } */


                          /*  Rectangle{
                                 width: parent.width
                                 height:  parent.height / 2 - ui.basic_spacing / 2
                                 radius: ui.radius
                                 color: Style.background_Color
                            }*/
                        }

                        List_With_Title{
                               id: defect_List
                               width: parent.width * 0.85 - ui.basic_spacing // //0.6 - ui.basic_spacing / 2
                               height: parent.height
                               noTitle: true
                               title_name_model: [qsTr("Координата"), qsTr("Отстпуление"), str.extent, qsTr("Размер"), qsTr("Длинна"), qsTr("Признак"), str.set_speed, str.limit_speed]
                               title_size_model: [0.12, 0.16, 0.1, 0.12, 0.1, 0.12, 0.14, 0.14]

                               model: ListModel{

                                   ListElement{
                                       coord: "256 км 5 м"
                                       defect: 1
                                       st: 1
                                       amp: 1
                                       dl: 1
                                       cou: 1
                                       speed: "60 км/ч"
                                       limit_speed: "100 км/ч"


                                   }


                               }

                               delegate: List_Row{
                                 //  listview: defect_ListView
                                   model: [coord, defect, st, amp, dl, cou, speed, limit_speed]
                                   sizes: defect_List.title_size_model
                                  // cur: defect_ListView.currentIndex

                               }

                           }

                        List_With_Title{
                               id: km_rating_List
                               width: parent.width * 0.4 // - ui.basic_spacing //- ui.basic_spacing // 2
                               height: parent.height
                               noTitle: true
                               title_name_model: [ str.km_big, str.set_speed, str.limit_speed, str.extent + mytrans.emptyString, qsTr("Оценка") + mytrans.emptyString]
                               title_size_model: [0.18, 0.23, 0.23, 0.23, 0.13]

                               model: ListModel{
                                   id: warning_ListModel

                                   ListElement{
                                      km:"256 км"
                                      speed: "60 км/ч"
                                      limit_speed: "100 км/ч"
                                      extent: "121"
                                      mark: "Отлично"

                                   }


                               }

                               delegate: List_Row{
                                   width: km_rating_List.width
                                   model: [km, speed, limit_speed, extent, mark]
                                   sizes: km_rating_List.title_size_model
                                  // needHighlight: true

                               }

                           }

                       /* Row{
                          id: table_Row
                          width: parent.width * 0.85 - ui.basic_spacing
                          height:  parent.height
                         // anchors.right: parent.right
                          spacing: ui.basic_spacing




                        }*/

                    }

                }


            }


            Column{
                width:1000
                height: 96
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                Row{
                    width:parent.width
                    height: 48

                    Button{
                        width: 100
                        height: parent.height
                        text:  qsTr("вниз") + mytrans.emptyString
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
                        text:  qsTr("вверх") + mytrans.emptyString
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
                }

                Row{

                     width:parent.width
                     height: 48


                      Button {
                          id: connectButton
                          width: 100
                          height: parent.height
                          text: client.state === MqttClient.Connected ? "Disconnect" : "Connect"
                          onClicked: {

                             //  client.connectToHost()

                             if (client.state === MqttClient.Connected) {
                                  client.disconnectFromHost()
                                  subscription.destroy()
                                  subscription = 0
                              } else
                                  client.connectToHost()


                          }
                      }

                      Button {
                          id: subButton
                          width: 100
                          height: parent.height
                          text: "Subscribe"
                          onClicked: {

                             // sensors/+/temperature
                             subscription = client.subscribe("test_topic/+/ww")

                             subscription.messageReceived.connect(client.addMessage)
                          }

                          Label {
                              function stateToString(value) {
                                  if (value === 0)
                                      return "Disconnected"
                                  else if (value === 1)
                                      return "Connecting"
                                  else if (value === 2)
                                      return "Connected"
                                  else
                                      return "Unknown"
                              }
                              color: "white"
                              text: "Status:" + stateToString(client.state) + "(" + client.state + ")"
                              enabled: client.state === MqttClient.Connected
                          }
                      }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("csv") + mytrans.emptyString
                         onClicked: Chart_Work.openCSV()

                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("Уведомление") + mytrans.emptyString
                         onClicked: {

                            // sample_MeasureLines.add_area(10, 1, 20, 5)

                             push_Notification.open()

                          //   chartView.zoomIn(Qt.rect(0, 0, charts_Item.width, charts_Item.height))

                        //     chartView.zoomIn(Qt.rect(0, 0, charts_Item.width, 300))

                             //chartView.zoom(2)

                         }


                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("Пауза для скрола") + mytrans.emptyString

                         property bool checkButton: true


                         onClicked: {

                             if(!checkButton){

                              checkButton = true

                            }
                              else{

                                  checkButton = false


                              }

                             chart_anim.change_Pause(checkButton, y_0)

                            // chartView.zoomReset()
                             //main_ChartView.zoom(1)

                         }

                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("добавить") + mytrans.emptyString
                         onClicked: {

                             level_MeasureLines.add_point_border()

                            // applicationWindow.flipped = false

                            // chartView.scrollLeft(100)

                         }

                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("print_pdf") + mytrans.emptyString
                         onClicked: {

                            // km_ChartView.scrollDown(20)

                             my_pdf.print_pdf()

                           //  chartView.scrollRight(100)

                           //  viser_Line.update_ViserLine(50)


                         }

                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("вниз") + mytrans.emptyString
                         onClicked: {

                            // console.log("chart height = " + charts_Item.height)
                             chart_anim.create_Main_Scroll(30, true)

                             //chartView.scrollDown(100)

                             //measure_Km.update_Pickets(100)

                         }

                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("вверх") + mytrans.emptyString
                         onClicked: {


                             // Пропорция такая 20 - 446


                             //chart_anim.create_Main_Scroll(30, false)


                             chart_anim.create_Main_Scroll(chart_Rectangle.height / 10, false)


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
                         text:  qsTr("анимация") + mytrans.emptyString

                         property bool check: false

                         onClicked: {

                             if(!check){

                                 check = true

                                 table_Anim_open.stop()

                                 table_Anim_open.start()

                             }
                             else{

                                 check = false

                                 table_Anim_close.stop()

                                 table_Anim_close.start()

                             }

                              //level_MeasureLines.add_point_border()

                         }

                         SequentialAnimation{

                            id: table_Anim_open

                            ParallelAnimation{


                                NumberAnimation {target: bootom_Row; property: "anchors.leftMargin"; from: bootom_Row.anchors.leftMargin; to: - 1 * button_Map_Column.width - ui.basic_spacing; duration: 250 }

                                NumberAnimation {target: map; property: "anchors.leftMargin"; from: map.anchors.leftMargin; to: - 1 * button_Map_Column.width - ui.basic_spacing; duration: 250 }

                            }

                            NumberAnimation {target: defect_List; property: "width"; from: defect_List.width; to: bootom_Row.width * 0.6 -  ui.basic_spacing ; duration: 500 }


                         }

                         SequentialAnimation{

                            id: table_Anim_close

                            NumberAnimation {target: defect_List; property: "width"; from: defect_List.width; to: bootom_Row.width * 0.85 - ui.basic_spacing ; duration: 500 }


                            ParallelAnimation{

                                NumberAnimation {target: bootom_Row; property: "anchors.leftMargin"; from: bootom_Row.anchors.leftMargin; to: 0; duration: 250 }

                                NumberAnimation {target: map; property: "anchors.leftMargin"; from: map.anchors.leftMargin; to: ui.big_spacing / 2; duration: 250 }

                            }



                         }
                     }
                 }

            }




            Connections{
                target: big_db

                function onNewTask_signal(up_nom, name, put_nom){

                    direction_Label.text = name

                    upNom_Label.text = qsTr("Код: ") + up_nom + mytrans.emptyString

                    putNom_Label.text = qsTr("Путь: ") + put_nom + mytrans.emptyString

                    console.log("Код = " + up_nom + " Направление = " + name + " Путь = " + put_nom)
                }
            }

            Connections{
               target: Chart_Work


               property real y_1: 0

               property real y_2: 0

               property real y_3: 0

               property real y_4: 0

               property real y_5: 0

               property real offset:  0.5

               function onNewPoint_Chart_signal(index, x, y) {

                 //  y = y.toFixed(2)



                   /*if(y_0 > root_Item.start_scroll){

                       chartView.scrollDown(1)

                   }*/

                   if(true){ // 79 y_0 < 110

                       switch(index){

                       case Name_Measures.Level_Measure:

                           level_MeasureBlock.value = level_MeasureLines.addPoint(level_MeasureBlock.convert_x(x), y_0, x)



                           //level_MeasureBlock.value = x



                           y_0 += offset

                           coun_y_Btn.text = y_0

                           if(y_0 === root_Item.start_scroll){

                               chart_anim.create_Main_Scroll(chart_Rectangle.height / 10, true)

                               //chartView.scrollDown(chart_Rectangle.height / 5)

                               start_scroll+= 10
                             //  root_Item.start_scroll = chart_anim.create_main_scroll(root_Item.start_scroll)

                                                     // chartView.scrollDown(chart_Rectangle.height / 10)

                                                     // measure_Km.updatePointPosition();

                                                     // root_Item.start_scroll += 10

                                                     // chartView.scrollDown(1)

                                                     // measure_Km.updatePointPosition();

                                                      //console.log("Пора скролить " + )

                                                    //  chart_anim.create_Main_Scroll(30, false)

                                                  }

                          //y_0+= 0.1

                           break

                       case Name_Measures.Riht_Left_Measure:

                           riht_Left_MeasureBlock.value = riht_Left_MeasureLines.addPoint(riht_Left_MeasureBlock.convert_x(x), y_1, x)

                           y_1 += offset

                           break

                       case Name_Measures.Riht_Right_Measure:

                           riht_Right_MeasureBlock.value = riht_Right_MeasureLines.addPoint(riht_Right_MeasureBlock.convert_x(x), y_2, x)

                           y_2 += offset

                           break

                       case Name_Measures.Sample_Measure:

                           sample_MeasureBlock.value = sample_MeasureLines.addPoint(sample_MeasureBlock.convert_x(x), y_3, x)

                           y_3 += offset

                           break

                       case Name_Measures.Down_Left_Measure:

                           down_Left_MeasureBlock.value = down_Left_MeasureLines.addPoint(down_Left_MeasureBlock.convert_x(x), y_4, x)

                           y_4 += offset

                           break

                       case Name_Measures.Down_Right_Measure:

                           down_Right_MeasureBlock.value = down_Right_MeasureLines.addPoint(down_Right_MeasureBlock.convert_x(x), y_5, x)

                           y_5 += offset

                           break


                       }

                   }



                   // chart_LineSeries.append(x, y)


               }

               function onNewPicket_signal(y) {

                   measure_Km.create_KmLine(y)

               }

               function onNewViserValue_signal(index, value) {

                   let fixed_value = 3

                   switch(index){

                   case Name_Measures.Level_Measure:

                       level_MeasureBlock.value = value.toFixed(fixed_value).toString()

                       break

                   case Name_Measures.Riht_Left_Measure:

                       riht_Left_MeasureBlock.value = value.toFixed(fixed_value).toString()

                       break

                   case Name_Measures.Riht_Right_Measure:

                       riht_Right_MeasureBlock.value = value.toFixed(fixed_value).toString()

                       break

                   case Name_Measures.Sample_Measure:

                       sample_MeasureBlock.value = value.toFixed(fixed_value).toString()

                       break

                   case Name_Measures.Down_Left_Measure:

                       down_Left_MeasureBlock.value = value.toFixed(fixed_value).toString()

                       break

                   case Name_Measures.Down_Right_Measure:

                       down_Right_MeasureBlock.value = value.toFixed(fixed_value).toString()

                       break


                   }



               }

            }


          /*  Connections{
                target: my_pdf

                function onTest_Signal(word){



                    console.log("woooooord === " + word)
                }
            } */

            Component.onCompleted: {

                big_db.get_Task_Param()

                // Если мы уже работали с графиком и переключились на другую вкладку, то при возвращении посторим линию которая уже была
             //   toast.show("график готов", 3000, 1) // Показываем Тоcт

            }

            Component.onDestruction: {

                Chart_Work.clearPoints()
            }

        }

    }


    Navigation_Map{
        id: map
        start_width: button_Map_Column.width
        start_height: button_Map_Column.height - ui.height_Button -  ui.basic_spacing

        width: start_width // button_Map_Column.width //parent.width
        height: start_height // button_Map_Column.height - ui.height_Button -  ui.basic_spacing //parent.height - ui.height_Button -  ui.basic_spacing/// 2 - ui.basic_spacing / 2


        anchors {

            bottom: parent.bottom
            left: parent.left

            leftMargin: ui.big_spacing / 2
            bottomMargin: ui.big_spacing / 2
        }




    }


}


