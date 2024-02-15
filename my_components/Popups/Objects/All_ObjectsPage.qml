import QtQuick 2.15


Grid {
    id: grid
    width: parent.width
    height: parent.height
    rows: 2//2
    columns: 5// 5
    spacing: ui.basic_spacing / 2 //ui.margin_Menu / 2

    Repeater{
        id: repeater
        width: parent.width
        height: parent.height
        model: 10 //root_Item.model // popup.model

        Objects_Element{
            width: swipeView.width / grid.columns - ( ui.basic_spacing) / grid.columns - 1
            height: width // / ui.block_ratio

        }

    }
}

