import QtQuick 2.0
import QtQuick.Window 2.12
import QtQml.Models 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4

import Style 1.0 // Импорт QML синглетона
import my_components 1.0

Switch{

    id: root

    property int radius_Rectangle: 30 // Радиус Скругления

    property int size_Rectangle: ui.height_Button /2 // Размер Прямоугольника

    property real width_Switch: ui.height_Button

    //width: root.width_Switch;
    anchors.verticalCenter: parent.verticalCenter

    indicator: Rectangle {

        implicitWidth: root.width_Switch
        implicitHeight: size_Rectangle
        radius: radius_Rectangle
        anchors.verticalCenter: parent.verticalCenter
        //color: root.checked ? Style.accent_Color : Style.accentLight_Color

        layer.enabled: true
        layer.effect: Mask_Rectangle{target: parent}

        Main_Gradient{off: !root.checked}


        Item{
            x: root.checked ? parent.width - width - ui.border_Size / 2 : ui.border_Size / 2
            implicitWidth: parent.height
            implicitHeight: parent.height

            Rectangle{
                implicitWidth: parent.height
                implicitHeight: parent.height              
                anchors.centerIn: parent
                color: "white"
                layer.enabled: true
                layer.effect: Mask_Rectangle{target: parent; radius: radius_Rectangle}

                Border_Gradient{}

            }

            Behavior on x {

                NumberAnimation {duration:  200}
            }
        }



    }

}
