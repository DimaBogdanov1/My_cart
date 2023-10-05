import QtQuick 2.0

Row{
   id: root_Row
   width: label.width + icon_size
   height: parent.height
   spacing: ui.basic_spacing / 2

   property string text

   property string source

   property real icon_size: ui.icon_nav_size

   Custom_Rectangle_Label {
       id: label
       margin_text: 0
       height: parent.height
       text: root_Row.text

   }

   Custom_Icon{
      // width: parent.width - label.width
       height: parent.height
       icon_size: root_Row.icon_size
       source: root_Row.source

    }
}
