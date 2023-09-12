import QtQuick 2.0

Item {

    id:root_Item

    property var animation_target

    property int new_index

    property int time_Anim: 250

    function create_right_x_anim(){

        x_Anim.from = animation_target.x

        x_Anim.to = 0

        start_anim()
    }


    function create_left_x_anim(){

        x_Anim.from = animation_target.x

        x_Anim.to = animation_target.width

        start_anim()
    }

    function start_anim(){

        x_Anim.stop()

        x_Anim.start()
    }


    NumberAnimation {id: x_Anim ; target: animation_target; property: "x"; from: 0; to: animation_target.x; duration: time_Anim}

    NumberAnimation {id: up_Anim;

        target: animation_target; property: "y"; from: animation_target.height; to: 0; duration: time_Anim

        onStarted: {

           index_Page = root_Item.new_index

        }
    }


    NumberAnimation {id: down_Anim ; target: animation_target; property: "y"; from: -1 * animation_target.height; to: 0; duration: time_Anim

        onStarted: {

           index_Page = root_Item.new_index

        }
    }


}
