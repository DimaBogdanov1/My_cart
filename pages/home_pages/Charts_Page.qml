import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Rectangle {
    width: parent.width
    height: parent.height
    clip: true
    color: Style.background_Color
    property int zoom_Chart: 0


    Item{
        width: parent.width
        height: parent.height - ui.toolBar_Size
        anchors.bottom: parent.bottom

        Column {
            id: main_Column
            width: parent.width - ui.top_bar_margin
            height: parent.height
            anchors.centerIn: parent
            spacing: ui.basic_spacing / 2 /// 2

            Item{ // Общая Информация
                id: task_Item
                width: parent.width
                height:  48 //96

                Row{
                    width: parent.width
                    height: parent.height
                    spacing: ui.basic_spacing / 2

                    Rectangle{ // Общая Информация
                        width: parent.width / 2 - ui.basic_spacing / 4
                        height: parent.height
                        radius: ui.radius_mini
                        color:  Style.primary_Color

                        Custom_Label{
                            horizontalAlignment: Text.AlignHCenter
                            color: Style.light_Color // Меняем Цвет Текста
                            text: qsTr("Информация из базы данных") + mytrans.emptyString

                        }

                    }

                    Rectangle{ // Общая Информация
                        width: parent.width / 2 - ui.basic_spacing / 4
                        height: parent.height
                        radius: ui.radius_mini
                        color:  Style.primary_Color

                        Custom_Label{
                            horizontalAlignment: Text.AlignHCenter
                            color: Style.light_Color // Меняем Цвет Текста
                            text: qsTr("Информация по датчикам") + mytrans.emptyString

                        }
                    }
                }

            }

            Item{ // Грфаик
                id: charts_Item
                 width: parent.width
                 height:  parent.height * 0.7 - task_Item.height
               //radius: ui.radius_mini
                // color: Style.secondaryAccent_Color

                 Column{
                     width: parent.width
                     height: parent.height
                     spacing: ui.basic_spacing / 2

                     Item{
                        width: parent.width
                        height:  48

                        Row{
                          width: parent.width
                          height:  parent.height
                          spacing: ui.basic_spacing / 2

                          Rectangle{ // Километр
                               width: parent.width * 0.06 - (ui.basic_spacing * 3 / 7)
                               height:  parent.height
                               radius: ui.radius_mini
                               color: Style.accent_Color

                               Custom_Label{
                                   horizontalAlignment: Text.AlignHCenter
                                   color: Style.light_Color // Меняем Цвет Текста
                                   font.pixelSize: ui.text_miniSize
                                   text: qsTr("Километр") + mytrans.emptyString

                               }
                          }


                          Measure_Block {
                              width: parent.width * 0.2 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: -120
                              max: 120
                              step: 40
                              title: qsTr("Уровень") + mytrans.emptyString
                          }

                          Measure_Block {
                              width:  parent.width * 0.17 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: -80
                              max: 80
                              step: 40
                              title: qsTr("Рихтовка левая") + mytrans.emptyString

                          }

                          Measure_Block {
                              width:  parent.width * 0.17 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: -80 //-90
                              max: 80 //90
                              step: 40 //30
                              title: qsTr("Рихтовка правая") + mytrans.emptyString

                          }

                          Measure_Block {
                              width:  parent.width * 0.14 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: 1512
                              max: 1544
                              step: 8
                              title: qsTr("Шаблон") + mytrans.emptyString

                          }

                          Measure_Block {
                              width:  parent.width * 0.13 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: -10
                              max: 10
                              step: 10
                              title: qsTr("Просадка левая: 8") + mytrans.emptyString

                          }

                          Measure_Block {
                              width:  parent.width * 0.13 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: -10
                              max: 10
                              step: 10
                              title: qsTr("Просадка правая: 10") + mytrans.emptyString

                          }


                        }

                     }

                     Rectangle{
                         id: bg_Rectangle
                         width: parent.width
                         height:  parent.height - 48 - ui.basic_spacing / 2
                         color:  "transparent"
                         radius: ui.radius_mini
                         layer.enabled: true
                         layer.effect: OpacityMask {
                                maskSource: Item {
                                    width: bg_Rectangle.width
                                    height: bg_Rectangle.height
                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: bg_Rectangle.width
                                        height: bg_Rectangle.height
                                        radius: ui.radius_mini
                                    }
                                }
                         }

                         Item{
                              width: parent.width  //+ 125 //128
                              height: parent.height //* 0.25
                              clip: true

                             // rotation: 180

                              ChartView {
                                 id: main_ChartView
                                 x: -56
                                 y: -41
                                 width: parent.width + 100
                                 height: parent.height + 96 //95
                                 dropShadowEnabled: false
                                 antialiasing: true
                                 backgroundColor: "red"//Style.background_Color
                                 legend.visible:false
                                 plotAreaColor: Style.background_Color

                                 // Серия Точек
                                 LineSeries {
                                     id: chart_LineSeries
                                     color: Style.accent_Color

                                     axisX: x_ValueAxis
                                     axisY: y_ValueAxis

                                   //  axisXTop: x_ValueAxis
                                    // axisYRight: y_ValueAxis


                                     width: 2

                                     useOpenGL: true

                                     XYPoint { x: 10; y: 0 }
                                     XYPoint { x: 10; y: 10 }


                                 }


                                 //onWidthChanged: updatePointPosition();
                                 //onHeightChanged: updatePointPosition();

                                 function updatePointPosition()
                                 {
                                     var p = main_ChartView.mapToPosition(chart_LineSeries.at(3), chart_LineSeries);
                                     txt.x = p.x;
                                     txt.y = p.y;
                                 }

                              }

                          }


                         Rectangle {
                             anchors.centerIn: parent
                             width: parent.width
                             height: parent.height
                             color: "transparent"
                             border.width: 1
                             border.color:  Style.accentLight_Color
                             radius: ui.radius_mini
                         }

                     }

                 }


            }


            Rectangle{
                 width: parent.width
                 height:  parent.height * 0.3 - main_Column.spacing * 3
                 radius: ui.radius_mini
                 color: Style.primary_Color

                 Row{

                      width:700
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

                              main_ChartView.zoom(2)

                          }


                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("-") + mytrans.emptyString
                          onClicked: {


                              main_ChartView.zoomReset()
                              //main_ChartView.zoom(1)

                          }

                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("<-") + mytrans.emptyString
                          onClicked: {

                              main_ChartView.scrollLeft(100)

                          }

                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("->") + mytrans.emptyString
                          onClicked: {

                              main_ChartView.scrollRight(100)

                          }

                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("вниз") + mytrans.emptyString
                          onClicked: {



                              main_ChartView.scrollDown(100)

                          }

                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("вверх") + mytrans.emptyString
                          onClicked: {

                              main_ChartView.scrollUp(100)

                          }

                      }
                  }

            }


        }

        Row{
            width: parent.width
            height: 20
            anchors.left: parent.left
            anchors.leftMargin: 28
            visible: false

            Rectangle{
                 width: parent.width * 0.1
                 height: parent.height
                 color: "red"
                Label{

                    anchors.fill: parent
                    horizontalAlignment: Text.AlignLeft // Делаем Текст По Горизонтальному Центру
                    text: "10"
                }
            }


            Rectangle{
                 width: parent.width * 0.1
                 height: parent.height
                 color: "blue"
                Label{

                    anchors.fill: parent
                    horizontalAlignment: Text.AlignLeft // Делаем Текст По Горизонтальному Центру
                    text: "0"
                }
            }
            Rectangle{
                 width: parent.width * 0.1
                 height: parent.height
                 color: "red"
                Label{

                    anchors.fill: parent
                    horizontalAlignment: Text.AlignLeft // Делаем Текст По Горизонтальному Центру
                    text: "10"
                }
            }
        }

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
       labelsColor: Style.primaryDark_Color // Цвет Чисел
      // labelsAngle: 90
//labelsVisible: false

      // labelsFont: test_label.font// Копируем Шрифт С Вспомогательного Label

    }

    // Создаём Границы По Y Для Нашего Графика
    ValueAxis {
       id: y_ValueAxis
       min: 0
       max: 70//204
       tickType: ValueAxis.TicksFixed
       tickInterval: 10
       reverse: true

       labelsVisible: false
       labelFormat: "%i" // Делаем int Значения
       color: Style.light_Color //"#d0d0d0"//Style.light_Color //Style.secondaryText_Color
       gridLineColor: Style.light_Color //  "#d0d0d0"//Style.light_Color// Style.secondaryText_Color // Цвет Сетки
       labelsColor: Style.primaryDark_Color

       //labelsFont: test_label.font
    }



    Connections{

       target: Work_with_chart

       function onNewPoint_Chart_signal(x, y) {

       //    console.log("qqqqqqqqqqq " , x + " " + y)
            chart_LineSeries.append(x, y)

       }


    }

}
