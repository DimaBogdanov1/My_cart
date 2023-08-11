import QtQuick 2.0
import QtQuick.Window 2.12
import QtQml.Models 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4

import Style 1.0 // Импорт QML синглетона

Switch{


    property int radius_Rectangle: 30 // Радиус Скругления

    property int size_Rectangle: 20 // Размер Прямоугольника


    implicitWidth: 40


    style: SwitchStyle{

        groove: Rectangle {
            implicitHeight: size_Rectangle * 0.7
            implicitWidth: 30
            radius: 30
            color: "#ceccfd"


        }

        handle: Item {

            Rectangle {
                implicitWidth: size_Rectangle
                implicitHeight: size_Rectangle
                color:  Style.accent
                anchors.centerIn: parent
                radius: radius_Rectangle
            }

        }


    }
}
