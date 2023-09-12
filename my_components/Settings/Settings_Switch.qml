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

        Custom_Rectangle_Label{
            width: parent.width - ui.height_Button
            height: parent.height
            needBack: false
           // color: "blue" // Меняем Цвет Текста
            horizontal: Text.AlignLeft
            //vertical: Text.AlignTop
            text: title

        }


        Item{
            width: ui.height_Button
            height: parent.height

            Custom_Switch{
                id: my_Switch
                checked: root_Item.checked
                //verticalCenter: parent.verticalCenter

                onCheckedChanged: {

                    checked_Signal(checked)

                }
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

            if(my_Switch.checked){

                my_Switch.checked = false

            }
            else{

                my_Switch.checked = true

            }

            checked_Signal(my_Switch.checked)

        }

        onHover_Signal: {

         //   glow.change_glow(value)

        }
    }

}

