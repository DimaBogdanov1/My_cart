import QtQuick 2.15
import QtQuick.Controls 2.12

import Style 1.0
import my_components 1.0


Dialog {
    id: dialog
   // parent: Overlay.overlay
    width: 448
    height: 200
    anchors.centerIn: parent

    padding: 0

    modal: true
    dim: true
    focus: true

    enter: popups_Anim.get_dialog_enter()

    exit: popups_Anim.get_dialog_exit()


    closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

    signal agree_click


  //  standardButtons: Dialog.Ok

    background: Background_Popup{}

    contentItem: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: ui.radius
                    color: Style.background_Color

                    Item {
                        width: parent.width -  ui.big_spacing
                        height: parent.height - ui.big_spacing
                        anchors.centerIn: parent

                        Column {
                            width: parent.width
                            height: parent.height - ui.height_Button
                            spacing: ui.basic_spacing

                            Item{
                                width: parent.width
                                height: label.paintedHeight
                               // color: "red"

                                Custom_Label{
                                     id: label
                                     height: label.paintedHeight
                                     font.weight:  ui.font_weight_Bigsize
                                     font.family: customTitle_FontLoader.name
                                     font.pixelSize:  ui.text_MiddleSize // Меняем Размер Шрифта
                                     horizontalAlignment: Text.AlignHCenter
                                     text: qsTr("Информация") + mytrans.emptyString

                                }

                            }

                            Custom_Border{
                            }

                            Item {
                                width: parent.width -  24 -  ui.iconBlock_Size
                                height: parent.height

                                Row {
                                    width: parent.width
                                    height:  36
                                    spacing: 24

                                    Item {
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

                                    Item{
                                           width:  parent.width - ui.iconBlock_Size

                                             height: parent.height
                                        Custom_Label{

                                             text: qsTr("Переход на другую страницу отменит текущий прогресс") + mytrans.emptyString
                                             wrapMode: Text.WordWrap


                                        }

                                    }



                                }


                            }

                        }

                        Row {
                            width: negative_Button.width + positive_Button.width + ui.basic_spacing
                            height: ui.height_Button
                            spacing: ui.basic_spacing
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right

                            Custom_Button{
                                id: negative_Button
                                width: 70
                                height: ui.height_Button
                                outlined: true
                                isOnlyText: true
                                color: Style.primaryDark_Color
                                text:  qsTr("Отмена") + mytrans.emptyString
                                onClicked_Signal: {

                                   dialog.close()

                                   toast.show("test click", 3000, 1) // Показываем Тоcт

                                }

                            }

                            Custom_Button{
                                id: positive_Button
                                width: 40
                                height: ui.height_Button
                                outlined: true
                                isOnlyText: true
                                color: Style.accent_Color
                                text:  qsTr("Ок") + mytrans.emptyString
                                onClicked_Signal: {

                                   dialog.agree_click()

                                }

                            }



                        }


                    }

                }

    Overlay.modal: Overlay_Popup {}

    Popups_Anim{
        id: popups_Anim

    }
}

