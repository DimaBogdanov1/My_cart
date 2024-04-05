import QtQuick 2.15
import My_Sensors_Values 1.0

import Map_Values 1.0

import my_components 1.0

Rectangle {
    anchors.fill: parent
    color: "red"


    My_Sensors_Values{
        id: sensorsVal
    }

    Map_Values{
        id: map_values_1
    }

    Map_Values{
        id: map_values_2
    }

    Column{
        width: parent.width
        height: parent.height

        Custom_Rectangle_Label {
            width: 100
            height: 40
            text: "charge = " + sensorsVal.charge_percent
        }


        Row{
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

            }*/
        }

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
