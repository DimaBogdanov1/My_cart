import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import QtQml.Models 2.2
import QtQml 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.15

import QtLocation 5.15

import QtPositioning 5.15
import QtQuick.LocalStorage 2.0
import QtQuick.Dialogs 1.0


ListView {

    function show(text, duration, status) {
        model.insert(0, {text: text, duration: duration, status: status});
    }


    id: root

    z: Infinity
    spacing: 5
    width: 500
    height:  48
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 75
    anchors.horizontalCenter: parent.horizontalCenter
    verticalLayoutDirection: ListView.BottomToTop

    interactive: false

    displaced: Transition {
        NumberAnimation {
            properties: "y"
            easing.type: Easing.InOutQuad
        }
    }

    delegate: Toast {
        Component.onCompleted: {
            if (typeof duration === "undefined") {
                show(text); // Если Не Задали Время Тоста
            }
            else {
                show(text, duration, status);
            }
        }
    }

    model: ListModel {id: model}
}
