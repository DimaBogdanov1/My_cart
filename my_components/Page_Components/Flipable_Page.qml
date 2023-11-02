import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0

import MyLang 1.0
import my_components 1.0

Flipable {
    id: flipable
    width: parent.width
    height: parent.height

    property string front_source

    property string back_source

    property bool flipped: false

    front:Loader{
        id: front_Loader
        width: parent.width
        height: parent.height
        focus: true
        Component.onCompleted: source = front_source

    }


    back: Loader{
            id: back_Loader
            width: parent.width
            height: parent.height
            focus: true
            Component.onCompleted: source = back_source


        }

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

        onRunningChanged: {

            if (running && flipable.flipped){

                console.log("Авторизовались в приложении")

                back_Loader.item.index_Page = 0

                back_Loader.item.sub_index_HomePage = 1

            }

            if (running && !flipable.flipped){

                console.log("Вышли на стартовый экран")

                front_Loader.item.sub_index_LoginPage = 0

            }
        }

        NumberAnimation {
            target: rotation;
            property: "angle";
            duration: 700

        }
    }


}

