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
    color: Style.body_Color
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

            Item{ // Грaфик
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
                              id: level_MeasureBlock
                              width: parent.width * 0.2 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: -120
                              max: 120
                              step: 40
                              x_start: 7.5
                              x_finish: 27
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
                              x_start: 28
                              x_finish: 44
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
                              x_start: 45
                              x_finish: 61
                              value: 1
                              title: qsTr("Рихтовка правая") + mytrans.emptyString

                          }

                          Measure_Block {
                              id: sample_MeasureBlock
                              width:  parent.width * 0.14 - (ui.basic_spacing * 3 / 7)
                              height:  parent.height
                              min: 1512
                              max: 1544
                              step: 8
                              x_start: 62
                              x_finish: 70
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
                              x_start: 75
                              x_finish: 85
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
                              x_start: 87
                              x_finish: 97
                              value: 10
                              title: qsTr("Просадка правая") + mytrans.emptyString

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
                                 id: chartView
                                 x: -56
                                 y: -41
                                 width: parent.width + 100
                                 height: parent.height + 96 //95
                                 dropShadowEnabled: false
                                 antialiasing: true
                                 backgroundColor: "red"//Style.background_Color
                                 legend.visible:false
                                 plotAreaColor: Style.background_Color

                                 property int y_finish: 40

                                 Measure_Km{
                                     id: measure_Km
                                     x_start: 3.2
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

                                       addPoint(sample_MeasureBlock.x_start + 3, 0)
                                       addPoint(sample_MeasureBlock.x_start + 3, 10)

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



                                 /*Component.onCompleted: {
                                            var seriesCount = Math.round(Math.random()* 10);
                                            for(var i = 0;i < seriesCount;i ++)
                                            {
                                                var series = main_ChartView.createSeries(ChartView.SeriesTypeLine, "line"+ i, x_ValueAxis, y_ValueAxis);
                                                series.pointsVisible = true;
                                                series.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                                                series.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function
                                                var pointsCount = Math.round(Math.random()* 20);
                                                var x = 0.0;
                                                for(var j = 0;j < pointsCount;j ++)
                                                {
                                                    x += (Math.random() * 2.0);
                                                    var y = (Math.random() * 10.0);
                                                    series.append(x, y);
                                                }
                                            }
                                        }*/

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

                              chartView.zoom(2)

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

                              chartView.scrollRight(100)

                          }

                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("вниз") + mytrans.emptyString
                          onClicked: {

                              chartView.scrollDown(100)

                              measure_Km.update_Pickets(100)

                          }

                      }

                      Button{
                          width: 100
                          height: parent.height
                          text:  qsTr("вверх") + mytrans.emptyString
                          onClicked: {

                              chartView.scrollUp(100)

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


    function createRect()
    {
        var component = Qt.createComponent("qrc:/my_components/Measure/Measure_Picket.qml")

        var picket = component.createObject(parent,{"x":50,"y":10})

        picket.text = "www"

       // picket.width = 100

        //picket.height = 48


          if(picket !== null ) {
              picket.x =  Math.floor(Math.random() * 300 );
              picket.y = Math.floor(Math.random() * 100 );
            //  picket.dropped.connect(dropped);
        }
    }

    Connections{

       target: Work_with_chart

       function onNewPoint_Chart_signal(x, y) {

           level_MeasureLines.addPoint(x, y)
       //    console.log("qqqqqqqqqqq " , x + " " + y)
           // chart_LineSeries.append(x, y)

       }

       function onNewPicket_signal(y) {

           measure_Km.create_KmLine(y)

       }


    }

    Component.onCompleted: {

        var component = Qt.createComponent("Measure_Picket.qml");

        component.x = 10 //(object.width + 10) * i;

        // Если мы уже работали с графиком и переключились на другую вкладку, то при возвращении посторим линию которая уже была
     //   toast.show("график готов", 3000, 1) // Показываем Тоcт

    }

}
