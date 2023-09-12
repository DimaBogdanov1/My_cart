import QtQuick 2.15
import QtQuick.Controls 2.12

import Style 1.0
import my_components 1.0

Popup {
    width: 448
    height: 200
    anchors.centerIn: parent

    padding: 0

    modal: true
    dim: true
    focus: true

    enter: popups_Anim.get_dialog_enter()

    exit: popups_Anim.get_dialog_exit()


    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

  //  standardButtons: Dialog.Ok

    background: Background_Popup{}

    Overlay.modal: Overlay_Popup {}

    contentItem: Rectangle {
        width: parent.width
        height: parent.height
        radius: ui.radius
        color: Style.background_Color

        Item {
            width: parent.width -  ui.big_spacing
            height: parent.height - ui.big_spacing
            anchors.centerIn: parent

            Column {
                width: parent.width
                height: parent.height
                spacing: ui.basic_spacing

                Item{
                    width: parent.width
                    height: label.paintedHeight
                   // color: "red"

                    Custom_Label{
                         id: label
                         height: label.paintedHeight
                         font.weight:  ui.font_weight_Bigsize
                         font.family: customTitle_FontLoader.name
                         font.pixelSize:  ui.text_MiddleSize // Меняем Размер Шрифта
                         horizontalAlignment: Text.AlignHCenter
                         text: qsTr("Пожалуйста подождите") + mytrans.emptyString

                    }

                }


                Rectangle {
                    id: main_Rectangle
                    width: parent.width
                    height: 4
                    color: "red"
                    radius:  ui.radius

                }






            }
        }
    }

    Popups_Anim{
        id: popups_Anim

    }
}
