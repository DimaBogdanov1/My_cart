import QtQuick 2.0

Item {

    id:root_Item

    property var animation_target

    property int new_index

    property int time_Anim: 250

    property bool change_index

    property bool isClose

    property real from: 0

    function create_page_anim(new_index){

        change_index = true

        if(index_Page !== new_index){

            root_Item.new_index = new_index

            open_anim()

        }

    }

    function open_anim(){

        isClose = false

        opacity_Anim.from = root_Item.from

        opacity_Anim.to = 1

        opacity_Anim.stop()

        opacity_Anim.start()
    }

    function close_anim(){

        isClose = true

        opacity_Anim.from = 1

        opacity_Anim.to = 0

        opacity_Anim.stop()

        opacity_Anim.start()


    }



    NumberAnimation {id: opacity_Anim;

        target: animation_target; property: "opacity"; from: 0; to: 1; duration: time_Anim

        onStarted: {

            if(change_index){

                index_Page = root_Item.new_index

            }
        }

        /*onRunningChanged: {

            if (!running && isClose){

                //toolTip.close()

            }

        }*/


    }



}
