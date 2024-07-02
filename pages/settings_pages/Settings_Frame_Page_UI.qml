import QtQuick 2.15
import QtQuick.Layouts 1.3

import Type_Button 1.0
import Type_Content_Button 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height


    Flickable_Page{
        id: page
        width: parent.width
        height: parent.height
        need_Top_Bar: false
        title: my_str.page_Names.settings_Page

        sourceComponent: Component {

            Item{
                width: page.content_width
                height: page.content_height

                Row{
                    width: parent.width
                    height: parent.height
                    spacing: ui.basic_spacing
                   // anchors.right: parent.right
                    //anchors.rightMargin: ui.basic_spacing


                    Rectangle {
                        id: navigationSettings_Rectangle
                        width: 300
                        height: parent.height - anchors.topMargin
                        radius: ui.radius
                       // color: Style.light_Color

                        anchors{

                            top: parent.top
                            topMargin: ui.height_MiniTitle + ui.basic_spacing / 2
                        }

                        Column{
                            width: parent.width
                            height: parent.height
                            spacing: ui.basic_spacing



                            Custom_Button{
                                width: parent.width
                                text:  qsTr("Общие настройки")
                                source:  "qrc:/my_components/icons/"+  Style.theme + "/utils/setting_general.svg"
                                basic_text: true
                                text_color: Style.primaryDark_Color
                                type_Button: Type_Button.Text_Button
                                type_Content:  Type_Content_Button.Text_Left_And_Icon_Content

                                onClicked_Signal: {


                                    app_Page.settings_Frame_Page.page_num = 0

                                }

                            }

                            Custom_Button{
                                width: parent.width
                                text:  qsTr("Настройка параметров")
                                source:  "qrc:/my_components/icons/"+  Style.theme + "/utils/cpu.svg"
                                basic_text: true
                                text_color: Style.primaryDark_Color
                                type_Button: Type_Button.Text_Button
                                type_Content:  Type_Content_Button.Text_Left_And_Icon_Content

                                onClicked_Signal: {

                                    app_Page.settings_Frame_Page.page_num = 1


                                }

                            }


                            Custom_Button{
                                width: parent.width
                                text:  qsTr("Режим администратора")
                                source:  "qrc:/my_components/icons/"+  Style.theme + "/utils/award.svg"
                                basic_text: true
                                text_color: Style.primaryDark_Color
                                type_Button: Type_Button.Text_Button
                                type_Content:  Type_Content_Button.Text_Left_And_Icon_Content

                                onClicked_Signal: {

                                    app_Page.settings_Frame_Page.page_num = 2


                                }

                            }

                            Custom_Button{
                                width: parent.width
                                text:  qsTr("Обновление приложения")
                                source:  "qrc:/my_components/icons/"+  Style.theme + "/utils/download.svg"
                                basic_text: true
                                text_color: Style.primaryDark_Color

                                type_Button: Type_Button.Text_Button
                                type_Content:  Type_Content_Button.Text_Left_And_Icon_Content

                                onClicked_Signal: {

                                    app_Page.settings_Frame_Page.page_num = 3


                                }

                            }


                            /*Custom_Picked_Block{
                                source:  "qrc:/icons/" + Style.theme + "/utils/lock.svg"
                                text:  qsTr("Настройки железа")

                                onClicked_Signal :{


                                    index_Page = 1
                                }
                            }

                            Custom_Picked_Block{
                                source:  "qrc:/icons/" + Style.theme + "/utils/add.svg"
                                text: qsTr("Программируемая кнопка")

                                onClicked_Signal :{

                                    index_Page = 2
                                }
                            }

                            Custom_Picked_Block{
                                source:  "qrc:/icons/" + Style.theme + "/utils/user.svg"
                                text: qsTr("Мастер")

                                onClicked_Signal :{

                                    index_Page = 3
                                }
                            } */

                           /* Custom_Button{
                                id: start_Button
                                width: parent.width
                                icon_with_Text: true
                                source: "qrc:/icons/" + Style.theme + "/top_bar/arrow_right_1_white.svg" // "qrc:/icons/" + Style.theme + "/navigation/home.svg"
                                text:  qsTr("Начать маршрут")
                                onClicked_Signal: {


                                }

                            }*/

                        }

                        Column {
                            width: parent.width
                            height: ui.height_Button * 2 + spacing
                            spacing: ui.basic_spacing

                            anchors {
                                bottom: parent.bottom
                                //bottomMargin: ui.middle_spacing - ui.basic_spacing
                            }

                            Custom_Button{
                                width: parent.width
                                text:  qsTr("Обратная связь")
                                source:  "qrc:/my_components/icons/"+  Style.theme + "/utils/message.svg"
                                basic_text: true
                                text_color: Style.primaryDark_Color

                                type_Button: Type_Button.Text_Button
                                type_Content:  Type_Content_Button.Text_Left_And_Icon_Content

                                onClicked_Signal: {

                                    Qt.openUrlExternally("mailto: info@radioavionica.ru" + "?subject=Вопрос по приложению Авитрек")


                                }

                            }


                            Custom_Button{
                                width: parent.width
                                text:  qsTr("Разработчик приложения")
                                source:  "qrc:/my_components/icons/"+  Style.theme + "/utils/programming.svg"
                                basic_text: true
                                text_color: Style.primaryDark_Color

                                type_Button: Type_Button.Text_Button
                                type_Content:  Type_Content_Button.Text_Left_And_Icon_Content

                                onClicked_Signal: {

                                    app_Page.settings_Frame_Page.page_num = 4

                                    //Qt.openUrlExternally("http://www.radioavionica.ru")


                                }

                            }

                        }


                    }


                    Custom_Border{
                        width: ui.border_Size
                        height: parent.height
                        color: Style.light_Color
                    }




                    Item{
                        width: parent.width - navigationSettings_Rectangle.width - ui.border_Size - parent.spacing * 2
                        height: parent.height

                        StackLayout {
                            width: parent.width
                            height: parent.height
                            currentIndex: app_Page.settings_Frame_Page.page_num

                            Settings_General_Page_UI {
                                id: settings_General_Page_UI
                            }

                            Settings_Sensors_Page_UI {

                            }

                            Settings_Admin_Page_UI{

                            }

                            Settings_Update_Page_UI{

                            }

                            Settings_Developer_Page_UI{

                            }
                        }


                    }



                }

            }



        }

    }


}


