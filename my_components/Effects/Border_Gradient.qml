import QtQuick 2.15
import QtGraphicalEffects 1.0

import Style 1.0
import my_components 1.0

Item {
   id: root_Item
   width: parent.width
   height: parent.height
   property int radius: ui.radius

   property bool off: false

   property real  border_width: ui.border_Size

   Loader {
       id: loader
       anchors.fill: parent
       sourceComponent: border
   }

   Component {
       id: border
       Item {
           Rectangle {
               id: borderFill
               radius: root_Item.radius
               anchors.fill: parent
               visible: false

               Main_Gradient{off: root_Item.off}
           }

           Rectangle {
               id: mask
               radius: root_Item.radius
               border.width: root_Item.border_width
               anchors.fill: parent
               color: 'transparent'
               visible: false   // otherwise a thin border might be seen.
           }

           OpacityMask {
               id: opM
               anchors.fill: parent
               source: borderFill
               maskSource: mask
           }
       }
   }

}
