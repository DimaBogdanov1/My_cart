import QtQuick 2.15

import Style 1.0
import my_components 1.0

Item{
    width: parent.width
    height: parent.height
   // color: "red"
    clip: true

    Item{
       width: parent.width
       height: parent.height// - ui.block_height - ui.height_Button - 2 * ui.middle_spacing
      // clip: true

       Custom_Icon{
           id: icon
           //width: parent.width
          // height: parent.height
           icon_size: parent.width
           source: "qrc:/images/original.jpg"
           anchors.centerIn: parent

       }
    }

    Item{
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        anchors.centerIn: parent
        //spacing: ui.middle_spacing

        Custom_Row_ComboBox{
            width: parent.width
            anchors.bottom: parent.bottom
            needIcon: false
            miniSize: true
            source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
            model:ListModel {

                ListElement {
                    title: qsTr("Следующий километр")
                    values: [
                        ListElement { value: "111 км" },
                        ListElement { value: "112 км" }
                        ]

                }
            }
        }

    }



}
