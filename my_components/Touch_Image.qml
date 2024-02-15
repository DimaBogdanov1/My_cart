import QtQuick 2.6

import Style 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height:  parent.height

    property string source

    property string color: Style.light_Color

    property string color_Border: Style.primaryDark_Color

    property int highestZ: 0
    property real defaultSize: 200
    property var currentFrame: undefined
    property real surfaceViewportRatio: 1.5

    Rectangle{
        id: root_Rectangle
         width: parent.width
         height:  parent.height
         radius: ui.radius
         color: root_Item.color //Style.background_Color

         layer.enabled: true
         layer.effect: Mask_Rectangle{target: this; radius: root_Rectangle.radius}

         Flickable {
             id: flick
             anchors.fill: parent
             contentWidth: width * surfaceViewportRatio
             contentHeight: height * surfaceViewportRatio

            /* Rectangle {
                 id: photoFrame
                 width: image.width * (1 + 0.10 * image.height / image.width)
                 height: image.height * 1.10
                 scale: defaultSize / Math.max(image.sourceSize.width, image.sourceSize.height)

                 color: "red"
                 Behavior on scale { NumberAnimation { duration: 200 } }
                 Behavior on x { NumberAnimation { duration: 200 } }
                 Behavior on y { NumberAnimation { duration: 200 } }

                 smooth: true
                 antialiasing: true


                PinchArea {
                     anchors.fill: parent
                     pinch.target: photoFrame
                     pinch.minimumRotation: -360
                     pinch.maximumRotation: 360
                     pinch.minimumScale: 0.1
                     pinch.maximumScale: 10
                     pinch.dragAxis: Pinch.XAndYAxis
                     onPinchStarted: setFrameColor();
                     property real zRestore: 0
                     onSmartZoom: {
                         if (pinch.scale > 0) {
                             photoFrame.rotation = 0;
                             photoFrame.scale = Math.min(root.width, root.height) / Math.max(image.sourceSize.width, image.sourceSize.height) * 0.85
                             photoFrame.x = flick.contentX + (flick.width - photoFrame.width) / 2
                             photoFrame.y = flick.contentY + (flick.height - photoFrame.height) / 2
                             zRestore = photoFrame.z
                             photoFrame.z = ++root.highestZ;
                         } else {
                             photoFrame.rotation = pinch.previousAngle
                             photoFrame.scale = pinch.previousScale
                             photoFrame.x = pinch.previousCenter.x - photoFrame.width / 2
                             photoFrame.y = pinch.previousCenter.y - photoFrame.height / 2
                             photoFrame.z = zRestore
                             --root.highestZ
                         }
                     }

                     MouseArea {
                         id: dragArea
                         hoverEnabled: true
                         anchors.fill: parent
                         drag.target: photoFrame
                         scrollGestureEnabled: false  // 2-finger-flick gesture should pass through to the Flickable
                         onPressed: {
                             photoFrame.z = ++highestZ;
                             parent.setFrameColor();
                         }
                        // onEntered: parent.setFrameColor();
                         onWheel: {
                             if (wheel.modifiers & Qt.ControlModifier) {
                                 photoFrame.rotation += wheel.angleDelta.y / 120 * 5;
                                 if (Math.abs(photoFrame.rotation) < 4)
                                     photoFrame.rotation = 0;
                             } else {
                                 photoFrame.rotation += wheel.angleDelta.x / 120;
                                 if (Math.abs(photoFrame.rotation) < 0.6)
                                     photoFrame.rotation = 0;
                                 var scaleBefore = photoFrame.scale;
                                 photoFrame.scale += photoFrame.scale * wheel.angleDelta.y / 120 / 10;
                             }
                         }
                     }

                 }

             }

             */

             Image {
                 id: image
                 anchors.centerIn: parent
                 antialiasing: true
                 smooth: false // Убираем Сглаживание
                 source: root_Item.source
                 fillMode: Image.PreserveAspectFit



              }

         }

         Timer { id: scrollFadeTimer; interval: 1000; onTriggered: { hfade.start(); vfade.start() } }

         Rectangle {
             id: verticalScrollDecorator
             anchors.right: parent.right
             anchors.margins: 2
             color: root_Item.color_Border // Style.light_Color
             width: 3
             radius: ui.radius
             antialiasing: true
             height: flick.height * (flick.height / flick.contentHeight) - (width - anchors.margins) * 2
             y: (flick.contentY - flick.originY) * (flick.height / flick.contentHeight)
             NumberAnimation on opacity { id: vfade; to: 0; duration: 500 }
             onYChanged: { opacity = 1.0; scrollFadeTimer.restart() }
         }

         Rectangle {
             id: horizontalScrollDecorator
             anchors.bottom: parent.bottom
             anchors.margins: 2
             color: root_Item.color_Border //Style.light_Color
             height: 3
             radius: ui.radius
             antialiasing: true
             width: flick.width * (flick.width / flick.contentWidth) - (height - anchors.margins) * 2
             x: (flick.contentX - flick.originY) * (flick.width / flick.contentWidth)
             NumberAnimation on opacity { id: hfade; to: 0; duration: 500 }
             onXChanged: { opacity = 1.0; scrollFadeTimer.restart() }
         }





    }

}

