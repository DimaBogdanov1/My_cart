import QtQuick 2.15

import Style 1.0
import my_components 1.0

Item{
    width: parent.width
    height: parent.height
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

        Custom_Row_TextField{
            id: roadInfo_TextField
            source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"
            start_Keyboard: 0 //root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
            needIcon: false
            miniSize: true
            anchors.bottom: parent.bottom
            model: ListModel{

                ListElement{
                    title: qsTr("Комментарий")
                    isLetter: false
                    maximumLength: 5

                }

            }

        }

    }



}
