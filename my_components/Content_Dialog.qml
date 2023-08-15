import QtQuick 2.15
import QtQuick.Controls 2.12

import Style 1.0
import my_components 1.0


Item{
    id: root_Item
    width: 448
    height: 200
    anchors.centerIn: parent

    function open_dialog(){

        dialog.open()
    }

    Dialog {
        id: dialog
        width: parent.width
        height: parent.height
        padding: 0
       // modal: true
      //  standardButtons: Dialog.Ok

        background: Rectangle {
           width: parent.width
           height: parent.height
           color: "transparent"
        }

        contentItem: Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: ui.radius_mini
                        color: Style.background_Color

                        Item { // Позиционируем Элементы Как Столбцы
                            width: parent.width -  32
                            height: parent.height - 32
                            anchors.centerIn: parent

                            Column { // Позиционируем Элементы Как Столбцы
                                width: parent.width
                                height: parent.height
                                spacing: 0 // Пробел Между Блоками 0
                                anchors.centerIn: parent

                                Item{ // Создаём Блок С Заголовком
                                    width: parent.width
                                    height:  32

                                    Custom_Label{
                                         id: label
                                         font.weight:  ui.font_weight_Bigsize
                                         font.family: customTitle_FontLoader.name
                                         font.pixelSize:  ui.text_MiddleSize // Меняем Размер Шрифта
                                         text: qsTr("Информация") + mytrans.emptyString

                                    }

                                }

                                Row { // Создаём Строку С Описанием Окна
                                    width: parent.width
                                    height:  36
                                    spacing: 24

                                    Item { // Создаём Блок С Иконкой
                                        width:  ui.iconBlock_Size
                                        height: parent.height

                                        Image {
                                           source: "qrc:/icons/light_theme/utils/info.svg"
                                           sourceSize.width:  ui.icon_nav_size
                                           sourceSize.height:  ui.icon_nav_size
                                           anchors.centerIn: parent
                                           smooth: false // Убираем Сглаживание
                                           fillMode: Image.TileVertically
                                        }
                                    }


                                    Item { // Создаём Блок С Текстом
                                        width: parent.width -  24 -  ui.iconBlock_Size
                                        height: parent.height

                                        Custom_Label{
                                             text: qsTr("Вы действительно, хотите удалить ?") + mytrans.emptyString

                                        }

                                    }
                                }

                                Row {
                                    width: negative_Button.width + positive_Button.width + 12
                                    height:  36
                                    spacing: 12
                                    anchors.right: parent.right

                                    Custom_Button{
                                        id: negative_Button
                                        width: 70
                                        height: ui.height_Button
                                        outlined: true
                                        text_Button:  qsTr("Отмена") + mytrans.emptyString
                                        onClicked_Signal: {

                                            index_swipe_Home = 2 // Переходим На График

                                           //homePage_Loader.index_Page = 2
                                           toast.show("test click", 3000, 1) // Показываем Тоcт

                                        }

                                    }

                                    Custom_Button{
                                        id: positive_Button
                                        width: 40
                                        height: ui.height_Button
                                        outlined: true
                                        text_Button:  qsTr("Ок") + mytrans.emptyString
                                        onClicked_Signal: {

                                            index_swipe_Home = 2 // Переходим На График

                                           //homePage_Loader.index_Page = 2
                                           toast.show("test click", 3000, 1) // Показываем Тоcт

                                        }

                                    }



                                }

                            }

                        }

                    }
    }

    Opacity_Anim{
        id: opacity_Anim
        animation_target: root_Item

    }

}

