import QtQuick 2.15
import QtGraphicalEffects 1.0

OpacityMask {

    id: root
    property var target

    property var radius: ui.radius

    property bool botom_rec

    maskSource: Item {
       width: target.width
       height: target.height
       Rectangle {
           anchors.centerIn: parent
           width: parent.width
           height: parent.height
           radius: root.radius


       }

       Rectangle {
           anchors.bottom: parent.bottom
           width: parent.width
           visible: botom_rec
           height: parent.height / 2 //root.radius * 6
       }
    }
}
