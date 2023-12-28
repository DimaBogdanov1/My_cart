import QtQuick 2.15

import my_components 1.0
import Style 1.0

Item {
    id: root_Item
    width: 86
    height: width + text_height

    signal clicked_Signal

    property real text_height: 30

    property bool isCheck: true


    property string text: "текст"



    Column{
        width: parent.width
        height: parent.height

        Item{
            width: parent.width
            height: width

            Rectangle{
                id: stories_Rectangle
                width: parent.width
                height: parent.height
                radius: parent.width / 2
                color: "green"
                layer.enabled: true
                layer.effect: Mask_Rectangle{target: stories_Rectangle; radius: stories_Rectangle.radius}

                Hover_Anim{
                    id: hover_Anim
                    width: parent.width
                    height: parent.height

                    onClicked_Signal: {

                     //   button_Anim.create_scale_anim()

                      //  glow.change_glow(true)

                        root_Item.clicked_Signal()

                    }

                    onHover_Signal: {

                      // glow.change_glow(value)

                    }
                }


            }


            Rectangle{
                width: 24
                height: width
                radius: height / 2
                color: "yellow"
                y: 0 //height / 4 //parent.height / 4 - height / 2
                x: parent.width * 3 / 4 - width / 2

                visible: root_Item.isCheck
            }
        }






        Custom_Rectangle_Label {
          width: parent.width
          height: root_Item.text_height
          needBack: false
          text: root_Item.text


        }

    }



}
