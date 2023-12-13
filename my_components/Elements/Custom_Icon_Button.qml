import QtQuick 2.0

import Style 1.0

import my_components 1.0

Item {
    id: root_Item
    width:  ui.iconBlock_topBar_Size
    height: ui.iconBlock_topBar_Size
    clip: true

    signal clicked_Signal

    property string icon_path

    property string icon_checked_path

    property bool isChecked

    property bool isNeedRectangle

    property bool needTip

    property string tip_text

    property string color_rec

    property string color_border

    property real rotation: 0

    property bool needBorder


    function create_icon_anim(){

        button_Anim.create_icon_anim(isChecked)
    }

    Rectangle{
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        color: color_rec
        visible: isNeedRectangle
        radius: ui.radius
       // layer.enabled: true
       // layer.effect: Mask_Rectangle{target: parent}

        border{

            width: needBorder ?  ui.border_Size : 0
            color: color_border
        }

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
       id: icon
       width: parent.width
       height: parent.height
       rotation: root_Item.rotation
       source: isChecked ? icon_checked_path : icon_path

    }


   Button_Anim{
      id: button_Anim
      animation_target: root_Item
      icon_target: icon
      scale_val: 0.985
   }


}
