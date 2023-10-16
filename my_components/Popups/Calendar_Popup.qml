import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup

    width: 300
    height: width * 1.1 //50 + 50 + 233
    modal: true

    padding: 0

    x: 500

    y: 80
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

   // enter: popups_Anim.get_account_enter()

    //exit: popups_Anim.get_account_exit()

    Overlay.modal:  Overlay_Popup {}

    background:   Background_Popup{} // Blur{ x_start: popup.x + ui.width_Navigation}

     contentItem:     Custom_Calendar{
         navigation_Height: 50
         week_Height: 50

     }


         Popups_Anim{
             id: popups_Anim

         }
}
