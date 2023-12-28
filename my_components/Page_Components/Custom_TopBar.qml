import QtQuick 2.15

import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    //signal viser_Signal(value: bool)

    //signal visibleBorders_Signal(value: bool)

    //signal grab_Signal // Test

    readonly property int time_anim: 150

    function start_anim(anim, from, to){

        anim.from = from

        anim.to = to

        anim.stop()

        anim.start()
    }

    function open_more(){ // Открываем Дополнительные Пункты

        show_Anim.targets = [export_Element, picket_Element, more_Element]

        start_anim(show_Anim, export_Element.opacity, 1)

    }

    function open_back(){ // Открываем Назад

       // show_Anim.targets = [back_Element]

        //start_anim(show_Anim, back_Element.opacity, 1)
    }

    function hide_back(){ // Закрываем Назад

      //  hide_Anim.targets = [back_Element]

        start_anim(hide_Anim, 1, 0)

    }

    function hide_more(){ // Закрываем Дополнительные Пункты

        hide_Anim.targets = [export_Element, picket_Element, more_Element]

        start_anim(hide_Anim, export_Element.opacity, 0)

    }

    function calculate_offset(index){

        var multi = index + 1

        return parent.width - menu.width_block - ui.iconBlock_topBar_Size * (multi - 1) -  ui.basic_spacing * multi

    }

    Back_Arrow{

         onClicked_Signal: {

             sub_index_HomePage = page_Loader.open_back(sub_index_HomePage, 1)

         //    sub_index_HomePage-- // Откатываемся Назад

         }
     }

    Item{
         width: parent.width - ui.big_spacing
         height: parent.height - ui.big_spacing
         anchors.centerIn: parent



        /*Item{
             width: ui.iconBlock_topBar_Size
             height: ui.iconBlock_topBar_Size
             anchors.left: parent.left
             anchors.verticalCenter: parent.verticalCenter

             Custom_Icon_Button{
                 id: back_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"
                 onClicked_Signal: {

                     sub_index_HomePage-- // Откатываемся Назад

                 }
             }


         }*/


         Row{
             width: ui.iconBlock_topBar_Size * 4 + ui.big_spacing * 1.5
             height: ui.iconBlock_topBar_Size
             anchors.right: parent.right
             anchors.verticalCenter: parent.verticalCenter
             spacing: ui.big_spacing / 2


             Custom_Icon_Button{
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/zoom_in.svg"
                 onClicked_Signal: {


                     menu.x = calculate_offset(3)

                     menu.model = [scale_model]

                     menu.open()

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
                        count: notidication_Popup.model.count

                        Component.onCompleted: {

                            open()
                        }
                 }
             }


             Custom_Icon_Button{
                 id: picket_Element
                 isNeedRectangle: true
                 color_rec: Style.light_Color

                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                 onClicked_Signal: {

                    // more_Memu.close()

                     menu.x = calculate_offset(1)

                     menu.model = [objects_model]

                     menu.open()

                 }
             }

             Custom_Icon_Button{
                 id: more_Element
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                // needTip: true
                // tip_text: qsTr("Ещё")
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/more.svg"

                 onClicked_Signal: {

                   //  objects_Menu.close()

                     menu.x = calculate_offset(0)

                     menu.model = [more_model, objects_model]

                     menu.open()

                 }
             }


         }

         NumberAnimation {id: show_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

         NumberAnimation {id: hide_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

    }

    ChartsMore_Model{id: more_model}

    ChartsObjects_Model{id: objects_model}

    ChartsScale_Model{id: scale_model}

    Menu_Popup{
        id: menu
        model: []
        //x: calculate_offset(0)
        //model: ChartsMore_Model{}
    }

    Notification_Popup{
        id: notidication_Popup
        x: calculate_offset(2)
        model: ListModel{

            ListElement{
                text_notification:  Notification_Popup.Message_Notification.Adjustment
                status_notification:  Notification_Popup.Status.Warning

            }

            ListElement{
                text_notification:  Notification_Popup.Message_Notification.Adjustment
                status_notification:  Notification_Popup.Status.Warning

            }
        }
    }

}
