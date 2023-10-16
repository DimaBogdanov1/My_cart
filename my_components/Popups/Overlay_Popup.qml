import QtQuick 2.15
import QtGraphicalEffects 1.0

import Style 1.0

Item {

   Rectangle{
       anchors.fill: parent
       color: Style.primaryDark_Color
       opacity: 0.02
   }


    /*ShaderEffectSource {
      id: effectSource
      sourceItem: root_Page
      anchors.fill: parent
      sourceRect: Qt.rect(root_Page.x,root_Page.y,root_Page.width,root_Page.height)
    }
    FastBlur{
      id: blur
      anchors.fill: effectSource
      source: effectSource
      radius: 65
    } */

}
