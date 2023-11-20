import QtQuick 2.15
import Style 1.0

import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property string text

    property int isAscending

    property bool visibleSort

    signal clicked_Signal(isAscending: bool)

    Row{
        width: parent.width
        height: parent.height
        spacing: ui.basic_spacing

        Custom_Rectangle_Label {
          //  width: parent.width - ui.icon_nav_size
            height: parent.height
            needBack: false
            horizontal: Text.AlignLeft
            font_weight: ui.font_weight_Bigsize
            font_family: customTitle_FontLoader.name
            text: root_Item.text
        }

        Custom_Icon{
            id: icon
            height: parent.height
            visible: root_Item.visibleSort
            source: "qrc:/icons/" + Style.theme + "/utils/arrow_bottom_mini.svg"


         }
    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
        //outlined:
       // color: root_Item.color

        onClicked_Signal: {


            if(root_Item.visibleSort){

                button_Anim.create_rotation_anim(true)

                if(isAscending == 1){

                    isAscending = 0

                    //button_Anim.create_rotation_anim(true)
                }
                else{

                    isAscending = 1
                   // button_Anim.create_rotation_anim(isAscending)

                }
            }


            root_Item.clicked_Signal(isAscending)

        }


    }

    Button_Anim{
        id: button_Anim
        animation_target: icon
    }

}

