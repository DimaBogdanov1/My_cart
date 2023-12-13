import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup

    readonly property real height_block: account_withTitle.height + 10 + ui.height_Button +  ui.middle_spacing * 2 + ui.big_spacing

    readonly property real width_block: height_block *  ui.block_ratio

    x: ui.width_Navigation + ui.basic_spacing
    y: parent.height - ui.basic_spacing -  height_block//+ ui.basic_spacing

    width: width_block
    height: height_block
 //   modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_account_enter()

    exit: popups_Anim.get_account_exit()

  //  Overlay.modal:  Overlay_Popup {}

    background:   Background_Popup{} // Blur{ x_start: popup.x + ui.width_Navigation}

    contentItem:

        Item{
         width: parent.width
         height: parent.height

         Highlight_Glow{target: bg_Rectangle; shadow: true}

         Rectangle{
             id: bg_Rectangle
             width: parent.width
             height: parent.height
             radius: ui.radius
             color: Style.background_Color

             //Border_Gradient{}

             Column{
                 width: parent.width - ui.big_spacing
                 height: parent.height - ui.big_spacing
                 anchors.centerIn: parent
                 spacing: ui.middle_spacing

                 Account_With_Title{
                     id: account_withTitle
                     enabled: false

                 }

                 Item {
                     width: parent.width
                     height: 10
                 }

                 Row{
                     width: parent.width
                     height: ui.height_Button
                     spacing: ui.basic_spacing

                     Custom_Button{
                         width: parent.width / 2 - ui.basic_spacing / 2
                         outlined: true
                         isOnlyText: true
                         text:  qsTr("Выйти")
                         onClicked_Signal: {

                             popup.close()

                             applicationWindow.flipped = false

                             //index_Page = 0
                         }

                     }

                     Custom_Button{
                         width: parent.width / 2 - ui.basic_spacing / 2
                         height: ui.height_Button
                        // outlined: true
                         icon_with_Text: true
                         source: "qrc:/icons/" + Style.theme + "/top_bar/plus_white.svg" // "qrc:/icons/" + Style.theme + "/navigation/home.svg"

                         text:  qsTr("Добавить аккаунт")
                         onClicked_Signal: {

                             popup.close()

                             root_Page.index_Page = 3

                             page_Loader.item.sub_index_LoginPage = 2

                         }

                     }
                 }


             }
         }


    }

    Popups_Anim{
        id: popups_Anim

    }

    function openPopup(login, color){

        account_withTitle.login_account = login

        account_withTitle.color_account = color

        console.log("account_withTitle.color_account = " + account_withTitle.color_account)
        popup.open()

    }
}
