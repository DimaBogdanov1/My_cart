import QtQuick 2.15
import My_Sensors_Values 1.0

import Map_Values 1.0

import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height


    Flickable_Page{
        id: page
        width: parent.width
        height: parent.height
        need_Top_Bar: false
        title: my_str.page_Names.diagnostic_Page

        sourceComponent: Component {

            Custom_Rectangle_Label{
                id: root_Rectangle
                width: parent.width
                height: parent.height// - topBar.height - title.height
                needBack: true
                needBorder: true
                text: "Тут будет страница диагностики!"

                My_Sensors_Values{
                    id: sensorsVal
                }

                Map_Values{
                    id: map_values_1
                }

                Map_Values{
                    id: map_values_2
                }

                Row{
                    width: parent.width
                    height: 80
                    anchors.bottom: parent.bottom
                    spacing:ui.basic_spacing

                    Custom_Rectangle_Label {
                        width: 100
                        height: 40
                        text: "charge = " + sensorsVal.charge_percent
                    }


                    /*Row{
                        width: parent.width
                        height: 50
                        spacing: 30


                        /*Navigation_Map{
                            id: map
                            width: 200
                            height: parent.height

                        }

                        Navigation_Map{
                            width: 200
                            height: parent.height

                        }
                    }*/

                    Custom_Rectangle_Label {
                        width: 100
                        height: 40
                        text: "yaw_value 1 = " + map_values_1.yaw_value
                    }

                    Custom_Rectangle_Label {
                        width: 100
                        height: 40
                        text: "yaw_value 2 = " + map_values_2.yaw_value
                    }


                }


            }



        }

    }


}



