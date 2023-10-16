import QtQuick 2.0

import Style 1.0
import my_components 1.0

Rectangle {
    id: root_Item
    width: parent.width
    height: ui.height_Button
    radius: ui.radius
    color: Style.background_Color

    border{

        //width: ui.border_Size
        //color: Style.primaryDark_Color
    }

    property int index: 0

    property int margin_block: 6

    property var model: []

   // property string color: Style.accent_Color

    onIndexChanged: {

        transition_Anim.create_x_anim( highlight_Item.width * index)

    }

    Item{
        id: highlight_Item
        width: parent.width  / repeater.count //width: parent.width / 2
        height: parent.height

       // Highlight_Glow{id: glow; target: highlight_Rectangle;}

        Rectangle {
           id: highlight_Rectangle
           width: parent.width - root_Item.margin_block
           height: parent.height - root_Item.margin_block
           anchors.centerIn: parent
           layer.enabled: true
           layer.effect: Mask_Rectangle{target: parent}

           Main_Gradient{}

        }

    }





    Row{
        width: parent.width
        height: parent.height

        Repeater{
            id: repeater
            width: parent.width
            height: parent.height
            model: root_Item.model

            Item{
                width: parent.width  / repeater.count
                height: parent.height

                required property int index

                required property string modelData

                Item{
                    width: parent.width - root_Item.margin_block
                    height: parent.height - root_Item.margin_block
                    anchors.centerIn: parent

                    Hover_Anim{
                        id: hover_Anim
                        width: parent.width
                        height: parent.height
                        outlined: root_Item.index === index //? false : true //root_Item.outlined
                        color: Style.accent_Color //root_Item.color
                        mouse_enabled: root_Item.index === index ? false : true

                        onHover_Signal: {

                           // glow.change_glow(false)




                        }

                        onClicked_Signal: {


                            root_Item.index = index

                            /*if(index === 0){

                                transition_Anim.create_left_x_anim( highlight_Item.width * index)


                             //   var a = highlight_Item.width * index

                                 toast.show("left", 3000, 1) // Показываем Тоcт
                            }
                            else{

                                transition_Anim.create_right_x_anim()

                                toast.show("right", 3000, 1) // Показываем Тоcт

                            }*/


                            //toast.show(root_Item.index.toString() + " index = " + index.toString(), 3000, 1)

                           // root_Item.clicked_Signal()

                        }
                    }

                    Custom_Rectangle_Label {
                        id: label
                        width:parent.width
                        height: parent.height
                        needBack: false
                        margin_text: 0
                        text_color: Style.primaryDark_Color //root_Item.index === index ? Style.background_Color : Style.primary_Color
                        text: modelData

                    }

                }


            }




        }
    }


    Transition_Anim{
        id: transition_Anim
        animation_target: highlight_Item
    }


}
