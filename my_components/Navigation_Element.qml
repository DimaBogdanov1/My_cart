import QtQuick 2.0
import my_components 1.0

Item {
    id: root_Item
    width:  parent.width
    height: ui.iconBlock_Size
    signal clicked_Signal

    property string icon_path

    property string icon_checked_path

    property bool isChecked

    property bool isNeedRectangle

    property bool needTip

    property string tip_text

    property string color_rec

    Rectangle{
        width: parent.width
        height: parent.height
        color: color_rec
        visible: isNeedRectangle
        radius: ui.radius

    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
        needTip: root_Item.needTip
        tip_text: root_Item.tip_text

        onClicked_Signal: {

            root_Item.clicked_Signal()

        }
    }

    Image {
       sourceSize.width:  ui.icon_nav_size
       sourceSize.height:  ui.icon_nav_size
       source: isChecked ? icon_checked_path : icon_path
       anchors.centerIn: parent
       smooth: false // Убираем Сглаживание
       fillMode: Image.TileVertically
    }
}
