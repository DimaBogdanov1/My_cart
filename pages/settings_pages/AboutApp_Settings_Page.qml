import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0

import my_components 1.0

Item{
    width: parent.width
    height: parent.height

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

            Settings_Text{
                title: qsTr("Версия приложения")
                text_value: "1.0"

            }
            Custom_Border{color: Style.primaryDark_Color}

            Settings_Link{
                link: "mailto: to@adress.com" + "?subject=This is a subject" + "&body=This is the message"
                title: qsTr("Обратная связь")
            }

            Custom_Border{color: Style.primaryDark_Color}

            Settings_Link{
                link: "http://www.radioavionica.ru"
                title: qsTr("АО Радиоавионика")
            }
        }
    }

}
