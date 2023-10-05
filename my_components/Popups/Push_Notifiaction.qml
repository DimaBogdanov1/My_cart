import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0



Popup {
    id: popup

    readonly property real height_block: ui.height_Button * 2.5

    property string text: "Уведомление бла бла блаsadsadsadsaddddddddddddddddddddddddd ddddddddddd....."

    y: parent.height - ui.basic_spacing -  height_block//+ ui.basic_spacing

    width: 345.6 // Ширина Как В Аккаунте Потом Поправлю!
    height: height_block
    //modal: true


    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_notification_enter()

    exit: popups_Anim.get_notification_exit()

    //Overlay.modal:  Overlay_Popup {}


    background:   Background_Popup{} //Blur{ x_start: popup.x + ui.width_Navigation}


    contentItem:

       Item{
        width: parent.width
        height: parent.height

        Highlight_Glow{id: glow; target: bg_Rectangle; shadow: true}

        Rectangle {
             id: bg_Rectangle
             width: parent.width
             height: parent.height
             radius: ui.radius
             color: Style.background_Color

             layer.enabled: true
             layer.effect: Mask_Rectangle{target: parent}

             Row{
                 width: parent.width - ui.big_spacing
                 height: parent.height - ui.big_spacing
                 anchors.centerIn: parent
                 spacing: ui.basic_spacing

                 Item{
                     width: parent.width - ui.icon_nav_size - ui.basic_spacing
                     height: parent.height
                     clip: true

                     Custom_Label{
                            id: label
                            width: parent.width - ui.icon_nav_size - ui.basic_spacing
                            height: parent.height
                           // horizontalAlignment: root_Item.horizontal
                           // verticalAlignment: root_Item.vertical
                           // font.weight:  root_Item.font_weight
                           // font.family: root_Item.font_family
                           // font.pixelSize: root_Item.pixel_size
                            wrapMode: Text.WordWrap
                            text: popup.text
                         //   color: root_Item.text_color
                     }
                 }

                 Custom_Icon_Button{
                     height: parent.height
                     icon_path: "qrc:/icons/" + Style.theme + "/utils/close.svg"
                     onClicked_Signal: {

                         popup.close()

                     }
                 }

             }
          //   Border_Gradient{}



            /* Row{
                 width: parent.width - ui.basic_spacing
                 height: ui.height_Button
                 anchors.centerIn: parent
                 spacing: ui.basic_spacing

                 Custom_Icon{
                     height: parent.height
                     source: "qrc:/icons/" + Style.theme + "/utils/notification.svg"

                  }

                 Custom_Rectangle_Label {
                     id: startCoord_Label
                     width: parent.width - ui.basic_spacing - ui.icon_nav_size
                     height: parent.height
                     needBack: false
                     horizontal: Text.AlignLeft
                     margin_text: 0
                     text: popup.text

                 }
             }

             */

     }

       }



    Popups_Anim{
        id: popups_Anim

    }

}
