import QtQuick 2.0
import QtQuick.Window 2.12
import QtQml.Models 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4

import Style 1.0

Slider {

    property int radius_Rectangle: 30 // Радиус Скругления

    property int size_Rectangle: 14 // Размер Прямоугольника

    property int slider_stepSize // Значение Шага Слайдера

    property real opacity_Handle: 0.2 // Значение Прозрачности Handle

    property real scale_Handle: 1.2 // Значение Маштабирования Handle


    stepSize: slider_stepSize // Шаг Слайдера

    style: SliderStyle {

        groove: Rectangle {
                    implicitHeight: 4
                    radius: 30
                    color: Style.accentLight_Color

                    Rectangle {
                        implicitHeight: parent.implicitHeight
                        color: Style.accent_Color
                        radius: radius_Rectangle
                        implicitWidth: control.value / control.maximumValue * parent.width
                    }


        }



        handle: Item {

                    Rectangle {
                        id: move_Rectangle
                        implicitWidth: size_Rectangle
                        implicitHeight: size_Rectangle
                        border.color: Style.accent_Color
                        border.width: 2
                        color: Style.light_Color
                        anchors.centerIn: parent
                        radius: radius_Rectangle

                    }

                    Rectangle {
                        id: background_Rectangle
                        objectName: control.value // Меняем Имя Объекта, Чтобы К Нему Можно Было Достучаться (По Другому Я Не Знаю Как)
                        implicitWidth: size_Rectangle * 2
                        implicitHeight: size_Rectangle * 2
                        color: Style.accent_Color
                        anchors.centerIn: parent
                        opacity: 0
                        radius: radius_Rectangle

                        onObjectNameChanged: {

                            move_SequentialAnimation.stop() // Завершаем Старую Анимацию

                            move_SequentialAnimation.start() // Начинаем Новую Анимацию
                        }


                        SequentialAnimation {

                           id: move_SequentialAnimation

                           ParallelAnimation{

                               NumberAnimation {target: background_Rectangle; property: "opacity"; from: 0 ; to: opacity_Handle; duration: 250 }

                               NumberAnimation {target: move_Rectangle; property: "scale"; from: 1 ; to:  scale_Handle ; duration: 250 }

                           }

                           ParallelAnimation{

                               NumberAnimation {target: move_Rectangle; property: "scale"; from: scale_Handle ; to:  1 ; duration: 250 }

                               NumberAnimation {target: background_Rectangle; property: "opacity"; from: opacity_Handle ; to:  0 ; duration: 250 }

                           }



                        }

                    }


        }
    }


}
