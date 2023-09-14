import QtQuick 2.0

Item{
    id: root_Item
    width: ui.icon_nav_size
    height: ui.icon_nav_size

    property string source

    property real icon_size: ui.icon_nav_size

    Image {
       sourceSize.width:  root_Item.icon_size
       sourceSize.height: root_Item.icon_size
       anchors.centerIn: parent
       smooth: false // Убираем Сглаживание
       source: root_Item.source
       fillMode: Image.TileVertically
    }

}
