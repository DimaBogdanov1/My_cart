import QtQuick 2.15


Item {
    id: root_Item
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.blue_Color

        /*Item { // Создаём Блок Со Стрелкой
            id: image_Item
            width:  parent.width
            height: 192
            anchors.centerIn: parent

                Image {
                   width:  parent.height
                   height: parent.height
                   source: "../images/logo_white_trans.png"
                   anchors.centerIn: parent
                   smooth: false // Убираем Сглаживание
                   fillMode: Image.PreserveAspectCrop
                }

        }*/
    }

    Component.onCompleted: {

        splash_Screen_Anim.start()
    }


    NumberAnimation {id: splash_Screen_Anim; target: root_Item; property: "x"; from: 0 ; to: -1 * root_Item.width; duration: 2000; onFinished: start_Loader.source = ""}

}
