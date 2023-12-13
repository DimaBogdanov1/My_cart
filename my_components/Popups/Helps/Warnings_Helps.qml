import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Popup {
    id: popup

    width: 600
    height: ui.height_RowList + ui.height_Button +  ui.border_Size * 3 + ui.basic_spacing / 2 //width * 1.1 //50 + 50 + 233
    modal: true

    padding: 0

   // x:  ui.icon_nav_size + ui.basic_spacing

   // y: -1 * (popup.height + ui.middle_spacing)
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    enter: popups_Anim.get_enter()

    exit: popups_Anim.get_exit()

    Overlay.modal:  Overlay_Popup {}

    background:   Background_Popup{} // Blur{ x_start: popup.x + ui.width_Navigation}


    property var title_name_model: []

    property var title_size_model: []

    property int color_value: 3

    property string login

    property real account_width


    function open_Popup(pick_login, pick_color, data_Input, data_Start, data_End){

        warning_ListModel.clear()

        login = pick_login

        color_value = pick_color

        warning_ListModel.append({"data_Input": data_Input, "data_Start": data_Start, "data_End": data_End})

        popup.open()

    }


    contentItem: List_With_Title {
        id: list
        width: parent.width //- ui.big_spacing
        height: popup.height
        title_name_model: popup.title_name_model
        title_size_model: popup.title_size_model

        model: ListModel{id: warning_ListModel}

        delegate: Warning_Delegate{
            login: popup.login
            color_value:  popup.color_value
            width: list.width
            model:[data_Input, data_Start, data_End]
            sizes: list.title_size_model

        }

     }


     Popups_Anim{
         id: popups_Anim

     }
}
