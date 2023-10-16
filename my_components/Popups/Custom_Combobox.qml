import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0


Column{
    id: root_Column
    width: parent.width
    height: ui.block_height
    spacing: ui.basic_spacing / 2

    //signal currentIndexChanged

    property string title

    property string color: Style.accent_Color

    property var model

    property int currentIndex: equipmentList.currentIndex


    Mini_Title{
        id: title_Block
        text: root_Column.title

    }

    ComboBox {
        id:equipmentList
        width: parent.width
        height: ui.height_Button
        model: root_Column.model
        currentIndex: 0


        contentItem: Custom_Label {
               anchors.left: parent.left
               anchors.leftMargin: ui.basic_spacing
               text: equipmentList.displayText
           }

         background: Item {
             width: parent.width
             height: parent.height

             Highlight_Glow{id: glow; target: back_Rectangle;}

             Rectangle {
                id:back_Rectangle
                width: parent.width
                height: parent.height
                color: Style.background_Color
                radius: ui.radius

                Hover_Anim{
                    width: parent.width
                    height: parent.height
                    outlined: true
                    color: root_Column.color

                    onClicked_Signal: {

                        //equipmentList.currentIndex = index

                        popup.open()
                       // root_Item.clicked_Signal()

                    }

                    onHover_Signal: {

                        glow.change_glow(value)

                    }
                }


             }

         }


         delegate: ItemDelegate {
              width: equipmentList.width
              height: ui.height_RowList

              Hover_Anim{
                  id: hover_Anim
                  width: parent.width - ui.basic_spacing
                  height: parent.height
                  outlined: true
                  color: root_Column.color

                  onClicked_Signal: {

                      equipmentList.currentIndex = index

                      popup.close()

                  }
              }

              Custom_Label{
                  id:textItem
                  text: modelData
                  anchors.left: parent.left
                  anchors.leftMargin: ui.basic_spacing

              }

              List_Highlight{
                  id: highlight
                  width: 12 //parent.width - ui.big_spacing / 2
                  height: parent.height //parent.height // - ui.basic_spacing / 2
                  anchors.right: parent.right
                  anchors.rightMargin: ui.basic_spacing * 1.5
                  opacity: 0

                  Component.onCompleted: {

                      if(equipmentList.currentIndex === index){

                          highlight.open_highlight()

                      }
                  }
              }




           }

         indicator: Custom_Icon{

                 anchors{
                    right: parent.right
                    rightMargin: ui.basic_spacing / 2
                    verticalCenter: parent.verticalCenter
                    centerIn: null
                 }
                   rotation: -90
                 source: "qrc:/icons/light_theme/top_bar/arrow_left.svg"
           }

           popup: Popup {
                 id:popup
                 //y: equipmentList.height + 4
                 width: equipmentList.width
                 height: contentItem.implicitHeigh
                // clip: true
                 modal: true
                 padding: ui.basic_spacing / 2

                 enter: popups_Anim.get_enter()

                 exit: popups_Anim.get_exit()

                 Overlay.modal:  Overlay_Popup {}

                 background:         Item{
                     width: parent.width
                     height: parent.height

                   //  Highlight_Glow{target: bg_Rectangle; shadow: true}

                     Rectangle {
                          id: bg_Rectangle
                          width: parent.width
                          height: parent.height
                          radius: ui.radius
                          color: Style.background_Color

                          layer.enabled: true
                          layer.effect: Mask_Rectangle{target: parent}

                     }

                 }

                 closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

                 contentItem:  Item {
                    width: parent.width //- ui.big_spacing / 2
                    height: parent.height //- 50 //ui.basic_spacing / 2


                    ListView {
                         id:listView
                         width: parent.width //- ui.big_spacing /// 2
                          height: parent.height
                         anchors.centerIn: parent
                         property int max_elements: 8
                         implicitHeight: equipmentList.delegateModel.count * ui.height_RowList //equipmentList.delegateModel.count > max_elements ? ui.height_Button * max_elements : equipmentList.delegateModel.count * ui.height_Button
                         model: equipmentList.popup.visible ? equipmentList.delegateModel : null


                     }


                 }




             }

           Popups_Anim{
               id: popups_Anim

           }



    }

}

