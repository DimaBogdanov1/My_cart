import QtQuick 2.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    signal viser_Signal(value: bool)

    signal grab_Signal // Test

    readonly property int time_anim: 150

    Keys.onPressed: {

        switch(event.key){
            case Qt.Key_1:

                if(index_swipe_Home === 2){

                    toast.show("Новый Пикет", 3000, 1) // Показываем Тоcт

                    Work_with_chart.add_New_Picket()
                }


            }



    }

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

        show_Anim.targets = [back_Element]

        start_anim(show_Anim, back_Element.opacity, 1)
    }

    function hide_back(){ // Закрываем Назад

        hide_Anim.targets = [back_Element]

        start_anim(hide_Anim, 1, 0)

    }

    function hide_more(){ // Закрываем Дополнительные Пункты

        hide_Anim.targets = [export_Element, picket_Element, more_Element]

        start_anim(hide_Anim, export_Element.opacity, 0)

    }


    Item{
         width: parent.width - ui.big_spacing
         height: parent.height - ui.big_spacing
         anchors.centerIn: parent

         Item{
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

                     index_swipe_Home-- // Откатываемся Назад

                 }
             }


         }

         Row{
             width: ui.iconBlock_topBar_Size * 3 + ui.big_spacing
             height: ui.iconBlock_topBar_Size
             anchors.right: parent.right
             anchors.verticalCenter: parent.verticalCenter
             spacing: ui.big_spacing / 2

             Custom_Icon_Button{
                 id: viser_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/shield.svg"
                 icon_checked_path: "qrc:/icons/light_theme/utils/shield.svg"

                 needTip: true
                 tip_text: qsTr("Срез данных") + mytrans.emptyString
                 onClicked_Signal: {

                     if(!isChecked){

                         isChecked = true

                     }
                     else{

                         isChecked = false

                     }

                     root_Item.viser_Signal(isChecked)

                   //  toast.show("Срез данных", 3000, 1) // Показываем Тоcт

                 }
             }

             Custom_Icon_Button{
                 id: picket_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                 needTip: true
                 tip_text: qsTr("Отметить пикет") + mytrans.emptyString
                 onClicked_Signal: {

                    Chart_Work.add_New_Picket()

                 }
             }

             Custom_Icon_Button{
                 id: more_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 needTip: true
                 tip_text: qsTr("Ещё") + mytrans.emptyString
                 icon_path: "qrc:/icons/" + Style.theme + "/top_bar/more.svg"

                 onClicked_Signal: {

                     memu.open()

                 }
             }


         }

         NumberAnimation {id: show_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

         NumberAnimation {id: hide_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

    }

    Menu_Popup{
        id:memu

    }
}
