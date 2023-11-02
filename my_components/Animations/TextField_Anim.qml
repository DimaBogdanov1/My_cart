import QtQuick 2.15

Item {

    readonly property int time_Anim: 250

    property var animation_target

    function open_close_anim(){

        openClose_Anim.stop()

        openClose_Anim.start()


    }

    SequentialAnimation{

        id: openClose_Anim

        ParallelAnimation{

            NumberAnimation {target: animation_target; property: "y"; from: -1 * ui.text_miniSize; to: 0; duration: time_Anim }

            NumberAnimation {target: animation_target; property: "opacity"; from: animation_target.opacity; to: 1; duration: time_Anim }

        }


        PauseAnimation { duration: time_Anim * 8 }


        ParallelAnimation{

            NumberAnimation {target: animation_target; property: "y"; from: 0; to: -1 * ui.text_miniSize; duration: time_Anim }

            NumberAnimation {target: animation_target; property: "opacity"; from: 1; to: 0; duration: time_Anim}

        }


    }
}
