import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_Button

    property string title

    property string link

    Row{
        width: parent.width
        height: ui.height_Button

        Custom_Rectangle_Label{
            width: parent.width - ui.icon_nav_size
            height: parent.height
            needBack: false
            //color: "blue" // Меняем Цвет Текста
            horizontal: Text.AlignLeft
            //vertical: Text.AlignTop
            text: title

        }


        Custom_Icon{
            height: parent.height
            rotation: 180
            source: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg" // "qrc:/icons/" + Style.theme + "/navigation/home.svg"

         }

    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
       // outlined: true//root_Item.outlined
        //color: root_Item.color

        onClicked_Signal: {

           Qt.openUrlExternally(link)

        }

        onHover_Signal: {

         //   glow.change_glow(value)

        }
    }


}
