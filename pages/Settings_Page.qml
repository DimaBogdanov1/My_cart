import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.secondaryAccent_Color

        Label{

            width: 100
            anchors.centerIn: parent
            color: Style.background_Color
            text: qsTr("Страница Настроек") + mytrans.emptyString
        }

        /*Custom_Slider{

            width: 100
            height: 50
        }*/

    }
}
