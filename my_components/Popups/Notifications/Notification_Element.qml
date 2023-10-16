import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0


Item{
   id: root_Item
   width: parent.width
   height:  ui.height_Button *  2 //2.5

   property string text

   property int status


    Rectangle{
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        radius: ui.radius
        color: Style.light_Color

        Row{
            width: parent.width - ui.big_spacing
            height: parent.height - ui.big_spacing
            anchors.centerIn: parent

            Custom_Rectangle_Label {
                width: parent.width - status_Indicator.width
                height: parent.height
                wrap: Text.WordWrap
                horizontal: Text.AlignLeft
                vertical: Text.AlignTop

                clip: true
                needBack: false
                text: root_Item.text
            }

            Status_Indicator{
                id: status_Indicator
                height: width
                status: root_Item.status
            }

        }
    }

}
