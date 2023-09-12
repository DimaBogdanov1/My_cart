import QtQuick 2.0

Item{
    id: root_Item
    width: ui.icon_nav_size
    height: ui.icon_nav_size

    property string source

    Image {
       sourceSize.width:  ui.icon_nav_size
       sourceSize.height:  ui.icon_nav_size
       anchors.centerIn: parent
       smooth: false // Убираем Сглаживание
       source: root_Item.source
       fillMode: Image.TileVertically
    }

}
