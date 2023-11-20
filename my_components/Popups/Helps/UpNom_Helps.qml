import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Popup {
    id:popup
    width: 500
    height: 300 //contentItem.implicitHeight
    modal: true
    padding: 0

    enter: popups_Anim.get_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}

    background:  Background_Popup{}

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    contentItem:  Item {
       width: parent.width
       height: parent.height

       List_With_Title{
              id: defect_List
              width: parent.width * 1 //0.6 - ui.basic_spacing / 2
              height: parent.height
              noTitle: true
              title_name_model: [qsTr("Координата"), qsTr("Отстпуление"), str.extent, qsTr("Размер"), qsTr("Длинна"), qsTr("Признак"), str.set_speed, str.limit_speed]
              title_size_model: [0.12, 0.16, 0.1, 0.12, 0.1, 0.12, 0.14, 0.14]

              model: ListModel{

                  ListElement{
                      coord: "256 км 5 м"
                      defect: 1
                      st: 1
                      amp: 1
                      dl: 1
                      cou: 1
                      speed: "60 км/ч"
                      limit_speed: "100 км/ч"


                  }


              }

              delegate: List_Row{
                //  listview: defect_ListView
                  model: [coord, defect, st, amp, dl, cou, speed, limit_speed]
                  sizes: defect_List.title_size_model
                 // cur: defect_ListView.currentIndex

              }

          }


    }


    Popups_Anim{
      id: popups_Anim

    }

}

