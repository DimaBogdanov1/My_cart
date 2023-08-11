import QtQuick 2.0

Item {

    id:root_Item

    property var animation_target

    property int new_index

    property int time_Anim: 250

    function create_anim(new_index){

        if(index_Page !== new_index){

            root_Item.new_index = new_index

            opacity_Anim.stop()

            opacity_Anim.start()

        }

    }



    NumberAnimation {id: opacity_Anim;

        target: animation_target; property: "opacity"; from: 0; to: 1; duration: time_Anim

        onStarted: {

            index_Page = root_Item.new_index
        }
    }



}
