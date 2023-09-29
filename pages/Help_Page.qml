import QtQuick 2.15

import Style 1.0
import MyLang 1.0

import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Custom_Rectangle_Label {
        margin_text: 0
        needBack: false
        anchors.centerIn: parent

        text: qsTr("Страница помощи") + mytrans.emptyString
    }
}
