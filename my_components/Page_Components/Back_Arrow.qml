import QtQuick 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: ui.toolBar_Size

    signal clicked_Signal

    Item{
         width: parent.width - ui.big_spacing
         height: parent.height - ui.big_spacing
         anchors.centerIn: parent

         Item{
              width: ui.iconBlock_topBar_Size
              height: ui.iconBlock_topBar_Size
              anchors.left: parent.left
              anchors.verticalCenter: parent.verticalCenter

              Custom_Icon_Button{
                  id: back_Element
                  isNeedRectangle: true
                  color_rec: Style.light_Color
                  icon_path: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"
                  onClicked_Signal: {

                     root_Item.clicked_Signal()
                  }
              }


          }
    }
}


