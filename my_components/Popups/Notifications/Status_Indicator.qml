import QtQuick 2.15

Item{
    width: 8
    height: parent.height

    readonly property var colors_status: ["#FFA300", "#FFA300"]

    property int status: 0

    Rectangle{
        width: parent.width
        height: parent.width
        radius: width / 2
        anchors.centerIn: parent
        color: colors_status[status]

    }
}
