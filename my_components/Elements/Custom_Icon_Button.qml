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
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        color: color_rec
        visible: isNeedRectangle
        layer.enabled: true
        layer.effect: Mask_Rectangle{target: parent}

       // Border_Gradient{visible: isChecked }

    }

    Hover_Anim{
        id: hover_Anim
        width: parent.width
        height: parent.height
        needTip: root_Item.needTip
        tip_text: root_Item.tip_text

        onClicked_Signal: {

            button_Anim.create_scale_anim()

            root_Item.clicked_Signal()

        }
    }

   Custom_Icon{
       width: parent.width
       height: parent.height
       source: isChecked ? icon_checked_path : icon_path

    }


   Button_Anim{
      id: button_Anim
      animation_target: root_Item
      scale_val: 0.98
   }


}
