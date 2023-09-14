import QtQuick 2.15

import QtGraphicalEffects 1.0

import Style 1.0
import my_components 1.0

Rectangle {

    anchors.fill: parent

    property real x_start: popup.x

    property real y_start: popup.y

    property real x_finish: popup.width

    property real y_finish: popup.height

    height: parent.height
    layer.enabled: true
    layer.effect: Mask_Rectangle{target: parent}

    ShaderEffectSource {
      id: effectSource
      sourceItem: root_Page
      anchors.fill: parent
      sourceRect: Qt.rect(x_start, y_start, x_finish, y_finish)
    }

    FastBlur{
      id: blur
      anchors.fill: effectSource
      source: effectSource
      radius: 60
    }

}
