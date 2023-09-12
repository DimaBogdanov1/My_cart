import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

import Style 1.0
import my_components 1.0

Slider {

    id: slider
    property int radius_Rectangle: 30 // Радиус Скругления

    property int size_Rectangle:  ui.height_Button /2 // Размер Прямоугольника

    property int slider_stepSize // Значение Шага Слайдера

    property real opacity_handle: 0

    property real scale_Handle: 1


    readonly property real startOpacity_Handle: 0.2

    readonly property real max_scale_Handle: 1.2

    onHoveredChanged: {

        console.log("ssss  " + slider.hovered.toString())

    }

    onPressedChanged: {

        if(pressed) {

          start_anim.start()
        }
        else {

          close_anim.start()
       }
    }



    ParallelAnimation{

       id: close_anim
       NumberAnimation {target: slider; property: "opacity_handle"; from: startOpacity_Handle ; to: 0; duration: 250 }

       NumberAnimation {target: slider; property: "scale_Handle"; from: max_scale_Handle ; to:  1 ; duration: 250 }

    }


    SequentialAnimation {

       id: start_anim

       ParallelAnimation{

           NumberAnimation {target: slider; property: "opacity_handle"; from: 0 ; to: startOpacity_Handle; duration: 250 }

           NumberAnimation {target: slider; property: "scale_Handle"; from: 1 ; to:  max_scale_Handle ; duration: 250 }

       }
    }


    stepSize: slider_stepSize // Шаг Слайдера


    style: SliderStyle {

        groove: Rectangle {
                    implicitHeight: 4
                    layer.enabled: true
                    layer.effect: Mask_Rectangle{target: parent; radius: 30}

                    Main_Gradient{}

                    Rectangle {
                        implicitHeight: parent.implicitHeight
                        color: Style.primaryDark_Color
                        anchors.right: parent.right
                        //radius: radius_Rectangle
                        implicitWidth: (parent.width * (control.maximumValue - control.value)) /  control.maximumValue //* parent.width///control.value / control.maximumValue * parent.width

                    }


        }



        handle: Item {

                    Rectangle {
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

                    }



                    Rectangle {
                        id: background_Rectangle
                        implicitWidth: size_Rectangle * 2
                        implicitHeight: size_Rectangle * 2
                        color: Style.accent_Color
                        anchors.centerIn: parent
                        opacity: slider.opacity_handle
                        radius: radius_Rectangle


                    }


        }
    }


}
