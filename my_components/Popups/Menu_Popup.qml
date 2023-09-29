import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup
    property var menu_Model

   // property int count: 4

    property int width_block: 300

    signal clickedMenu_Signal(index: int, value: bool)

    x: parent.width - width_block - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing


    width: width_block
    height: menu_Model.count * ui.height_Button + ((menu_Model.count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing
    modal: true

    padding: 0

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}


    background:   Blur{ x_start: popup.x + ui.width_Navigation}


        /*Rectangle {
       color: Style.background_Color
       radius: ui.radius
       width: parent.width
       height:  parent.height

       //Border_Gradient{}

    }*/


    Column{
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        anchors.centerIn: parent
        spacing: ui.basic_spacing / 2

        Repeater{
            id: repeater
            width: parent.width
            height: parent.height
            model: menu_Model

            Menu_Element{
                source: menu_Model.get(index).source
                text: menu_Model.get(index).text
                checkable: menu_Model.get(index).checkable
                checked: menu_Model.get(index).checked

                onClicked_Signal: {

                    clickedMenu_Signal(index, checked)

                }

            }
        }

        /*Menu_Element{
            source: "qrc:/icons/" + Style.theme + "/top_bar/export.svg"
            text: qsTr("Экспорт") + mytrans.emptyString

            onClicked_Signal: {

                toast.show("Экспорт", 3000, 1)

            }

        }

        Menu_Element{
            checked: true        
            text: qsTr("Сетка") + mytrans.emptyString

            onClicked_Signal: {

                visibleBorders_Signal(checked)

            }

        }

        Menu_Element{
            checked: true
            text: qsTr("Сохранять график километра") + mytrans.emptyString

            onClicked_Signal: {

                visibleBorders_Signal(checked)

            }

        }

        Menu_Element{
            source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
            text: "Фото"

            onClicked_Signal: {

                grab_Signal()
            }


        }*/

    }



   /* MenuItem {
              text: "New..."
              onTriggered: document.reset()
          }

    MenuItem {
              text: "New..."
              onTriggered: document.reset()

              Component.onCompleted: {
                  console.log("hhh = " , height)
              }
          }*/

    Popups_Anim{
        id: popups_Anim

    }
}
