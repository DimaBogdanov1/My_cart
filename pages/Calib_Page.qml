import QtQuick 2.15
import QtQuick.Controls 2.15

import qml.measure 1.0
import Style 1.0

import my_components 1.0


Item {
    id: root_Item
    width: parent.width
    height: parent.height

    readonly property int measure_Block_Width: 200

    readonly property int rail_Block_Width: 200

    readonly property int x_offset: 60

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.background_Color

        Item {
            width: parent.width - ui.big_spacing
            height: parent.height - ui.big_spacing
            anchors.centerIn: parent

            Row{
                id: row
                width: parent.width
                height: parent.height
                spacing: ui.basic_spacing

                Rectangle {
                    id: menu_Rectangle
                    width: 500
                    height: parent.height
                    radius: ui.radius
                    color: Style.light_Color

                    Column{
                        width: parent.width - 40
                        height: parent.height  - 40
                        anchors.centerIn: parent
                        spacing: ui.basic_spacing * 2


                        Calib_Block{
                            id: riht_Left_Calib_Block
                            index_block: Name_Measures.Riht_Left_Measure
                            text: str.riht_Left
                        }

                        Calib_Block{
                            id: riht_Right_Calib_Block
                            index_block: Name_Measures.Riht_Right_Measure
                            text: str.riht_Right
                        }

                        Calib_Block{
                            id: down_Left_Calib_Block
                            index_block: Name_Measures.Down_Left_Measure
                            text: str.down_Left
                        }

                        Calib_Block{
                            id: down_Right_Calib_Block
                            index_block: Name_Measures.Down_Right_Measure
                            text: str.down_Right
                        }


                        Row{
                            width: parent.width
                            height: ui.height_Button
                            spacing: ui.basic_spacing

                            Custom_Button{
                                width: parent.width / 2 - ui.basic_spacing / 2
                                height: ui.height_Button
                                text: qsTr("По умолчанию")

                                onClicked_Signal: {

                                    riht_Left_Calib_Block.set_default_value(0, 1)

                                    riht_Right_Calib_Block.set_default_value(0, 1)

                                    down_Left_Calib_Block.set_default_value(0, 1)

                                    down_Right_Calib_Block.set_default_value(0, 1)

                                    // Временно
                                    Chart_Work.change_param_measure(0, 0 , 1);

                                    Chart_Work.change_param_measure(3, 0 , 1);

                                }

                            }

                            Custom_Button{
                                width: parent.width / 2 - ui.basic_spacing / 2
                                height: ui.height_Button
                                text: qsTr("Ок")

                                onClicked_Signal: {

                                    riht_Left_Calib_Block.update_param()

                                    riht_Right_Calib_Block.update_param()

                                    down_Left_Calib_Block.update_param()

                                    down_Right_Calib_Block.update_param()

                                  //  Chart_Work.change_param_measure(Name_Measures.Sample_Measure, 10, 3);

                                 //   Chart_Work.change_param_measure(4, 6770, 38);

                                }

                            }

                        }




                    }


                }

                Rectangle {
                    width: parent.width - menu_Rectangle.width - ui.basic_spacing
                    height: 500 //parent.height - ui.big_spacing
                    radius: ui.radius
                    color: Style.light_Color


                    Column{
                        width: parent.width
                        height: parent.height
                        spacing: 16

                        Rectangle{
                            width: root_Item.rail_Block_Width * 2 + root_Item.measure_Block_Width + root_Item.x_offset * 2
                            height: 300
                            color: "orange"
                            anchors.horizontalCenter: parent.horizontalCenter

                            Item{
                                width:  parent.width - root_Item.x_offset * 2
                                anchors.centerIn: parent
                                height:  parent.height / 4

                                Calib_Rail{
                                    id: rails_1
                                    width: root_Item.rail_Block_Width
                                }

                                Item{
                                    id: measure_Item
                                    width: root_Item.measure_Block_Width
                                    height: 100
                                    anchors.centerIn: parent

                                    Column{
                                        width: parent.width
                                        height: parent.height

                                        Custom_Rectangle_Label {
                                            id: label
                                            text: sample_Slider.value.toFixed(1)
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            needBorder: true

                                        }

                                        Row{
                                            width: parent.width
                                            height: ui.icon_nav_size

                                            Custom_Icon{
                                                width:  ui.icon_nav_size
                                                height: parent.height
                                                source: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"

                                             }

                                            Item{
                                                width:  parent.width - 2 * ui.icon_nav_size
                                                height: ui.icon_nav_size

                                                Custom_Border{
                                                    height:  2
                                                    radius: 2
                                                    color: Style.primaryDark_Color
                                                    anchors.verticalCenter: parent.verticalCenter

                                                }
                                            }

                                            Custom_Icon{
                                                width:  ui.icon_nav_size
                                                height: parent.height
                                                rotation: 180
                                                source: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"

                                             }

                                        }


                                    }

                                }

                                Calib_Rail{
                                    id: rails_2
                                    width: root_Item.rail_Block_Width

                                    Component.onCompleted: {

                                        x = root_Item.rail_Block_Width + root_Item.measure_Block_Width
                                    }

                                }

                            }

                        }



                        Custom_Border{
                            id: level_Measure
                            width: 200
                            height:  2
                            radius: 2
                            color: Style.primaryDark_Color

                        }


                        Custom_Rectangle_Label {
                            id: level_Label
                            anchors.horizontalCenter: parent.horizontalCenter
                            needBorder: true

                        }

                        Custom_Slider{
                            id: sample_Slider
                            width: parent.width

                            onValueChanged: {

                               rails_1.x = -1 * value * root_Item.x_offset

                               rails_2.x = rails_2.width + root_Item.measure_Block_Width + value * root_Item.x_offset

                               measure_Item.width = root_Item.measure_Block_Width + value * root_Item.x_offset * 2

                            }

                           // anchors.centerIn: parent

                        }

                        Custom_Slider{
                            id: level_Slider
                            width: parent.width

                            onValueChanged: {

                                rails_1.y = -1 * value * rails_1.height

                                rails_2.y = value * rails_2.height

                                var alpha =  Math.atan(Math.abs(rails_1.y - rails_2.y) /level_Measure.width) * 180.0 / Math.PI

                                level_Measure.rotation =  alpha

                                level_Label.text = alpha.toFixed(1) + "°"
                            }

                           // anchors.centerIn: parent

                        }


                        Canvas_Rail{
                            width: 200
                            height: 300
                        }

                        Custom_Button{
                            width: 200
                            height: ui.height_Button
                            anchors.horizontalCenter: parent.horizontalCenter
                            text:  qsTr("Up")
                            onClicked_Signal: {


                                   keyboard.open(100)
                            }

                        }

                        Custom_Button{
                            width: 200
                            height: ui.height_Button
                            anchors.horizontalCenter: parent.horizontalCenter
                            text:  qsTr("Down")
                            onClicked_Signal: {


                                   keyboard.close()
                            }

                        }



                        TextField {
                            id: textField_1000
                            placeholderText: qsTr("Enter name")

                            onFocusChanged: {

                                if(focus){

                                    toast.show("1", 3000, 1)

                                }
                            }
                        }
                    }



                }


            }

        }
    }



}

