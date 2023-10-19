import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15

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
                            width: parent.width
                            height: parent.height
                            spacing: ui.basic_spacing / 2

                            Rectangle{ // Общая Информация
                                width: parent.width - 200 -  ui.basic_spacing
                                radius: ui.radius
                                height:  parent.height
                                color: Style.background_Color

                                Row{
                                    width: parent.width
                                    height: parent.height

                                    Custom_Rectangle_Label {
                                        id: upNom_Label
                                        width: parent.width * 0.15
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("Код: 11233") + mytrans.emptyString

                                    }

                                    Custom_Rectangle_Label {
                                        id: direction_Label
                                        width: parent.width * 0.3
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("Направление: Москва-Рига") + mytrans.emptyString

                                    }


                                    Custom_Rectangle_Label {
                                        id: putNom_Label
                                        width: parent.width * 0.15
                                        height: parent.height
                                        needBack: false
                                        text: qsTr("Путь: 1") + mytrans.emptyString

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

                            Custom_Rectangle_Label {
                                width: 100
                                height: parent.height
                                color: Style.background_Color
                                property real speed: 6

                                text: speed + qsTr(" км/ч") + mytrans.emptyString

                            }


                            /*Rectangle{
                                width: 100
                                radius: ui.radius
                                height:  parent.height
                                color: Style.background_Color


                                Custom_Text_With_Icon{
                                  //  width: parent.width
                                    height: parent.height
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    icon_size: 24
                                    source: "qrc:/icons/"+ Style.theme + "/utils/battery.svg"
                                    text: "12 км/ч"
                                }
                            }*/


                            Rectangle{
                                width: 100
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
                                              text: qsTr("255") + mytrans.emptyString

                                          }
                                     }


                                     Measure_Block {
                                         id: speed_MeasureBlock
                                         width:  parent.width * 0.124 -  measure_Row.spacing_value
                                         height:  parent.height
                                         reverse: true
                                         measure_model: [0, 60, 100, 250]
                                         no_values_model: [0, 250]
                                         x_start: 1.2 //7.2 - tmp_offset
                                         x_finish: 10.8 //16.8 - tmp_offset
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
                                         x_start: 19.2 - 4.8
                                         x_finish: 33.3 - 4.8
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
                                         measure_model: [-30, -3, 0, 3, 30]
                                         no_values_model: [-3, 3, 30]
                                         no_x_index: 4
                                         x_start: 35.8 - 3.95
                                         x_finish: 45.5  - 3.95 //41.355 // x_start + 0.17 * (level_MeasureBlock.x_finish - level_MeasureBlock.x_start) / 0.2
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
                                         measure_model: [-30, -3, 0, 3, 30]
                                         no_values_model: [-30, -3, 3]
                                         no_x_index: 0
                                         x_start: 47.9 - 2.95
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
                                         x_start: 60.8 - 2.3
                                         x_finish: 73 - 2.3
                                         value: 1
                                         title: str.sample

                                         Component.onCompleted: {

                                             sample_MeasureLines.create_BorderSeries()

                                         }
                                     }

                                     Measure_Block {
                                         id: down_Left_MeasureBlock
                                         width:  parent.width * 0.124 - measure_Row.spacing_value
                                         height:  parent.height
                                         measure_model: [-10, 0, 10]
                                         x_start: 75.8 - 1
                                         x_finish: 85.8 - 1
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
                                         x_start: 88.2 - 0.5
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
                                       id: bg_Rectangle
                                       width: parent.width //- viser_Rectangle.width - ui.basic_spacing / 2
                                       height:  parent.height
                                       anchors.left: parent.left
                                       color:  Style.light_Color //"transparent"
                                       radius: ui.radius
                                       layer.enabled: true
                                       layer.effect: Mask_Rectangle{target: parent}

                                       Row{
                                           width: parent.width
                                           height: parent.height

                                           Item{
                                                id: km_Item
                                                width: km_MeasureBlock.width + measure_Row.spacing + 14.5
                                                height: parent.height
                                                clip: true

                                                ChartView {
                                                   id: km_ChartView
                                                   x: -40
                                                   y: -40 // -41
                                                   width: parent.width + 70
                                                   height: parent.height + 96 //95
                                                   dropShadowEnabled: false
                                                   antialiasing: true
                                                   backgroundColor: Style.background_Color
                                                   legend.visible:false
                                                   plotAreaColor: Style.background_Color

                                                   Text {
                                                          id: txt
                                                          text: "Hello"
                                                          color: "red"
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



                                                   Component.onCompleted: {

                                                       km_ChartView.scrollDown(20)

                                                   }

                                                }
                                           }



                                           Item{
                                                width: parent.width - km_Item.width
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
                                                   backgroundColor: Style.background_Color //"red"//Style.background_Color
                                                   legend.visible:false
                                                   plotAreaColor: Style.background_Color

                                                   property int y_finish: 40

                                                   Charts_Anim{
                                                       id: chart_anim
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
                                                      reverse: true

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
                        spacing: ui.basic_spacing

                        Column{
                            width: parent.width * 0.15
                            height:  parent.height
                            spacing: ui.basic_spacing


                            Custom_Button{
                                id: startStop_Button
                                width: parent.width
                                height: ui.height_Button
                                isIcon: true
                                source: "qrc:/icons/"+ Style.theme + "/utils/play.svg"

                                onClicked_Signal: {

                                    if(outlined){

                                        outlined = false

                                        source = "qrc:/icons/"+ Style.theme + "/utils/play.svg"

                                    }
                                    else{

                                        outlined = true

                                        source = "qrc:/icons/"+ Style.theme + "/utils/pause.svg"



                                    }

                                }

                            }

                            Rectangle{
                                 width: parent.width
                                 height:  parent.height - ui.height_Button -  ui.basic_spacing/// 2 - ui.basic_spacing / 2
                                 radius: ui.radius
                                 color: Style.background_Color
                                 layer.enabled: true
                                 layer.effect: Mask_Rectangle{target: parent}

                                 Navigation_Map{

                                 }

                                /* Rectangle{
                                      width: parent.width
                                      height:  1
                                      anchors.centerIn: parent
                                      color: "red"

                                 }

                                 Rectangle{
                                      width: 1
                                      height:  parent.height
                                      anchors.centerIn: parent
                                      color: "red"

                                 }*/

                            }



                          /*  Rectangle{
                                 width: parent.width
                                 height:  parent.height / 2 - ui.basic_spacing / 2
                                 radius: ui.radius
                                 color: Style.background_Color
                            }*/
                        }




                        Rectangle{
                             width: parent.width * 0.85 - ui.basic_spacing
                             height:  parent.height
                             radius: ui.radius
                             color:  Style.background_Color


                             Column{
                                 width: parent.width - ui.big_spacing
                                 height:  parent.height
                                 anchors.horizontalCenter: parent.horizontalCenter
                                 spacing: ui.border_Size

                                // признак
                                // установленная скорость
                                // ограничение скорости

                                 List_Row{
                                     id: title_Row
                                     model: [qsTr("Координата"), qsTr("Неисправность"), qsTr("Степень"), qsTr("Амплитуда"), qsTr("Длинна"), qsTr("Признак"), qsTr("Установленная скорость"), qsTr("Ограничение скорости")]
                                     sizes: [0.11, 0.13, 0.09, 0.11, 0.09, 0.11, 0.18, 0.17]
                                     clip: true
                                 }

                                 Custom_Border{}

                                 My_List{
                                    id: defect_ListView
                                    width: parent.width
                                    height: parent.height - title_Row.height - ui.border_Size * 2
                                    model:     ListModel{

                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                            u: 1


                                        }

                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                            u: 1

                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                            u: 1

                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                            u: 1

                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                            u: 1

                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                            u: 1
                                        }

                                    }


                                    /*highlight: List_Highlight{
                                        width: 1// parent.width
                                        height: 20

                                    }*/

                                    delegate: List_Row{
                                        listview: defect_ListView
                                        model: [ index + 1, coord, defect, st, amp, dl, cou, u]
                                        sizes: title_Row.sizes
                                        cur: defect_ListView.currentIndex

                                    }




                                }

                             }



                             Row{

                                  width:800
                                  height: 48
                                  anchors.right: parent.right
                                   anchors.bottom: parent.bottom

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("csv") + mytrans.emptyString
                                      onClicked: Chart_Work.openCSV()

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("+") + mytrans.emptyString
                                      onClicked: {

                                         // sample_MeasureLines.add_area(10, 1, 20, 5)

                                          y_ValueAxis.max = 200


                                       //   chartView.zoomIn(Qt.rect(0, 0, charts_Item.width, charts_Item.height))

                                     //     chartView.zoomIn(Qt.rect(0, 0, charts_Item.width, 300))

                                          //chartView.zoom(2)

                                      }


                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("-") + mytrans.emptyString
                                      onClicked: {


                                          y_ValueAxis.max = 100

                                         // chartView.zoomReset()
                                          //main_ChartView.zoom(1)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("rotate") + mytrans.emptyString
                                      onClicked: {

                                          applicationWindow.flipped = false

                                         // chartView.scrollLeft(100)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("down km chart") + mytrans.emptyString
                                      onClicked: {

                                          km_ChartView.scrollDown(20)

                                          //my_pdf.print_pdf()

                                        //  chartView.scrollRight(100)

                                        //  viser_Line.update_ViserLine(50)


                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("вниз") + mytrans.emptyString
                                      onClicked: {

                                          chart_anim.create_scroll(30, true)

                                          //chartView.scrollDown(100)

                                          measure_Km.update_Pickets(100)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("вверх") + mytrans.emptyString
                                      onClicked: {

                                          chart_anim.create_scroll(30, false)

                                         // chartView.scrollUp(100)

                                          measure_Km.update_Pickets(-100)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("добавить") + mytrans.emptyString
                                      onClicked: {

                                           level_MeasureLines.add_point_border()

                                      }

                                  }
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

               property int y_0: 0

               property int y_1: 0

               property int y_2: 0

               property int y_3: 0

               property int y_4: 0

               property int y_5: 0

               function onNewPoint_Chart_signal(index, x, y) {


                   switch(index){

                   case Name_Measures.Level_Measure:

                       level_MeasureLines.addPoint(level_MeasureBlock.convert_x(x), y_0, x)

                       y_0++

                       break

                   case Name_Measures.Riht_Left_Measure:

                       riht_Left_MeasureLines.addPoint(riht_Left_MeasureBlock.convert_x(x), y_1, x)

                       y_1++

                       break

                   case Name_Measures.Riht_Right_Measure:

                       riht_Right_MeasureLines.addPoint(riht_Right_MeasureBlock.convert_x(x), y_2, x)

                       y_2++

                       break

                   case Name_Measures.Sample_Measure:

                       sample_MeasureLines.addPoint(sample_MeasureBlock.convert_x(x), y_3, x)

                       y_3++

                       break

                   case Name_Measures.Down_Left_Measure:

                       down_Left_MeasureLines.addPoint(down_Left_MeasureBlock.convert_x(x), y_4, x)

                       y_4++

                       break

                   case Name_Measures.Down_Right_Measure:

                       down_Right_MeasureLines.addPoint(down_Right_MeasureBlock.convert_x(x), y_5, x)

                       y_5++

                       break


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


            Component.onCompleted: {

                // Если мы уже работали с графиком и переключились на другую вкладку, то при возвращении посторим линию которая уже была
             //   toast.show("график готов", 3000, 1) // Показываем Тоcт

            }

            Component.onDestruction: {

                Chart_Work.clearPoints()
            }

        }

    }


}


