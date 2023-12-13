import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

import Style 1.0
import my_components 1.0

Slider {

    property int size_Rectangle:  ui.height_Button /2 // Размер Прямоугольника

    property real correction: 0 //0.05

    width: 4
    height: parent.height - size_Rectangle //* 2
    anchors.centerIn: parent
    rotation: 180
   // stepSize: 0.01

    minimumValue: correction
    maximumValue: 1 - correction

    orientation: Qt.Vertical

    style: SliderStyle {

        groove: Rectangle {
                    implicitHeight: 4
                    color: Style.light_Color
                    layer.enabled: true
                    layer.effect: Mask_Rectangle{target: parent; radius: 30}


        }

        handle: Item {
            implicitWidth: size_Rectangle
            implicitHeight: size_Rectangle

            Custom_Icon{
                width: parent.width
                height: parent.height
                rotation: -90
                source: "qrc:/icons/light_theme/utils/shield.svg"

             }

            /*Rectangle {
                id: move_Rectangle
                scale: slider.scale_Handle

                implicitWidth: size_Rectangle
                implicitHeight: size_Rectangle
                //border.color: Style.accent_Color
              //  border.width: 2
                anchors.centerIn: parent
             //   radius: radius_Rectangle
                layer.enabled: true
                layer.effect: Mask_Rectangle{target: move_Rectangle; radius: radius_Rectangle}

                Border_Gradient{ border_width: 2}

            }*/

        }




    }

    function show_hide_viser(value){

        if(value){

            chart_Anim.to = charts_Item.width - viser_Rectangle.width - ui.basic_spacing / 2

            viser_Anim.to = 0 // from -1 * viser_Rectangle.width - ui.basic_spacing
        }
        else{

            chart_Anim.to = charts_Item.width

            viser_Anim.to = -1 * viser_Rectangle.width - ui.basic_spacing

        }

        show_hide_Anim.stop()

        show_hide_Anim.start()
    }

    ParallelAnimation{

        id: show_hide_Anim
        NumberAnimation {id: chart_Anim; target: charts_Column; property: "width"; from: charts_Column.width; to: charts_Column.width - viser_Rectangle.width - ui.basic_spacing / 2; duration: 250 }

        NumberAnimation {id: viser_Anim;  target: viser_Rectangle; property: "anchors.rightMargin"; from: viser_Rectangle.anchors.rightMargin; to:0; duration: 250 }

    }
}
