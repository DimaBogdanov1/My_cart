import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0


Popup {
    id: popup

    //property var model: []

   // property int width_block: 300

    property real height_block: 800

   // x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size

    width: 700 //width_block

    height: ui.basic_spacing +  ui.height_MiniTitle + ui.basic_spacing / 2 + (width / 5) * 2  //    (width / 5) * 2  +  ui.basic_spacing    //model.count * height_block + ((model.count - 1) * ui.basic_spacing ) + ui.basic_spacing / 2 + ui.big_spacing
    modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape //| Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_menu_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}


    background:  Background_Popup{}


    contentItem:

        Item{
           width: parent.width
           height: parent.height

           Rectangle{
               id: bg_Rectangle
               width: parent.width
               height: parent.height
               anchors.centerIn: parent
               radius: ui.radius
               color: Style.background_Color

               Item{
                   width: parent.width - ui.basic_spacing
                   height: parent.height - ui.basic_spacing
                   anchors.centerIn: parent

                   Column{
                       id: root_Column
                       width: parent.width
                       height: parent.height - ui.basic_spacing / 2
                       anchors.bottom: parent.bottom
                       spacing: ui.basic_spacing / 2

                       Mini_Title{
                           id: title_Block
                           boldStyle: true
                           text: "Объекты привязки"

                       }

                       Rectangle {
                           width: parent.width
                           height: parent.height - title_Block.height - root_Column.spacing
                           radius: ui.radius
                           color: Style.background_Color
                           layer.enabled: true
                           layer.effect: Mask_Rectangle{target: this; radius: ui.radius - ui.basic_spacing / 2}

                           SwipeView{
                               id: swipeView
                               width: parent.width
                               height: parent.height
                               clip: true
                               currentIndex: 0

                               Item {

                                   All_ObjectsPage{

                                   }
                               }

                               Item {

                                   Object_Param{

                                   }

                               }

                               Item {

                                   Note_User{

                                   }

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
}
