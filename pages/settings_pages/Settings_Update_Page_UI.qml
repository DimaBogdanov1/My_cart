import QtQuick 2.15

import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Custom_Rectangle_Label{
        width: parent.width
        height: parent.height
        needBack: true
        needBorder: true
        text: "Тут будет страница для обновления приложения!"
    }
}
