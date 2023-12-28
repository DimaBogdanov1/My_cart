import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import QtQuick.Window 2.2

import Style 1.0
import my_components 1.0


Popup {
    id: popup

    width: Screen.width
    height: Screen.height
 //   modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

   // enter: popups_Anim.get_account_enter()

   // exit: popups_Anim.get_account_exit()

  //  Overlay.modal:  Overlay_Popup {}

    background:   Background_Popup{}


    Popups_Anim{
        id: popups_Anim

    }

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

         }
    }
}
