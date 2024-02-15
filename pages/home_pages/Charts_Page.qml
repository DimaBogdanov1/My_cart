import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15

import qml.measure 1.0
import Style 1.0
import Sensors_Values 1.0
import Task_Values 1.0
import Chart_Page 1.0

import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int zoom_Chart: 0

    property real tmp_offset: 5.7

    property real y_0: 0

    Task_Values{
        id: task_Values

    }

    Chart_Page{
        id: charts_Page
    }

    Column{
      width: parent.width
      height: parent.height

        Custom_TopBar{
            id: topBar
            width: parent.width
            height: ui.toolBar_Size //ui.iconBlock_topBar_Size + ui.top_bar_margin
            sourceMenuModel: "qrc:/my_components/Top_Bars/Menu_Models/Chart_MenuModels.qml"
            needNotification: true
            mainModel: [0, 1]

            model: ListModel{

                ListElement{
                    icon_path: "qrc:/my_components/icons/light_theme/top_bar/location.svg"
                    typeAction: Custom_TopBar.Actions.Open_Popup_Action
                }

                ListElement{
                    icon_path: "qrc:/my_components/icons/light_theme/top_bar/zoom_in.svg"

                    model_Menu: [
                    ListElement { value: 3 },
                    ListElement { value: 1 }
                    ]

                }

            }

            onBackClick_Signal: {

                sub_index_HomePage = page_Loader.open_back(sub_index_HomePage, 1)

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


                    Sensors_Panel{
                        id: sensors_Panel
                        height:  40 //96

                    }

                    Item{ // Грaфик
                        id: charts_Item
                         width: parent.width
                         height:  parent.height - bootom_Row.height - sensors_Panel.height -  ui.basic_spacing * 2
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
                                     id: test_Row
                                     width: parent.width
                                     height:  parent.height
                                     spacing: ui.basic_spacing / 2
                                     property real spacing_value: ui.basic_spacing / 4

                                     Row{
                                         id: headerMeasure_Row
                                         width: parent.width * (0.055 + 0.132)
                                         height:  parent.height
                                         spacing: ui.basic_spacing / 2


                                         Km_Counter{
                                            id: km_MeasureBlock
                                            width: parent.width * 0.3 - test_Row.spacing_value

                                         }

                                         Measure_Block {
                                             id: speed_MeasureBlock
                                             width:  parent.width * 0.7 -  test_Row.spacing_value
                                             height:  parent.height
                                             reverse: true
                                             measure_model: [0, 60, 100, 250]
                                             no_values_model: [] //[0, 250]
                                             x_start: 14 //7.2 //- tmp_offset // 1.2
                                             x_finish: 32 // - tmp_offset // 10.8
                                             value: 10
                                             title: my_str.speed

                                             Component.onCompleted: {

                                                 speed_MeasureLines.create_SpeedLine()

                                                // speed_MeasureLines.create_BorderSeries()
                                             }
                                         }
                                     }

                                     Item{
                                         width: oneTypeWidth + 300
                                         height:  parent.height
                                         property real oneTypeWidth: parent.width - headerMeasure_Row.width - ui.basic_spacing / 2
                                         clip: true


                                         NumberAnimation{id: animMeasure; target: allMeasure_Row; property: "anchors.leftMargin"; from: allMeasure_Row.anchors.leftMargin; to: -1 * allMeasure_Row.width - ui.basic_spacing; duration: 500}


                                         Row{
                                           id: allMeasure_Row
                                           width: parent.oneTypeWidth //parent.width
                                           height:  parent.height
                                           anchors.left: parent.left
                                           spacing: ui.basic_spacing // 2

                                           Row{
                                             id: measure_Row
                                             width: parent.width - arrow_Button.width
                                             height:  parent.height

                                             spacing: ui.basic_spacing / 2
                                             property real spacing_value: ui.basic_spacing * 3.5 / 8



                                             Measure_Block {
                                                 id: level_MeasureBlock
                                                 width: parent.width * 0.2 - measure_Row.spacing_value
                                                 height:  parent.height
                                                 measure_model: [-75, -35, -6, 0, 6, 35, 75]
                                                 no_values_model: [-6, 6]
                                                 x_start: 3 //19.2 //- 4.8
                                                 x_finish: 19 //- 4.8
                                                 //value: ChartPoints_Model.value.toFixed(2) //1
                                                 title: my_str.level

                                                 Component.onCompleted: {

                                                     level_MeasureLines.create_BorderSeries()
                                                 }

                                             }

                                             Measure_Block {
                                                 id: riht_Left_MeasureBlock
                                                 width:  parent.width * 0.15 - measure_Row.spacing_value
                                                 height:  parent.height
                                                 measure_model: [-30, 0, 3, 30]
                                                 no_values_model: [ 3, 30]
                                                 no_x_index: 3
                                                 x_start: 23 //- 3.95
                                                 x_finish: 32  //- 3.95 //41.355 // x_start + 0.17 * (level_MeasureBlock.x_finish - level_MeasureBlock.x_start) / 0.2
                                                 value: 1
                                                 title: my_str.riht_Left

                                                 Component.onCompleted: {

                                                     riht_Left_MeasureLines.create_BorderSeries()
                                                 }
                                             }

                                             Measure_Block {
                                                 id: riht_Right_MeasureBlock
                                                 width:  parent.width * 0.15 - measure_Row.spacing_value
                                                 height:  parent.height
                                                 measure_model: [-30, -3, 0, 30]
                                                 no_values_model: [-30, -3]
                                                 no_x_index: 0
                                                 x_start: 39 //- 2.95
                                                 x_finish: x_start + riht_Left_MeasureBlock.x_finish - riht_Left_MeasureBlock.x_start
                                                 value: 1
                                                 title: my_str.riht_Right

                                                 Component.onCompleted: {

                                                     riht_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                 id: sample_MeasureBlock
                                                 width:  parent.width * 0.2 - measure_Row.spacing_value
                                                 height:  parent.height
                                                 measure_model: [1510, 1512, 1520, 1538, 1546]
                                                 no_values_model: [1510]
                                                 x_start: 52 //- 2.3
                                                 x_finish: 68 //- 2.3
                                                 value: 1
                                                 title: my_str.widthTrack

                                                 Component.onCompleted: {

                                                     tmp_offset = tmp_offset + 10

                                                     sample_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                 id: down_Left_MeasureBlock
                                                 width:  parent.width * 0.15 - measure_Row.spacing_value
                                                 height:  parent.height
                                                 measure_model: [-10, 0, 10]
                                                 x_start: 72 //- 1
                                                 x_finish: 83 //- 1
                                                 value: 8
                                                 title: my_str.down_Left

                                                 Component.onCompleted: {

                                                     down_Left_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                 id: down_Right_MeasureBlock
                                                 width:  parent.width * 0.15 - measure_Row.spacing_value
                                                 height:  parent.height
                                                 measure_model: [-10, 0, 10]
                                                 x_start: 86 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title: my_str.down_Right

                                                 Component.onCompleted: {

                                                     down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }


                                           }

                                           Rectangle{
                                               id: arrow_Button
                                               width: 40
                                               radius: ui.radius
                                               height:  parent.height
                                               rotation:180

                                               color: "white"

                                               Custom_Icon{
                                                   id: icon
                                                   width: parent.width
                                                   height: parent.height
                                                   source: "qrc:/my_components/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"

                                                }

                                               MouseArea{
                                                   anchors.fill: parent
                                                   property bool check: false

                                                   onClicked: {

                                                       if(!check){

                                                           chartView.scrollRight(allMeasure_Row.width)

                                                           animMeasure.to = -1 * allMeasure_Row.width - ui.basic_spacing + arrow_Button.width

                                                           check = true

                                                       }
                                                       else{

                                                           chartView.scrollLeft(allMeasure_Row.width)

                                                           animMeasure.to = 0

                                                           check = false

                                                       }

                                                       animMeasure.stop()

                                                       animMeasure.start()
                                                   }
                                               }

                                           }

                                           Row{
                                             id: measureDop_Row
                                             width: parent.width
                                             height:  parent.height
                                             spacing: ui.basic_spacing / 2
                                             property real spacingDop_value: ui.basic_spacing * 1.5 / 4


                                             Measure_Block {
                                                 id: sideDamage_Left_MeasureBlock
                                                 width:  parent.width * 0.2 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 35]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title: "Боковой износ левый" //str.side_Damage

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                // id: sideDamage_Left_MeasureBlock
                                                 width:  parent.width * 0.2 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 35]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title:  "Боковой износ правый"

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }


                                             Measure_Block {
                                                 id: verticalDamage_Left_MeasureBlock
                                                 width:  parent.width * 0.2 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 15]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title: "Вертикальный износ левый" //str.vertical_Damage

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                 id: verticalDamage_Right_MeasureBlock
                                                 width:  parent.width * 0.2 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 15]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title: "Вертикальный износ правый" //str.vertical_Damage

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }


                                             Measure_Block {
                                                // id: sideDamage_Left_MeasureBlock
                                                 width:  parent.width * 0.2 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 35]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title:  "Приведённый износ"

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                 id: bowing_MeasureBlock
                                                 width:  parent.width * 0.2 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 15]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title: my_str.bowing

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }

                                             Measure_Block {
                                                 id: rolling_Surface_MeasureBlock
                                                 width:  parent.width * 0.4 - measureDop_Row.spacingDop_value
                                                 height:  parent.height
                                                 measure_model: [0, 15]
                                                 x_start: 88.2 //- 0.5
                                                 x_finish: x_start + down_Left_MeasureBlock.x_finish - down_Left_MeasureBlock.x_start
                                                 value: 10
                                                 title: my_str.rolling_Surface

                                                 Component.onCompleted: {

                                                     //down_Right_MeasureLines.create_BorderSeries()

                                                 }
                                             }


                                           }





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
                                                width: headerMeasure_Row.width
                                                height: parent.height
                                                clip: true

                                                Custom_Chart {
                                                   id: km_ChartView
                                                  // plotAreaColor: "red" //Style.background_Color

                                                   property real coef:  chart_Rectangle.width / chart_Rectangle.height

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

                                                   Measure_Speed{
                                                       id: speed_MeasureLines
                                                       x_start: speed_MeasureBlock.x_start
                                                       x_finish: speed_MeasureBlock.x_finish
                                                   }

                                                   ValueAxis_X{
                                                       id: xKm_ValueAxis
                                                       max: 35
                                                   }

                                                   ValueAxis_Y{
                                                       id: yKm_ValueAxis
                                                       max: chartView.max

                                                   }

                                                }

                                           }

                                           Item{
                                                width: parent.width - headerMeasure_Row.width
                                                height: parent.height
                                                clip: true

                                                Custom_Chart {
                                                   id: chartView

                                                   property real drop_value: 0

                                                   property real offset:  0.5

                                                   property int y_finish: 40

                                                   property int max: 100


                                                   Charts_Anim{
                                                       id: chart_anim
                                                   }

                                                   Measure_Logic {
                                                       id: measure_Logic

                                                   }

                                                    //  onWidthChanged: measure_Km.updatePointPosition();
                                                    //  onHeightChanged: measure_Km.updatePointPosition();



                                                   /*Measure_Km{
                                                       id: measure_Km

                                                       Component.onCompleted: {

                                                          // km_ChartView.setAxisY(yKm_ValueAxis)

                                                           create_RailsLine()

                                                        //   create_KmLine(20)
                                                       }

                                                   } */

                                                   /*Measure_Lines{  // Скорость
                                                     id: speed_MeasureLines
                                                     line_name: 60
                                                     model: speed_MeasureBlock.x_values_model
                                                     x_start: speed_MeasureBlock.x_start
                                                     x_finish: speed_MeasureBlock.x_finish

                                                   }*/


                                                   Measure_Lines{  // Уровень
                                                     id: level_MeasureLines
                                                     line_name: Name_Measures.Level_Measure
                                                     model: level_MeasureBlock.x_values_model
                                                     x_start: level_MeasureBlock.x_start
                                                     x_finish: level_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{ // Рихтовка левая
                                                     id: riht_Left_MeasureLines
                                                     line_name: Name_Measures.Riht_Left_Measure
                                                     model: riht_Left_MeasureBlock.x_values_model
                                                     no_values_model: [30]
                                                     x_start: riht_Left_MeasureBlock.x_start
                                                     x_finish: riht_Left_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{  // Рихтовка правая
                                                     id: riht_Right_MeasureLines
                                                     line_name: Name_Measures.Riht_Right_Measure
                                                     model: riht_Right_MeasureBlock.x_values_model
                                                     x_start: riht_Right_MeasureBlock.x_start
                                                     x_finish: riht_Right_MeasureBlock.x_finish
                                                   }

                                                   Measure_Lines{ // Шаблон
                                                     id: sample_MeasureLines
                                                     line_name: Name_Measures.Sample_Measure
                                                     model: sample_MeasureBlock.x_values_model
                                                     x_start: sample_MeasureBlock.x_start
                                                     x_finish: sample_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{ // Просадка левая
                                                     id: down_Left_MeasureLines
                                                     line_name:  Name_Measures.Down_Left_Measure
                                                     model: down_Left_MeasureBlock.x_values_model
                                                     x_start: down_Left_MeasureBlock.x_start
                                                     x_finish: down_Left_MeasureBlock.x_finish

                                                   }

                                                   Measure_Lines{ // Просадка правая
                                                     id: down_Right_MeasureLines
                                                     line_name: Name_Measures.Down_Right_Measure
                                                     model: down_Right_MeasureBlock.x_values_model
                                                     x_start: down_Right_MeasureBlock.x_start
                                                     x_finish: down_Right_MeasureBlock.x_finish
                                                   }



                                                   Measure_ViserLine{
                                                       id: viser_Line

                                                   }


                                                   ValueAxis_X{
                                                       id: x_ValueAxis
                                                       max: 100
                                                   }

                                                   ValueAxis_Y{
                                                       id: y_ValueAxis
                                                       max: chartView.max

                                                   }

                                                }

                                            }


                                       }


                                       Measure_Scroll{

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
                                        icon_path: "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                                       // needTip: true
                                        //tip_text: qsTr("Отметить пикет")
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

                                                  //        Chart_Work.get_points_line(value * 100)


                                                // viser_Line.update_ViserLine((value * 100))
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

                            Row{
                                width: parent.width
                                height: ui.height_Button


                                Sensors_Values{
                                    id: sensorsVal

                                    onIsPlay_ChartChanged: {

                                        startStop_Button.create_rotation_anim()

                                    }
                                }

                                Custom_Button{
                                    id: startStop_Button
                                    width: parent.width
                                    height: ui.height_Button
                                    outlined: true
                                    isIcon: true
                                    isCheck: sensorsVal.isPlay_Chart

                                    source: isCheck ? "qrc:/my_components/icons/"+ Style.theme + "/utils/pause.svg" : "qrc:/my_components/icons/"+ Style.theme + "/utils/play.svg"

                                    onClicked_Signal: {

                                        //console.log("Sensors_Values.isPlay_Chart = " + sensorsVal.isPlay_Chart)
                                       // create_rotation_anim()

                                        sensorsVal.setPlay(true);

                                        //Mqqt_Client.playPause_Chart()

                                        //Chart_Work.change_check_Draw(isCheck)


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


                            }




                        }


                        Km_Tables{
                            id: km_Tables
                            width: parent.width

                        }

                       /* List_With_Title{
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
                               title_name_model: [ str.km_big, str.set_speed, str.limit_speed, str.extent , qsTr("Оценка") ]
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

                        */
                    }

                }


            }


            Column{
                width:1000
                height: 48 * 3
                anchors.right: parent.right
                anchors.bottom: parent.bottom


               Row{
                   width:parent.width
                   height: 48

                   Button{
                       width: 200
                       height: parent.height
                       text:  qsTr("Новый километр")
                       onClicked: {

                          Mqqt_Client.test_slot_NewKm()

                       }

                   }

                   Button{
                       width: 200
                       height: parent.height
                       text:  qsTr("Новые параметры")
                       onClicked: {

                          Mqqt_Client.test_slot_NewParams()

                       }

                   }

                   Button{
                       width: 200
                       height: parent.height
                       text:  qsTr("Новая общая информация")
                       onClicked: {

                          Mqqt_Client.test_slot_NewGeneralInfo()

                       }

                   }

                   Button{
                       width: 200
                       height: parent.height
                       text:  qsTr("Закрыть микросервис")
                       onClicked: {

                          Mqqt_Client.test_slot_CloseExportMicroservice()

                       }

                   }
               }

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

                           chartView.drop_value += measure_Logic.dropLine(40)

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
                        text:  qsTr("Task Values")
                        onClicked: {

                           Mqqt_Client.test_slot()

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

                             push_Notification.open()

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
                         text:  qsTr("print_pdf")
                         onClicked: {

                            // km_ChartView.scrollDown(20)

                             Mqqt_Client.print_pdf()

                             //my_pdf.print_pdf()

                           //  chartView.scrollRight(100)

                           //  viser_Line.update_ViserLine(50)


                         }

                     }

                     Button{
                         width: 100
                         height: parent.height
                         text:  qsTr("вниз")
                         onClicked: {

                             chart_anim.create_Main_Scroll(chart_Rectangle.height / 10, false)

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

                             chart_anim.create_Main_Scroll(30, true)



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

                                 km_Tables.open()

                             }
                             else{

                                 check = false

                                 km_Tables.close()


                             }

                              //level_MeasureLines.add_point_border()

                         }


                     }
                 }

            }


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


