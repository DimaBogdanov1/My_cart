import QtQuick 2.0

Item {

    property var animation_target

    property int time_Anim: 250

    property int error_dis: 10

    property real scale_val: 0.97

    function create_error_anim(){

        error_anim.stop()

        error_anim.start()
    }

    function create_scale_anim(){

        scale_Anim.stop()

        scale_Anim.start()
    }

    SequentialAnimation{

        id: error_anim

        NumberAnimation {target: animation_target; property: "x"; from: animation_target.x; to: error_dis; duration: time_Anim / 4}

        NumberAnimation {target: animation_target; property: "x"; from: error_dis; to: -1 * error_dis; duration: time_Anim / 2}

        NumberAnimation {target: animation_target; property: "x"; from: -1 * error_dis; to: 0; duration: time_Anim / 4}

    }

    SequentialAnimation{
        id: scale_Anim

        NumberAnimation {target: animation_target; property: "scale"; from: 1; to: scale_val; duration: 200}

        NumberAnimation {target: animation_target; property: "scale"; from: scale_val; to: 1; duration: 200}

    }

}
