import QtQuick 2.0
import QtQuick.Controls 2.15

import my_components 1.0
import Style 1.0

ToolTip {
    id: toolTip
   // x: -72
    y: -18
    property bool needTip

    contentItem: Item{
        //id: label
      //  horizontalAlignment: Text.AlignHCenter
       // text: toolTip.text

    }

    background: Custom_Rectangle_Label {
            id: label
            text: toolTip.text
            needBorder: true
            margin_text: 32

            onWidthChanged: {

                toolTip.x = -1 * label.width * 0.75
            }
        }

    enter: popups_Anim.get_enter()

    exit: popups_Anim.get_exit()

    function show_ToolTip(text){

        if(needTip){

            toolTip.show("ss")
            toolTip.text = text

           // opacity_Anim.open_anim()
        }


    }

    function close_ToolTip(){

        if(needTip){

         //   opacity_Anim.close_anim()

            toolTip.close()

        }

    }


    Popups_Anim{
        id: popups_Anim

    }
}
