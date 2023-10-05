import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup
    property var menu_Model

    property int width_block: 300

   // x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing


    width: width_block
    height: menu_Model.count * ui.height_Button + ((menu_Model.count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing
   // modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_menu_enter()

    exit: popups_Anim.get_exit()

   // Overlay.modal:  Overlay_Popup {}


    background:  Background_Popup{} //  Blur{ x_start: popup.x + ui.width_Navigation}

    contentItem:

        Item{
           width: parent.width
           height: parent.height

           Highlight_Glow{target: bg_Rectangle; shadow: true;} // glowRadius: 0

           Rectangle{
               id: bg_Rectangle
               width: parent.width
               height: parent.height
               radius: ui.radius
               color: Style.background_Color

               Column{
                   width: parent.width - ui.basic_spacing
                   height: parent.height - ui.basic_spacing
                   anchors.centerIn: parent
                   spacing: ui.basic_spacing / 2

                   Repeater{
                       width: parent.width
                       height: parent.height
                       model: menu_Model

                       Menu_Element{
                           source: menu_Model.get(index).source
                           text: menu_Model.get(index).text
                           checkable: menu_Model.get(index).checkable
                           checked: menu_Model.get(index).checked

                           onClicked_Signal: {

                               menu_Model.get(index).pick(checked)

                           }

                       }
                   }

               }

           }
    }



    Popups_Anim{
        id: popups_Anim

    }
}
