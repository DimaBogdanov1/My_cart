import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0

Item {
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.blue_Color

        Label{

            width: 100
            anchors.centerIn: parent
            color: Style.background_Color
            text: qsTr("Страница Истории") + mytrans.emptyString
        }

    }
}
