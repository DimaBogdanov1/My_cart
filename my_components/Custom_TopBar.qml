import QtQuick 2.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: topBar_Item
    width: parent.width
    height: parent.height

    readonly property int time_anim: 250

    function start_anim(anim, from, to){

        anim.from = from

        anim.to = to

        anim.stop()

        anim.start()
    }

    function open_more(){ // Открываем Дополнительные Пункты

        show_Anim.targets = [export_Element, more_Element]

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

        hide_Anim.targets = [export_Element, more_Element]

        start_anim(hide_Anim, export_Element.opacity, 0)

    }

    Item{
         width: parent.width - ui.top_bar_margin
         height: parent.height - ui.top_bar_margin
         anchors.centerIn: parent

         Item{
             width: ui.iconBlock_topBar_Size
             height: ui.iconBlock_topBar_Size
             anchors.left: parent.left
             anchors.verticalCenter: parent.verticalCenter

             Navigation_Element{
                 id: back_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/light_theme/top_bar/arrow_left_1.svg"
                 onClicked_Signal: {

                     if(main_SwipeView.currentIndex !== 0){

                         if(main_SwipeView.currentIndex === 2){

                             hide_more()
                         }
                         else{
                             hide_back()
                         }

                         main_SwipeView.currentIndex-- // Откатываемся Назад
                     }

                 }
             }


         }

         Row{
             width: ui.iconBlock_topBar_Size * 2 + ui.top_bar_margin / 2
             height: ui.iconBlock_topBar_Size
             anchors.right: parent.right
             anchors.verticalCenter: parent.verticalCenter
             spacing: ui.top_bar_margin / 2

             Navigation_Element{
                 id: export_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/light_theme/top_bar/export.svg"
                 onClicked_Signal: {

                     toast.show("Экспорт", 3000, 1) // Показываем Тоcт

                 }
             }

             Navigation_Element{
                 id: more_Element
                 width: ui.iconBlock_topBar_Size
                 height: parent.height
                 isNeedRectangle: true
                 color_rec: Style.light_Color
                 icon_path: "qrc:/icons/light_theme/top_bar/more.svg"
                 onClicked_Signal: {

                     toast.show("Ещё", 3000, 1) // Показываем Тоcт

                 }
             }


         }

         NumberAnimation {id: show_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

         NumberAnimation {id: hide_Anim; property: "opacity"; from: 0; to: 1; duration: time_anim }

    }
}
