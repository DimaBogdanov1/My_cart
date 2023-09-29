import QtQuick 2.0

Item {

    property var page_target

    property var keyboard_target

    property real up_val

    property int time_Anim: 250

    function up_content(){

        downPage_Anim.stop()

        up_Amim.start()


    }

    function down_content(){

        up_Amim.stop()

        down_Amim.start()

    }


    ParallelAnimation {

       id: down_Amim

       NumberAnimation {id: downPage_Anim; target: page_target; property: "y"; from: page_target.y ; to: 0; duration:  time_Anim}

       NumberAnimation {target: keyboard_target; property: "anchors.bottomMargin"; from: keyboard_target.anchors.bottomMargin ; to: -1 * keyboard_target.height ; duration: time_Anim}

       onRunningChanged: {

           if(!running){

               on_keyboard = false

           }
       }
    }




    ParallelAnimation {

       id: up_Amim

       NumberAnimation {target: page_target; property: "y"; from: page_target.y ; to:  -1 * up_val; duration: time_Anim}

       NumberAnimation {target: keyboard_target; property: "anchors.bottomMargin"; from: keyboard_target.anchors.bottomMargin ; to: 0; duration: time_Anim}

       //parent.height - keyboard_target.height
    }

}
