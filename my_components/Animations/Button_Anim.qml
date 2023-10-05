import QtQuick 2.0

Item {

    property var animation_target

    property var icon_target

    property int time_Anim: 250

    property int error_dis: 10

    property real scale_val: 0.97

    property bool isRotated: false

    function create_error_anim(){

        error_anim.stop()

        error_anim.start()
    }

    function create_scale_anim(){

        scale_Anim.stop()

        scale_Anim.start()
    }

    function create_icon_anim(value){

        icon_Anim.target = icon_target

        if(value){

            icon_Anim.from =  -1 * parent.width

            icon_Anim.to = 0
        }
        else{

            icon_Anim.from =  parent.width

            icon_Anim.to = 0
        }

        icon_Anim.stop()

        icon_Anim.start()
    }

    function create_rotation_anim(){

       if(isRotated){

         //  rotate_Anim.from = animation_target.rotation

           rotate_Anim.to = 0

           isRotated = false
       }
       else{

          // rotate_Anim.from = animation_target.rotation

           rotate_Anim.to = -180

           isRotated = true

       }

       rotate_Anim.stop()

       rotate_Anim.start()
    }

    NumberAnimation { id: icon_Anim; property: "y"; from: -1 * parent.width; to: 0; duration: time_Anim

        onStarted: {

            if(!isChecked){

                isChecked = true
            }
            else{

                isChecked = false

            }
        }



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

    NumberAnimation {id: rotate_Anim; target: animation_target; property: "rotation"; from: animation_target.rotation; duration: 200}

}
