import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0


import my_components 1.0

Flipable {
    id: flipable
    width: parent.width
    height: parent.height
    z: 1

    property bool flipped: false

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
        angle: 0    // the default angle
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: flipable.flipped


    }

    transitions: Transition {

        NumberAnimation {
            target: rotation;
            property: "angle";
            duration: 700

        }
    }


}

