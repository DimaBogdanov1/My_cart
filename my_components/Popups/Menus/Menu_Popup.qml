import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup

   // property var big_model: [1]

    property var model: [1]

    property int width_block: 300

    property real height_menu_element: ui.height_Button //+ ui.border_Size + ui.basic_spacing / 2

    property real one_block_height: (popup.model.count * popup.height_menu_element  + ((popup.model.count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing  + ui.height_MiniTitle + ui.basic_spacing )

    function get_height(count){


        return (count * popup.height_menu_element  + ((count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing  + ui.height_MiniTitle + ui.basic_spacing )
    }

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

    function get_all_height(){

        var answer = 0

        for(var i = 0; i < popup.model.length; i++){

           answer +=  get_height(popup.model[i].count)
        }

        return answer
    }


   // x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing


    width: width_block
    height: get_all_height() //get_height(popup.model[0].count) + get_height(popup.model[1].count) //popup.model.length * one_block_height // +     // + (ui.text_miniSize + ui.basic_spacing / 2)
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
               color: Style.background_Color

               Column{
                   width: parent.width
                   height: parent.height //- title_Block.height - ui.basic_spacing / 2

                   Repeater{
                       id: repeater
                       width: parent.width
                       height: parent.height
                       model: popup.model // 2 //model //root_Item.model // popup.model

                       Menu_Block{
                           height: get_height(popup.model[index].count) //  parent.height / model.length
                           title: popup.model[index].title
                           model: popup.model[index]//popup.model


                       }
                   }

               }


           }

    }



    Popups_Anim{
        id: popups_Anim

    }

}
