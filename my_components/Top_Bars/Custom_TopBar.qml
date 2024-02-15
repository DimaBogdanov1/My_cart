import QtQuick 2.15

import qml.status_ind 1.0
import Style 1.0

import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property bool needBack: true

    property bool needNotification

    property var mainModel: []

    property var model: []

    property real spacing: ui.big_spacing / 2

    property string sourceMenuModel:  "qrc:/my_components/Top_Bars/Menu_Models/Chart_MenuModels.qml"

    signal backClick_Signal()

    enum Actions {
           Open_Menu_Actions,
           Open_Popup_Action,
           Execute_Function_Action
       }


    function get_menuModel(model, mainModel){

        var arr = []

        if(mainModel){

            for(var i = 0; i < model.length; i++){

                arr.push(menuModel_Loader.item.getModel( model[i] ))

            }
        }
        else{

            for(var j = 0; j < model.count; j++){

                arr.push(menuModel_Loader.item.getModel( model.get(j).value  ))

            }
        }

        return arr
    }

    function calculate_index_position(index){

        var index_position = index + 1

        if(needNotification){

            index_position += 1
        }

        return index_position
    }

    function calculate_all_width(index){

        var width_model =  ui.iconBlock_topBar_Size * root_Item.model.count + (root_Item.model.count - 1) * root_Item.spacing

        var all_width = width_model

        var one_elemnt_width = ui.iconBlock_topBar_Size + root_Item.spacing

        if(needNotification){

            all_width += one_elemnt_width
        }

        all_width += one_elemnt_width

        var arr = [all_width, width_model]

        return arr[index]
    }




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

    function calculate_offset(index, width){

        var multi = index + 1

        var width_block = width

        return parent.width -  width_block - ui.iconBlock_topBar_Size * (multi - 1) -  ui.basic_spacing * multi

    }


    function openObjectsPopup(){

        menu.x = calculate_offset(1)

        menu.model = [objects_model]

        menu.open()

    }


    function open_menu(index_position, model){

        menu.x = calculate_offset(index_position, menu.width_block)

        menu.model = model

        menu.open()
    }

    Back_Arrow{
        visible: needBack

         onClicked_Signal: {

             backClick_Signal()

         //    sub_index_HomePage-- // Откатываемся Назад

         }
     }

    Item{
         width: parent.width - ui.big_spacing
         height: parent.height - ui.big_spacing
         anchors.centerIn: parent


         Row{
             width: calculate_all_width(0)

             height: ui.iconBlock_topBar_Size
             anchors.right: parent.right
             anchors.verticalCenter: parent.verticalCenter
             spacing: root_Item.spacing

             Row{
                 width: calculate_all_width(1)   // ui.iconBlock_topBar_Size * root_Item.model.count + (root_Item.model.count - 1) * ui.big_spacing / 2
                 height: parent.height
                 layoutDirection: Qt.RightToLeft
                 spacing: ui.big_spacing / 2

                 Repeater{
                     width: parent.width
                     height: parent.height
                     model: root_Item.model

                     TopBar_MenuButton{
                         index_position: calculate_index_position(index)
                         needCounter:  root_Item.model.get(index).needCounter// === undefined ? false : true
                         count: needCounter ? root_Item.model.get(index).count : 0
                         status: needCounter ? root_Item.model.get(index).status : 0   //!root_Item.model.get(index).status === undefined ? 0 : root_Item.model.get(index).status
                         icon_path: root_Item.model.get(index).icon_path


                         onClicked_Signal: {

                             switch(root_Item.model.get(index).typeAction){

                             case Custom_TopBar.Actions.Open_Popup_Action:

                                 menuModel_Loader.item.openObjectPopup(calculate_index_position(index))

                                 break

                             case Custom_TopBar.Actions.Execute_Function_Action:

                                 root_Item.model.get(index).pick()

                                 break

                             default:

                                 open_menu(index_position, get_menuModel(root_Item.model.get(index).model_Menu))

                                 break
                             }


                         }

                     }

                 }

             }

             /*
             TopBar_MenuButton{
                 index_position: 3
                 model: [objects_model, scale_model, task_model]
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/zoom_in.svg"

                 ChartsObjects_Model{id: objects_model}

                 ChartsScale_Model{id: scale_model}

                 Task_MoreModel{id: task_model}

             }

             TopBar_MenuButton{
                 id: picket_Element
                 openBasicMenu: false
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                 onClicked_Signal: {

                   // openObjectsPopup()

                     menuModel_Loader.item.openObjectPopup()

                     //objects_Popup.open()

                 }
             }

             */

             TopBar_MenuButton{
                 id: notification_Element
                 visible: needNotification
                 needCounter: true
                 count: Notifications_Model.rowCount()
                 status: Status_Indicator.Warning_Status
                 icon_path: "qrc:/icons/" + Style.theme + "/utils/notification.svg"

                 onClicked_Signal: {

                     if(notidication_Popup.model.count !== 0){

                     }

                     notidication_Popup.open()

                 }

                 function changeStatus(status){

                     if(notification_Element.status !== status){

                         notification_Element.status = status

                     }
                 }

             }

             TopBar_MenuButton{
                 id: more_Element
                 index_position: 0
                 //model:  [menuModel_Loader.item.getModel(0), menuModel_Loader.item.getModel(1)]
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/more.svg"

                 onClicked_Signal: {

                     open_menu(index_position, get_menuModel(root_Item.mainModel, true))

                    // open_menu(0, model)


                 }

                 //ChartsMore_Main_Model{id: moreMain_model}

                 //ChartsMore_Model{id: more_model}
             }

         }

         NumberAnimation {id: show_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

         NumberAnimation {id: hide_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

    }


    Loader{
        id: menuModel_Loader
        source: sourceMenuModel

    }

   /* ChartsMore_Main_Model{id: moreMain_model}

    ChartsMore_Model{id: more_model}

    ChartsObjects_Model{id: objects_model}

    ChartsScale_Model{id: scale_model} */

    Menu_Popup{
        id: menu
        model: []
        //x: calculate_offset(0)
        //model: ChartsMore_Model{}
    }

    Notification_Popup{
        id: notidication_Popup
        x: calculate_offset(1, width)
        model: Notifications_Model
    }





    Connections{
        target: Mqqt_Client

        function onNewButtonClick_signal(num_Button){

            switch(num_Button){

            case 0:

                objects_Popup.open()

                break

            case 1:

                sensorsVal.setPlay(true)
                //Mqqt_Client.playPause_Chart();

                break

            case 2:

                toast.show("Нажата кнопка номер " + num_Button, 3000, 1)

                break
            }

        }


        function onNewNotification_signal(message, status){

            if(status === Status_Indicator.Negative_Status){

               notification_Element.changeStatus(status)
            }
            else{

                if(status === Status_Indicator.Warning_Status){

                    notification_Element.changeStatus(status)
                }

            }


            push_Notification.openPush(message, status)

            Notifications_Model.addNotification(message, status)

            notification_Element.count = Notifications_Model.rowCount()

            //notidication_ListModel.append({"text_notification": message, "status_notification": status })
        }
    }

}
