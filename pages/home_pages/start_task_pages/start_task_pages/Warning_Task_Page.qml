import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Row{
        width: parent.width
        height: parent.height

        Rectangle{
            width: parent.width / 2
            height: parent.height
            radius: ui.radius
            color: Style.light_Color

            Column{ // Создаём Основную Колонку
                width: 450
                height: parent.height //- 24
                anchors.centerIn: parent
                spacing: ui.middle_spacing //ui.basic_spacing * 2

                Item{
                    width: parent.width
                    height: 30

                    Custom_Label{
                        id: title_1
                        horizontalAlignment: Text.AlignHCenter
                        font.weight:  ui.font_weight_Bigsize
                        font.family: customTitle_FontLoader.name
                        font.pixelSize:  ui.text_BigSize // Меняем Размер Шрифта
                        color: Style.primaryDark_Color // Меняем Цвет Текста
                        //visible: false
                        text: qsTr("Создадим предупреждение!") + mytrans.emptyString

                    }


                 //   Main_Gradient{anchors.fill: title_1; source: title_1}

                }

            }

        }
    }
}

