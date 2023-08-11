import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import Style 1.0

Label{ // Заголовок Для Физической Кнопки
     anchors.fill: parent
     font.weight:  ui.font_weight_Smallsize
     font.family: custom_FontLoader.name
     font.pixelSize:  ui.text_SmallSize // Меняем Размер Шрифта
     color: Style.primaryDark_Color // Меняем Цвет Текста
     horizontalAlignment: Text.AlignLeft
     verticalAlignment: Text.AlignVCenter

 }
