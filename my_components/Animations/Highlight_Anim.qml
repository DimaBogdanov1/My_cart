import QtQuick 2.0

import Style 1.0
import my_components 1.0

Item {
    id: root_Item

    property var animation_target

    property int time_Anim: 150


    function open_anim(){

        opacity_Anim.open_anim()

       // width_Anim.from = 0

        //width_Anim.to = 1

        width_Anim.start()
    }

    function close_anim(){

        opacity_Anim.close_anim()

      //  width_Anim.from = 1

        //width_Anim.to = 0

        //width_Anim.start()

    }

    NumberAnimation {id: width_Anim; target: animation_target; property: "scale"; from: 0; to: 1; duration: time_Anim}



    Opacity_Anim{
        id: opacity_Anim
        animation_target: root_Item.animation_target
    }
}
