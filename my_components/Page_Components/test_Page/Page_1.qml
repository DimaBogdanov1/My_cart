import QtQuick 2.15
import my_components 1.0

Rectangle{
    width: parent.width
    height: parent.height
    color: "red"

    property string name

    Custom_Label{
        text: "1 " + name
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter

    }
}
