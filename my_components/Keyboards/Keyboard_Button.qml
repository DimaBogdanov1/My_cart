import QtQuick 2.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    signal clicked_Signal

    property string text

    property string color

    property string source: ""

    property bool isIcon

    property bool caps

    property int bottom_button_index: -1


    Custom_Button{
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        outlined: !isIcon
        anchors.centerIn: parent
       // anchors.horizontalCenter: parent.horizontalCenter
        pixelSize: ui.text_MiddleSize
        isIcon:  root_Item.isIcon
        source: root_Item.source
          isOnlyText: true
        text:  root_Item.caps ? root_Item.text : root_Item.text.toLowerCase()

        onClicked_Signal: {

          //  root_Item.clicked_Signal()

            if(bottom_button_index != -1){

                switch(bottom_button_index){

                case 0:

                    keyboard_Logic.change_language()

                    break

                case 1:

                    keyboard_Logic.add_dot()

                    break

                case 2:

                    keyboard_Logic.add_space()

                    break

                case 3:

                    keyboard_Logic.enter()

                    break

                case 4:

                    keyboard_Logic.change_caps()

                    break

                case 5:

                    keyboard_Logic.delete_symbol()

                    break

                case 6:

                    keyboard_Logic.add_dot_number()

                    break

                case 7:

                    keyboard_Logic.check_sign()

                    break
                }
            }
            else{

                keyboard_Logic.add_symbol(text)

            }



        }


    }

}
