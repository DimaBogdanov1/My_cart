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

    x:  ui.icon_nav_size + ui.basic_spacing

    y: -1 * (popup.height + ui.middle_spacing)
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}

    background:   Background_Popup{} // Blur{ x_start: popup.x + ui.width_Navigation}

    readonly property int max_days: 3

    property var minimumDate

    property var maximumDate

    property var selectedDate

    signal newDate_signal(year: int, month: int, day: int)

     contentItem:     Custom_Calendar{
         navigation_Height: 50
         week_Height: 50
         selectedDate: popup.selectedDate

         minimumDate:  new Date() // popup.minimumDate
         maximumDate: new Date(minimumDate.getFullYear(), minimumDate.getMonth(), minimumDate.getDate() + max_days) // popup.maximumDate //


         onNewDate_signal: {

             popup.newDate_signal(year, month, day)
         }
     }


         Popups_Anim{
             id: popups_Anim

         }
}
