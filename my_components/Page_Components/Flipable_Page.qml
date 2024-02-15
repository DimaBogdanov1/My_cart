import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0


import my_components 1.0

Custom_Flipable {
    id: flipable
    width: parent.width
    height: parent.height

    property string front_source

    property string back_source

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

    }


}

