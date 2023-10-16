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

    function update_elements(index_arr){

        for(var i = 0; i <  index_arr.length; i++){

            repeater.itemAt(index_arr[i]).text = popup.model.get(index_arr[i]).text

            repeater.itemAt(index_arr[i]).checked = popup.model.get(index_arr[i]).checked
        }
    }

   // x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing


    width: width_block
    height: popup.model.count * ui.height_Button + ((popup.model.count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing
    modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_menu_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}


    background:  Background_Popup{} //  Blur{ x_start: popup.x + ui.width_Navigation}

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
                   width: parent.width - ui.basic_spacing
                   height: parent.height - ui.basic_spacing
                   anchors.centerIn: parent
                   spacing: ui.basic_spacing / 2

                   Repeater{
                       id: repeater
                       width: parent.width
                       height: parent.height
                       model: popup.model

                       Menu_Element{
                           source: popup.model.get(index).source !== undefined ? popup.model.get(index).source : ""
                           text: popup.model.get(index).text
                           checkable: popup.model.get(index).checkable
                           checked: popup.model.get(index).checked
                           onlyTrueCheck: popup.model.get(index).onlyTrueCheck !== undefined ? popup.model.get(index).onlyTrueCheck : false

                           onClicked_Signal: {

                               var update_index = popup.model.get(index).pick(checked)

                               if(update_index !== null){

                                   update_elements(update_index)

                               }

                           }




                       }
                   }

               }

           }
    }



    Popups_Anim{
        id: popups_Anim

    }

    Component.onCompleted: {

     //   console.log("zzzzzzzzzzzzzz " , model_size);

    }
}
