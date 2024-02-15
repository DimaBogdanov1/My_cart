import QtQuick 2.15

import qml.status_ind 1.0
import Style 1.0

import my_components 1.0

Item{
    width: ui.iconBlock_topBar_Size * 4 + ui.big_spacing * 1.5
    height: ui.iconBlock_topBar_Size

    Row{
        width: parent.width
        height: parent.height
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: ui.big_spacing / 2

        TopBar_MenuButton{
            index: 3
            model: [objects_model, scale_model, task_model]
            icon_path: "qrc:/icons/" + Style.theme + "/top_bar/zoom_in.svg"

            ChartsObjects_Model{id: objects_model}

            ChartsScale_Model{id: scale_model}

            Task_MoreModel{id: task_model}

        }

        Custom_Icon_Button{
            id: picket_Element
            isNeedRectangle: true
            color_rec: Style.light_Color

            icon_path: "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
            onClicked_Signal: {

              // openObjectsPopup()

                objects_Popup.open()

            }
        }

        Custom_Icon_Button{
            isNeedRectangle: true
            color_rec: Style.light_Color
            icon_path: "qrc:/icons/" + Style.theme + "/utils/notification.svg"
           // needTip: true
            clip: false
            //tip_text: qsTr("Уведомления")
            onClicked_Signal: {

                if(notidication_Popup.model.count !== 0){

                }

                notidication_Popup.open()

            }

            Counter_Notification{
                   id: counter_Notification
                   count: Notifications_Model.rowCount() // notidication_Popup.model.count
                   status: Status_Indicator.Warning_Status

                   Component.onCompleted: {

                       open()
                   }
            }
        }

    }

    Notification_Popup{
        id: notidication_Popup
        x: calculate_offset(1, width)
        model: Notifications_Model /*  ListModel{ id: notidication_ListModel

            ListElement{
                text_notification:  "У нас всё работает"
                status_notification:  1

            }

        }*/
    }

    Objects_Popup{
        id: objects_Popup
        x: calculate_offset(2, width)

    }

}

