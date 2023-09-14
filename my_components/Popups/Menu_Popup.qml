import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup
    x: parent.width - 200 - ui.basic_spacing
    y: ui.toolBar_Size //+ ui.basic_spacing

    property var model: [1,2,3,4]

    property int count: 2

    width: 200
    height: count * ui.height_Button + ((count - 1) * ui.basic_spacing / 2 ) + ui.basic_spacing
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

        Menu_Element{
            source: "qrc:/icons/" + Style.theme + "/top_bar/export.svg"
            text: qsTr("Экспорт") + mytrans.emptyString

            onClicked_Signal: {

                toast.show("Экспорт", 3000, 1)

            }

        }

        Menu_Element{
            source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
            text: "Фото"

            onClicked_Signal: {

                grab_Signal()
            }


        }

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
