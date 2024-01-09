import QtQuick 2.15
import QtGraphicalEffects 1.0

import Style 1.0


//import org.example 1.0

import com.Colors_Profile 1.0

import my_components 1.0


Item{
    id:root_Item

    signal clicked_Signal

    property bool isIcon

    property string source: "qrc:/icons/" + Style.theme + "/top_bar/plus.svg"

    property int authorization_id: 0

    property int color_value: 0

   // property string name: "Dima"

   // property string surname: "Bogdanov"

    property string login: "Dima Bogdanov"

    property var colors_accont //: ["#BEBDFD", "#FF897F", "#99D7C4", "#FEC338", "#FF8E52", "#9B84DE"]

    property int size: 1

    width: parent.width
    height:  parent.height // root_Item.big ? ui.height_Button * 2 : ui.height_Button

    enum Size {
           Small,
           Medium,
           Big
       }

    Component.onCompleted: {

        switch(size){

        case Account_Icon.Size.Small:

            root_Item.height = ui.height_Button -  8 //(ui.height_Button - ui.height_RowList)


            break

        case Account_Icon.Size.Medium:

            root_Item.height = ui.height_Button

            break


        case Account_Icon.Size.Big:

            root_Item.height = ui.height_Button * 2

            break

        }
    }

    Colors_Profile {
        id:colors_class

    }

    Item{
        width:  parent.height
        height: width
        anchors.centerIn: parent

        Rectangle {
           id:account_Rectangle
           width:  parent.width
           height: parent.height
           color: isIcon ? Style.light_Color : colors_class.colors_List[root_Item.color_value]
           layer.enabled: true
           layer.effect: Mask_Rectangle{target: account_Rectangle; radius: account_Rectangle.width / 2}

           Hover_Anim{
               id: hover_Anim
               width: parent.width
               height: parent.height
              // color: root_Item.color

               //onPressed_and_Hold_Signal

               onClicked_Signal: {

                   root_Item.clicked_Signal()

               }
           }

           Custom_Label{
                id: label
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight:  ui.font_weight_Bigsize
               // font.family: customTitle_FontLoader.name
                font.pixelSize:  (root_Item.height * 15) /  ui.height_Button //  root_Item.big ? 30 : 15 //ui.text_MiddleSize
                text: isIcon ? "" : createText(login)
                visible: !isIcon
                color: "white"


                function createText(login){

                    var a = login.split(' ')

                    return Array.from(a[0])[0].toUpperCase() + Array.from(a[1])[0].toUpperCase()
                }

           }

           /*Image {
               anchors.fill: parent
              //sourceSize.width:  parent.width
              //sourceSize.height: parent.height

              visible: isIcon
              //smooth: false // Убираем Сглаживание
              source: root_Item.source
              fillMode: Image.PreserveAspectFit
           } */

           Custom_Icon{
               width: parent.width
               height: parent.height
              // icon_size: ui.icon_nav_size * 1.7
               source: root_Item.source
               visible: isIcon

            }
        }

       /* Custom_Rectangle_Label {
            width: root_Item.big ? root_Item.noti_size * 2 : root_Item.noti_size
            height: root_Item.big ? root_Item.noti_size * 2 : root_Item.noti_size
            radius: width / 2
            y: -1 * width / 4
            x: -1 * width / 4
            pixel_size: root_Item.big ? ui.text_SmallSize : 10
            //anchors.right: parent.right
            margin_text: 0
            text: "admin"
            color: "red"
            text_color: Style.background_Color

        } */
    }



    Button_Anim{
       id: button_Anim
       animation_target: account_Rectangle
    }

}

