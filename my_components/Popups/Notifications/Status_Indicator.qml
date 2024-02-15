import QtQuick 2.15
import qml.status_ind 1.0

Item{
    width: 8
    height: parent.height

    readonly property var colors_status: ["green", "#FFA300", "red"]

    property int status: Status_Indicator.Positive_Status

    Rectangle{
        width: parent.width
        height: parent.width
        radius: width / 2
        anchors.centerIn: parent
        color: colors_status[status]

    }
}
