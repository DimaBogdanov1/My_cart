import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_Button

    property string title

    signal checked_Signal(value: bool)

    property bool checked

    Row{
        width: parent.width
        height: parent.height
        spacing: ui.basic_spacing

        Custom_Rectangle_Label{
            width: parent.width - ui.icon_nav_size - ui.basic_spacing
            height: parent.height
            needBack: false
           // color: "blue" // Меняем Цвет Текста
            horizontal: Text.AlignLeft
            //vertical: Text.AlignTop
            text: title

        }


        Item{
            width: ui.icon_nav_size
            height: parent.height
            //color: "red"

            Custom_Checkbox{
                id: my_Checkbox
                checked: root_Item.checked

                anchors{

                    verticalCenter: parent.verticalCenter
                    //right: parent.right

                }


               // onCheckedChanged: {

                 //   checked_Signal(checked)

               // }
            }
        }

    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
       // outlined: true//root_Item.outlined
        //color: root_Item.color

        onClicked_Signal: {

           // glow.change_glow(true)

            //root_Item.clicked_Signal()

            if(my_Checkbox.checked){

                my_Checkbox.checked = false

            }
            else{

                my_Checkbox.checked = true

            }

            checked_Signal(my_Checkbox.checked)

        }

        onHover_Signal: {

         //   glow.change_glow(value)

        }
    }

}

