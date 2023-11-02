import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    readonly property real margin_block: ui.big_spacing

    property int index_Page: -1

    readonly property var sourcePages_Array: [
                                               "qrc:/pages/settings_pages/General_Settings_Page.qml",
                                               "qrc:/pages/settings_pages/ProgButon_Settings_Page.qml",
                                               "qrc:/pages/settings_pages/AboutApp_Settings_Page.qml"
                                            ]
    Row{
        width: parent.width
        height: parent.height

        Rectangle {
            id: navigationSettings_Rectangle
            width: 300 //ui.width_Navigation * 3
            height: parent.height
            color: Style.light_Color

            Column{
                width: parent.width - root_Item.margin_block
                height: parent.height - root_Item.margin_block
                anchors.centerIn: parent
                spacing: ui.basic_spacing

                Custom_Picked_Block{
                    source:  "qrc:/icons/" + Style.theme + "/utils/lock.svg"
                    text:  qsTr("Общие настройки") + mytrans.emptyString

                    onClicked_Signal :{


                        index_Page = 0
                    }
                }

                Custom_Picked_Block{
                    source:  "qrc:/icons/" + Style.theme + "/utils/add.svg"
                    text: qsTr("Программируемая кнопка") + mytrans.emptyString

                    onClicked_Signal :{

                        index_Page = 1
                    }
                }

                Custom_Picked_Block{
                    source:  "qrc:/icons/" + Style.theme + "/utils/user.svg"
                    text: qsTr("Мастер") + mytrans.emptyString

                    onClicked_Signal :{

                        index_Page = 2
                    }
                }

                Custom_Button{
                    id: start_Button
                    width: parent.width
                    icon_with_Text: true
                    source: "qrc:/icons/" + Style.theme + "/top_bar/arrow_right_1_white.svg" // "qrc:/icons/" + Style.theme + "/navigation/home.svg"
                    text:  qsTr("Начать маршрут") + mytrans.emptyString
                    onClicked_Signal: {


                    }

                }

            }

            Column {
                width: parent.width - root_Item.margin_block
                height: ui.height_Button

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: ui.middle_spacing
                }



                Custom_Picked_Block{
                    source:  "qrc:/icons/" + Style.theme + "/utils/programming.svg"
                    text:  qsTr("О приложении") + mytrans.emptyString

                    onClicked_Signal :{

                        index_Page = 2
                    }
                }
            }
        }

        Rectangle {
            width: parent.width - navigationSettings_Rectangle.width
            height: parent.height
            color: Style.background_Color

            Loader{
                id: settings_Loader
                width: parent.width
                height: parent.height
                source: sourcePages_Array[index_Page]
                Component.onCompleted: index_Page = 0

                onSourceChanged: {

                    keyboard.check_close()

                }


            }
        }

    }

}
