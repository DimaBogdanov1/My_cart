import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup
    property var model: []

    property int width_block: 300

    property real height_block: ui.height_Button *  2

   // x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size


    width: width_block
    height: 300 //model.count * height_block + ((model.count - 1) * ui.basic_spacing ) + ui.basic_spacing / 2 + ui.big_spacing
    modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_menu_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}


    background:  Background_Popup{}

    enum Status {
           Positive,
           Warning,
           Error
       }

    enum Message_Notification {
           Adjustment
       }

    readonly property var message: [qsTr("До окончания срока юстировки осталось 29 дней!") ,

    ]


    contentItem:

        Item{
           width: parent.width
           height: parent.height

          // Highlight_Glow{target: bg_Rectangle; shadow: true;} // glowRadius: 0

           Rectangle{
               id: bg_Rectangle
               width: parent.width
               height: parent.height
               radius: ui.radius
               color: Style.background_Color

               Column{
                   width: parent.width - ui.big_spacing
                   height: parent.height - ui.big_spacing
                   anchors.centerIn: parent
                   spacing: ui.basic_spacing / 2

                   Custom_Rectangle_Label {
                       id: label
                       width: parent.width
                       needBack: false
                       //pixel_size: ui.text_BigSize
                       font_weight:  ui.font_weight_Bigsize
                       font_family: customTitle_FontLoader.name

                       //horizontal: Text.AlignLeft
                       text: qsTr("Уведомления")

                   }

                   ListView{
                      id: list
                      width: parent.width
                      height: parent.height - label.height - ui.height_Button - ui.basic_spacing
                      clip: true
                      model: popup.model
                      spacing: ui.basic_spacing
                      delegate: Notification_Element{
                            width: list.width
                            height: popup.height_block
                            text: message[text_notification]
                            status: status_notification
                      }

                      remove: Transition {
                            NumberAnimation { property: "x"; from: 0; to: -1 * list.width; duration: 400 }

                      }

                   }

                   Custom_Button{
                       width: parent.width
                       height: ui.height_Button
                       outlined: true
                       anchors.horizontalCenter: parent.horizontalCenter
                       text:  qsTr("Отметить прочитанными")
                       onClicked_Signal: {

                           model.clear()

                           popup.close()

                       }

                   }
               }



           }

    }

    Popups_Anim{
        id: popups_Anim

    }
}
