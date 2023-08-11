import QtQuick 2.0

Item {

    id:root_Item

    property var animation_target

    property int new_index

    property int time_Anim: 250

    function create_anim(last_index, new_index){

        root_Item.new_index = new_index

        if(last_index < new_index){

            down_Anim.stop()

            down_Anim.start()
        }
        else{

            up_Anim.stop()

            up_Anim.start()
        }

    }



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
