import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15


import Style 1.0
import MyLang 1.0
import my_components 1.0


Item{
    width: parent.width
    height: parent.height

    property int zoom_Chart: 0

    Column{
      width: parent.width
      height: parent.height

        Custom_TopBar{
            id: topBar
            width: parent.width
            height: ui.toolBar_Size //ui.iconBlock_topBar_Size + ui.top_bar_margin
            focus: true

            onViser_Signal: {

                if(value){

                    Work_with_chart.get_points_line(measure_Viser.value * 100)

                }

                measure_Viser.show_hide_viser(value)

                viser_Line.show_hide_viserLine(value)

               // viser_Anim.start()
            }

            onGrab_Signal: {

                charts_Item.grabToImage(function(result) {
                                result.saveToFile("/Users/Shared/example.png")
                            });
            }


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

                    Rectangle{ // Общая Информация
                        id: task_Item
                        width: parent.width
                        radius: ui.radius
                        height:  40 //96

                        Row{
                            width: parent.width
                            height: parent.height
                            spacing: ui.basic_spacing / 2


                            Custom_Rectangle_Label {
                                width: parent.width * 0.3
                                height: parent.height
                                text: qsTr("Москва-Рига") + mytrans.emptyString



                            }

                            Custom_Text_Arrow{
                               id: km_Text_Arrow
                               width: parent.width * 0.4 - ui.basic_spacing * 1.5
                               height: ui.height_Button
                               text_1:  qsTr("Станиция 1") + mytrans.emptyString
                               text_2:  qsTr("Станиция 2") + mytrans.emptyString

                            }

                            Custom_Rectangle_Label {
                                width: parent.width * 0.15
                                height: parent.height
                                text: qsTr("Код: 11233") + mytrans.emptyString



                            }


                            Custom_Rectangle_Label {
                                width: parent.width * 0.15
                                height: parent.height
                                text: qsTr("Путь: 1") + mytrans.emptyString

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
                                     width: parent.width
                                     height:  parent.height
                                     spacing: ui.basic_spacing / 2

                                     Rectangle{ // Километр
                                          width: parent.width * 0.05 - (ui.basic_spacing * 3 / 7)
                                          height:  parent.height
                                          radius: ui.radius
                                          color: Style.background_Color

                                          Custom_Label{
                                              horizontalAlignment: Text.AlignHCenter
                                              text: qsTr("255") + mytrans.emptyString

                                          }
                                     }


                                     Measure_Block {
                                         id: level_MeasureBlock
                                         width: parent.width * 0.2 - (ui.basic_spacing * 3 / 7)
                                         height:  parent.height
                                         min: -120
                                         max: 120
                                         step: 40
                                         x_start: 7.2
                                         x_finish: 23.8
                                         value: 1
                                         title: qsTr("Уровень") + mytrans.emptyString
                                     }

                                     Measure_Block {
                                         id: riht_Left_MeasureBlock
                                         width:  parent.width * 0.17 - (ui.basic_spacing * 3 / 7)
                                         height:  parent.height
                                         min: -80
                                         max: 80
                                         step: 40
                                         x_start: 27.5
                                         x_finish: 40.3 //41.355 // x_start + 0.17 * (level_MeasureBlock.x_finish - level_MeasureBlock.x_start) / 0.2
                                         value: 1
                                         title: qsTr("Рихтовка левая") + mytrans.emptyString

                                     }

                                     Measure_Block {
                                         id: riht_Right_MeasureBlock
                                         width:  parent.width * 0.17 - (ui.basic_spacing * 3 / 7)
                                         height:  parent.height
                                         min: -80 //-90
                                         max: 80 //90
                                         step: 40 //30
                                         x_start: 44.3
                                         x_finish: x_start + riht_Left_MeasureBlock.x_finish - riht_Left_MeasureBlock.x_start
                                         value: 1
                                         title: qsTr("Рихтовка правая") + mytrans.emptyString

                                         Component.onCompleted: {

                                             console.log(x_finish + " ddddd")
                                         }
                                     }

                                     Measure_Block {
                                         id: sample_MeasureBlock
                                         width:  parent.width * 0.15 - (ui.basic_spacing * 3 / 7)
                                         height:  parent.height
                                         min: 1512
                                         max: 1544
                                         step: 8
                                         x_start: 60.8
                                         x_finish: 72
                                         value: 1
                                         title: qsTr("Шаблон") + mytrans.emptyString

                                     }

                                     Measure_Block {
                                         id: down_Left_MeasureBlock
                                         width:  parent.width * 0.13 - (ui.basic_spacing * 3 / 7)
                                         height:  parent.height
                                         min: -10
                                         max: 10
                                         step: 10
                                         x_start: 76.2
                                         x_finish: 84.3
                                         value: 8
                                         title: qsTr("Просадка левая") + mytrans.emptyString

                                     }

                                     Measure_Block {
                                         id: down_Right_MeasureBlock
                                         width:  parent.width * 0.13 - (ui.basic_spacing * 3 / 7)
                                         height:  parent.height
                                         min: -10
                                         max: 10
                                         step: 10
                                         x_start: 89
                                         x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                         value: 10
                                         title: qsTr("Просадка правая") + mytrans.emptyString

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


                                       Item{
                                            width: parent.width  //+ 125 //128
                                            height: parent.height //* 0.25
                                            clip: true

                                           // rotation: 180


                                            ChartView {
                                               id: chartView
                                               x: -56
                                               y: -32 // -41
                                               width: parent.width + 100
                                               height: parent.height + 71//96 //95
                                               dropShadowEnabled: false
                                               antialiasing: true
                                               backgroundColor: Style.background_Color //"red"//Style.background_Color
                                               legend.visible:false
                                               plotAreaColor: Style.background_Color

                                               property int y_finish: 40

                                               Charts_Anim{
                                                   id: chart_anim
                                               }

                                               Measure_Km{
                                                   id: measure_Km
                                                   x_start: 2.5
                                                   Component.onCompleted: {

                                                       create_RailsLine()

                                                      // create_KmLine(20)
                                                   }

                                               }

                                               Measure_Lines{  // Уровень
                                                 id: level_MeasureLines
                                                 line_name: 0
                                                 count: level_MeasureBlock.count_val
                                                 x_start: level_MeasureBlock.x_start
                                                 x_finish: level_MeasureBlock.x_finish
                                                 Component.onCompleted: {

                                                     addPoint(level_MeasureBlock.x_start + 3, 0)
                                                     addPoint(level_MeasureBlock.x_start + 3, 10)
                                                     create_BorderSeries()
                                                 }

                                               }

                                               Measure_Lines{ // Рихтовка левая
                                                 id: riht_Left_MeasureLines
                                                 line_name: 1
                                                 count: riht_Left_MeasureBlock.count_val
                                                 x_start: riht_Left_MeasureBlock.x_start
                                                 x_finish: riht_Left_MeasureBlock.x_finish
                                                 Component.onCompleted: {

                                                     addPoint(riht_Left_MeasureBlock.x_start + 3, 0)
                                                     addPoint(riht_Left_MeasureBlock.x_start + 3, 10)

                                                     create_BorderSeries()
                                                 }

                                               }

                                               Measure_Lines{  // Рихтовка правая
                                                 id: riht_Right_MeasureLines
                                                 line_name: 2
                                                 count: riht_Right_MeasureBlock.count_val
                                                 x_start: riht_Right_MeasureBlock.x_start
                                                 x_finish: riht_Right_MeasureBlock.x_finish
                                                 Component.onCompleted: {

                                                     addPoint(riht_Right_MeasureBlock.x_start + 3, 0)
                                                     addPoint(riht_Right_MeasureBlock.x_start + 3, 10)

                                                     create_BorderSeries()
                                                 }

                                               }

                                               Measure_Lines{ // Шаблон
                                                 id: sample_MeasureLines
                                                 line_name: 3
                                                 count: sample_MeasureBlock.count_val
                                                 x_start: sample_MeasureBlock.x_start
                                                 x_finish: sample_MeasureBlock.x_finish
                                                 Component.onCompleted: {

                                                    // addPoint(sample_MeasureBlock.x_start + 3, 0)
                                                     //addPoint(sample_MeasureBlock.x_start + 3, 10)

                                                     create_BorderSeries()
                                                 }

                                               }

                                               Measure_Lines{ // Просадка левая
                                                 id: down_Left_MeasureLines
                                                 line_name: 4
                                                 count: down_Left_MeasureBlock.count_val
                                                 x_start: down_Left_MeasureBlock.x_start
                                                 x_finish: down_Left_MeasureBlock.x_finish
                                                 Component.onCompleted: {

                                                     addPoint(down_Left_MeasureBlock.x_start + 3, 0)
                                                     addPoint(down_Left_MeasureBlock.x_start + 3, 10)

                                                     create_BorderSeries()
                                                 }

                                               }

                                               Measure_Lines{ // Просадка правая
                                                 id: down_Right_MeasureLines
                                                 line_name: 5
                                                 count: down_Right_MeasureBlock.count_val
                                                 x_start: down_Right_MeasureBlock.x_start
                                                 x_finish: down_Right_MeasureBlock.x_finish
                                                 Component.onCompleted: {

                                                     addPoint(down_Right_MeasureBlock.x_start + 3, 0)
                                                     addPoint(down_Right_MeasureBlock.x_start + 3, 10)

                                                     create_BorderSeries()
                                                 }

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
                                                  max: 100
                                                  tickType: ValueAxis.TicksFixed
                                                  tickInterval: 10
                                                  reverse: true

                                                  labelsVisible: false
                                                  labelFormat: "%i" // Делаем int Значения
                                                  color: Style.light_Color //"#d0d0d0"//Style.light_Color //Style.secondaryText_Color
                                                  gridLineColor: Style.light_Color //  "#d0d0d0"//Style.light_Color// Style.secondaryText_Color // Цвет Сетки
                                                  //labelsColor: Style.primaryDark_Color
                                                  labelsFont:Qt.font({pointSize: 1})
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

                                          // Work_with_chart.add_New_Picket()

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

                                                level_MeasureBlock.title = (value * 100).toString()
                                                // console.log(value)

                                                    // это мой у

                                                          Work_with_chart.get_points_line(value * 100)

                                                 //sample_MeasureLines.get_value_by_y(y)

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
                                id: start_Button
                                width: parent.width
                                height: ui.height_Button
                                isIcon: true
                                source: "qrc:/icons/"+ Style.theme + "/utils/play.svg"

                                onClicked_Signal: {


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

                                 List_Row{
                                     id: title_Row
                                     model: [ "№", qsTr("Координата"), qsTr("Неисправность"), qsTr("Степень"), qsTr("Амплитуда"), qsTr("Длинна"), qsTr("Количество отступлений")]
                                     sizes: [0.05, 0.15, 0.15, 0.15, 0.15, 0.15, 0.2]
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

                                        }

                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                        }
                                        ListElement{
                                            coord: 1
                                            defect: 1
                                            st: 1
                                            amp: 1
                                            dl: 1
                                            cou: 1
                                        }

                                    }


                                    /*highlight: List_Highlight{
                                        width: 1// parent.width
                                        height: 20

                                    }*/

                                    delegate: List_Row{
                                        listview: defect_ListView
                                        model: [ index + 1, coord, defect, st, amp, dl, cou]
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
                                      onClicked: Work_with_chart.openCSV()

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("+") + mytrans.emptyString
                                      onClicked: {

                                          sample_MeasureLines.add_area(10, 1, 20, 5)

                                         // chartView.zoom(2)

                                      }


                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("-") + mytrans.emptyString
                                      onClicked: {


                                          chartView.zoomReset()
                                          //main_ChartView.zoom(1)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("<-") + mytrans.emptyString
                                      onClicked: {

                                          chartView.scrollLeft(100)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("->") + mytrans.emptyString
                                      onClicked: {

                                        //  chartView.scrollRight(100)

                                          viser_Line.update_ViserLine(50)


                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("вниз") + mytrans.emptyString
                                      onClicked: {

                                          chart_anim.create_scroll(100, false)

                                          //chartView.scrollDown(100)

                                          measure_Km.update_Pickets(100)

                                      }

                                  }

                                  Button{
                                      width: 100
                                      height: parent.height
                                      text:  qsTr("вверх") + mytrans.emptyString
                                      onClicked: {

                                          chart_anim.create_scroll(100, true)

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

                    console.log("Код = " + up_nom + " Направление = " + name + " Путь = " + put_nom)
                }
            }

            Connections{
               target: Work_with_chart

               property int tmp_y: 0

               function onNewPoint_Chart_signal(x, y) {


                   sample_MeasureLines.addPoint(sample_MeasureBlock.convert_x(x), tmp_y, x)

                   tmp_y++

                   // chart_LineSeries.append(x, y)


               }

               function onNewPicket_signal(y) {

                   measure_Km.create_KmLine(y)

               }

               function onNewViserValue_signal(value) {

                   sample_MeasureBlock.value = value.toFixed(1).toString()


               }

            }


            Component.onCompleted: {

                // Если мы уже работали с графиком и переключились на другую вкладку, то при возвращении посторим линию которая уже была
             //   toast.show("график готов", 3000, 1) // Показываем Тоcт

            }

            Component.onDestruction: {

                Work_with_chart.clearPoints()
            }

        }

    }

}


