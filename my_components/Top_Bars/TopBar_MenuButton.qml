import QtQuick 2.15

import Style 1.0

import my_components 1.0

Custom_Icon_Button{
    id: root_Item
    isNeedRectangle: true
    color_rec: Style.light_Color
    clip: false

       // needTip: true
   // tip_text: qsTr("Ещё")
    icon_path: "qrc:/icons/" + Style.theme + "/top_bar/more.svg"

    property int index_position: 0

    property bool openBasicMenu: true

    property bool needCounter

    property var model: []// [more_model, moreMain_model]

    property int count

    property int status


   /* onClicked_Signal: {

      //  objects_Menu.close()

        if(openBasicMenu){

            menu.x = calculate_offset(index_position, menu.width_block)

            menu.model = [menuModel_Loader.item.getModel(0)] //model

            menu.open()
        }

    }*/

    Counter_Notification{
           id: counter_Notification
           needCounter: root_Item.needCounter
           count: root_Item.count //Notifications_Model.rowCount() // notidication_Popup.model.count
           status: root_Item.status //Status_Indicator.Warning_Status

    }
}
