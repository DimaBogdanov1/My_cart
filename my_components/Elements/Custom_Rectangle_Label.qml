import QtQuick 2.0
import QtQuick.Controls 2.15

import my_components 1.0
import Style 1.0


Rectangle {
   id: root
   width: parent.width
   height: parent.height
   color: Style.background_Color
   radius: ui.radius_mini

   property string border_color: Style.background_Color

   border{

       width: ui.border_Size
       color: border_color
   }

   property string text

   Custom_Label{
        id: label
        horizontalAlignment: Text.AlignHCenter
        text: root.text

        onTextChanged: {

            root.width = label.paintedWidth + 32

            root.height = label.paintedHeight + 16

        }


   }
}
