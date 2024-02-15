import QtQuick 2.15

import Style 1.0
import my_components 1.0

Rectangle{
    width: parent.width
    height: parent.height
    color: "red"
    clip: true

    Image {
        width: parent.width
        height: parent.height
       anchors.centerIn: parent
       smooth: false
       source: "qrc:/images/original.jpg"
       fillMode: Image.PreserveAspectCrop
       clip: true

    }
    Custom_Rectangle_Label {
        id: label

        needBack: false
        text_color: Style.background_Color
        horizontal: Text.AlignLeft
        boldStyle: true
        text: "Мост"

        anchors{
            left: parent.left
            leftMargin: 10

            bottom: parent.bottom
            bottomMargin: 10
        }
    }
}
