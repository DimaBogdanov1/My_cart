import QtQuick 2.0
import QtQuick.Controls 2.15

import my_components 1.0

ListView{
   width: parent.width
   height: parent.height
   currentIndex: 0
   clip: true
  // focus: true

   property int last_index: -1

   ScrollBar.vertical: List_ScrollBar{}

   /*add: Transition {
           NumberAnimation { properties: "y"; from: -1 * parent.height; duration: 500 }
       }*/
}
