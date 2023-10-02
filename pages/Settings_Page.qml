import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Row{
        width: parent.width
        height: parent.height

        Rectangle {
            id: navigationSettings_Rectangle
            width: ui.width_Navigation * 3
            height: parent.height
            color: Style.light_Color

            Column{
                width: parent.width  - ui.big_spacing
                height: parent.height - ui.big_spacing
                spacing: ui.basic_spacing

                Custom_Rectangle_Label{
                    width: parent.width
                    needBack: false
                    horizontal: Text.AlignLeft
                    vertical: Text.AlignTop
                    text: qsTr("Общие настройки") + mytrans.emptyString

                }

                Custom_Rectangle_Label{
                    width: parent.width
                    needBack: false
                    horizontal: Text.AlignLeft
                    vertical: Text.AlignTop
                    text: qsTr("Программируема кнопка") + mytrans.emptyString

                }

                Custom_Rectangle_Label{
                    width: parent.width
                    needBack: false
                    horizontal: Text.AlignLeft
                    vertical: Text.AlignTop
                    text: qsTr("Мастер") + mytrans.emptyString

                }

                Custom_Rectangle_Label{
                    width: parent.width
                    needBack: false
                    horizontal: Text.AlignLeft
                    vertical: Text.AlignTop
                    text: qsTr("Админка радиоавионики") + mytrans.emptyString

                }

                Custom_Rectangle_Label{
                    width: parent.width
                    needBack: false
                    horizontal: Text.AlignLeft
                    vertical: Text.AlignTop
                    text: qsTr("Об устройстве") + mytrans.emptyString

                }

            }
        }

        Rectangle {
            width: parent.width - navigationSettings_Rectangle.width
            height: parent.height
            color: Style.background_Color

            Rectangle {
                width: parent.width - ui.big_spacing
                height: parent.height - ui.big_spacing
                radius: ui.radius
                anchors.centerIn: parent
                color: Style.light_Color

                Column{
                    width: parent.width  - ui.big_spacing
                    height: parent.height - ui.big_spacing
                    anchors.centerIn: parent
                    spacing: ui.basic_spacing

                    Row{
                        width: parent.width
                        height: 96

                        Custom_Rectangle_Label{
                            width: parent.width * 0.5
                            height: parent.height
                            needBack: false
                            horizontal: Text.AlignLeft
                            vertical: Text.AlignTop
                            text: qsTr("Цветовое оформление") + mytrans.emptyString

                        }


                        Item {
                            id: theme_Item
                            width: parent.width * 0.5
                            height: parent.height
                            property real width_block: ui.height_Big * 1.6

                            Row{
                                width: theme_Item.width_block * 3 + ui.basic_spacing * 2
                                height: parent.height
                                anchors.right: parent.right
                                spacing: ui.basic_spacing

                                Theme_Block {
                                   id: light_ThemeBlock
                                   width: theme_Item.width_block
                                   checked: true
                                   text_theme: qsTr("Светлая") + mytrans.emptyString

                                   onClicked_Signal: {

                                       light_ThemeBlock.checked = true

                                       dark_ThemeBlock.checked = false

                                       automatic_ThemeBlock.checked = false

                                       app_Settings.dark_mode = dark_ThemeBlock.checked

                                       Style.change_theme(app_Settings.dark_mode)
                                   }
                                }

                                Theme_Block {
                                   id: dark_ThemeBlock
                                   width: theme_Item.width_block
                                   checked: false
                                   text_theme: qsTr("Тёмная") + mytrans.emptyString

                                   onClicked_Signal: {

                                       light_ThemeBlock.checked = false

                                       dark_ThemeBlock.checked = true

                                       automatic_ThemeBlock.checked = false

                                       app_Settings.dark_mode = dark_ThemeBlock.checked

                                       Style.change_theme(app_Settings.dark_mode)
                                   }
                                }

                                Theme_Block {
                                   id: automatic_ThemeBlock
                                   width: theme_Item.width_block
                                   checked: false
                                   text_theme: qsTr("Автоматически") + mytrans.emptyString

                                   onClicked_Signal: {

                                       light_ThemeBlock.checked = false

                                       dark_ThemeBlock.checked = false

                                       automatic_ThemeBlock.checked = true

                                   }
                                }

                            }
                        }
                    }

                    Custom_Border{color: Style.primaryDark_Color}

                    Settings_Switch{
                       checked: true
                       title: qsTr("Сезонность измерений") + mytrans.emptyString
                    }

                    Custom_Border{color: Style.primaryDark_Color}

                    Settings_Switch{
                       checked: app_Settings.tablet_mode
                       title: qsTr("Режим планшета") + mytrans.emptyString

                       onChecked_Signal: {

                           app_Settings.tablet_mode = value

                           toast.show("Режим планшета " + value.toString(), 3000, 1)
                       }
                    }

                    Custom_Border{color: Style.primaryDark_Color}


                    Settings_Text{
                        title: qsTr("Версия приложения") + mytrans.emptyString
                        text_value: "1.0"

                    }
                    Custom_Border{color: Style.primaryDark_Color}

                    Settings_Link{
                        link: "mailto: to@adress.com" + "?subject=This is a subject" + "&body=This is the message"
                        title: qsTr("Обратная связь") + mytrans.emptyString
                    }

                    Custom_Border{color: Style.primaryDark_Color}

                    Settings_Link{
                        link: "http://www.radioavionica.ru"
                        title: qsTr("АО Радиоавионика") + mytrans.emptyString
                    }

                    Settings_Text{
                        title: qsTr("Путь до базы данных") + mytrans.emptyString
                        text_value: "1.0"

                    }

                    Settings_Text{
                        title: qsTr("Путь до сохранения pdf ?") + mytrans.emptyString
                        text_value: "1.0"

                    }

                    Settings_Text{
                        title: qsTr("Дополнительные параметры") + mytrans.emptyString
                        text_value: "1.0"

                    }



                   /* Custom_Switch{
                        checked: app_Settings.dark_mode

                        onCheckedChanged: {

                            app_Settings.dark_mode = checked

                            Style.change_theme(app_Settings.dark_mode)

                            toast.show("Тёмная тема " + checked.toString(), 3000, 1)
                        }
                    } */

                    Custom_Rectangle_Label{
                        color: Style.light_Color // Меняем Цвет Текста
                        text: qsTr("Язык") + mytrans.emptyString

                    }

                    /*Custom_Switch{

                        onCheckedChanged: {

                           if(checked){

                               mytrans.updateLanguage(MyLang.ENG)
                           }
                           else{

                               mytrans.updateLanguage(MyLang.RUS)
                           }
                        }
                    }*/




                   /* Custom_Switch{
                        checked: app_Settings.tablet_mode

                        onCheckedChanged: {

                            app_Settings.tablet_mode = checked

                            toast.show("Режим планшета " + checked.toString(), 3000, 1)
                        }
                    } */



                }

            }


            /*Custom_Slider{

                width: 100
                height: 50
            }*/

        }

    }

}
