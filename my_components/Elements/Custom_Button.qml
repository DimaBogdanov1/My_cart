import QtQuick 2.0
import QtQuick.Controls 2.12

import Style 1.0
import my_components 1.0


Item {
    id: root_Item
    width: parent.width
    height: parent.height
    clip: true
    signal clicked_Signal

    property string text_Button

    property bool outlined

   // text: text_Button // control.text

    Rectangle {
        width: parent.width
        height: parent.height
        radius: ui.radius
        color: outlined ? Style.background_Color  : Style.accent_Color

        border{
            width: outlined ? ui.border_Size : 0
            color: Style.accent_Color
        }

    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
        outlined: root_Item.outlined

        onClicked_Signal: {

            root_Item.clicked_Signal()

        }
    }


    Label{ // Заголовок Для Физической Кнопки
        anchors.fill: parent
        font.weight:  ui.font_weight_Smallsize
        font.family: custom_FontLoader.name
        font.pixelSize:  ui.text_SmallSize // Меняем Размер Шрифта
        wrapMode: Text.WordWrap // Если Текст Не Влезает, То Он Переноситься На Следующую Строку
        horizontalAlignment: Text.AlignHCenter // Делаем Текст По Горизонтальному Центру
        verticalAlignment: Text.AlignVCenter // Делаем Текст По Вертикальному Центру
        color:  outlined ? Style.accent_Color : Style.background_Color //"white" //Style.accountText_Color // Меняем Цвет Текста
        text: text_Button

    }



}








