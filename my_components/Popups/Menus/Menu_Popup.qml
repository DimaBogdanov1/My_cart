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

    property real height_menu_element: ui.height_Button //+ ui.border_Size + ui.basic_spacing / 2

   /* property bool start_Enter

    onStart_EnterChanged: {

        if(start_Enter){

            anim.stop()

            anim.start()

            start_Enter = false
        }
    }
    ParallelAnimation {

        id: anim

        NumberAnimation {
            property: "width";
            target: bg_Rectangle
            from: 0;
            to: bg_Rectangle.width;
            duration: 2500
        }

        NumberAnimation {
            property: "height";
            target: bg_Rectangle
            from: 0;
            to: bg_Rectangle.height;
            duration: 2500
        }


    }*/


    function update_elements(index_arr){

        for(var i = 0; i <  index_arr.length; i++){

            repeater.itemAt(index_arr[i]).text = popup.model.get(index_arr[i]).text

            repeater.itemAt(index_arr[i]).checked = popup.model.get(index_arr[i]).checked
        }
    }

   // x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing


    width: width_block
    height: popup.model.count * popup.height_menu_element  + ((popup.model.count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing // + (ui.text_miniSize + ui.basic_spacing / 2)
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
          // color: "green"

          // Highlight_Glow{target: bg_Rectangle; shadow: true;} // glowRadius: 0

           Rectangle{
               id: bg_Rectangle
               width: parent.width
               height: parent.height
               radius: ui.radius
               anchors.right: parent.right
               color: Style.background_Color

               Menu_Block{
                   model: popup.model

               }

              /* Column{
                   width: parent.width - ui.basic_spacing
                   height: parent.height - ui.basic_spacing
                   anchors.centerIn: parent
                   spacing: ui.basic_spacing / 2

                   Repeater{
                       id: repeater
                       width: parent.width
                       height: parent.height
                       model: popup.model

                       Column{
                           width: parent.width
                           height: popup.height_menu_element //ui.height_Button + ui.border_Size + spacing
                           spacing: ui.basic_spacing / 2

                           Menu_Element{
                               height: ui.height_Button
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

                        //   Custom_Border{color: "red"}

                       }


                   }

               }

               */
           }
    }



    Popups_Anim{
        id: popups_Anim

    }

    Component.onCompleted: {

     //   console.log("zzzzzzzzzzzzzz " , model_size);

    }
}
