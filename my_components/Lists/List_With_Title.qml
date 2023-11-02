import QtQuick 2.0
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Column{
    id: root_Column
    width: parent.width
    height: ui.block_height //ui.height_Button +  ui.text_miniSize + ui.basic_spacing / 2
    spacing: ui.basic_spacing / 2

    property string title

    property var delegate

    property var title_name_model

    property var title_size_model

    property var model

    Mini_Title{
        id: title_Block
        text: root_Column.title

    }

    Rectangle{
        width: parent.width
        height: parent.height - title_Block.height - ui.basic_spacing / 2
        color: Style.background_Color
        radius: ui.radius
        clip: true


        Column{
            width: parent.width - ui.big_spacing
            height:  parent.height - ui.basic_spacing / 2
            anchors.centerIn: parent
            spacing: ui.border_Size

            List_Row{
                id: title_Row2
                model: root_Column.title_name_model
                sizes: root_Column.title_size_model
            }

            Custom_Border{}

            My_List{
               id: list
               width: parent.width
               height:  parent.height
               model: root_Column.model

               delegate: root_Column.delegate

               /*delegate: List_Row{
                   listview: list
                   width: list.width
                   model: [code, name]
                   sizes: title_Row.sizes
                   cur: list.currentIndex

               }*/
            }
        }

    }
}
