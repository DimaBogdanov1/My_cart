import QtQuick 2.0

Item {

    property int time_Anim: 250

    function get_enter(){

        return enter_anim
    }

    function get_dialog_enter(){

        return enter_dialog_anim
    }


    function get_exit(){

        return exit_anim
    }

    function get_dialog_exit(){

        return exit_dialog_anim
    }

    function get_account_enter(){

        return enter_account_anim
    }

    Transition {
        id: enter_anim
            ParallelAnimation {
                NumberAnimation {
                    property: "opacity";
                    from: 0;
                    to: 1;
                    duration: time_Anim
                }

            }
        }

    Transition {
        id: enter_dialog_anim
            ParallelAnimation {
                NumberAnimation {
                    property: "opacity";
                    from: 0;
                    to: 1;
                    duration: time_Anim
                }

                NumberAnimation {
                    property: "scale";
                    from: 0.4;
                    to: 1.0;
                    duration: time_Anim / 2
                }


            }
        }

    Transition {
        id: exit_anim
        ParallelAnimation {

            NumberAnimation {
                property: "opacity";
                from: 1;
                to: 0;
                duration: time_Anim
            }

        }
    }

    Transition {
        id: exit_dialog_anim

            SequentialAnimation{

                ParallelAnimation {

                    NumberAnimation {
                        property: "opacity";
                        from: 1;
                        to: 0;
                        duration: time_Anim
                    }

                    NumberAnimation {
                        property: "scale";
                        from: 1;
                        to: 0.8;
                        duration: time_Anim / 2
                    }

                }

                NumberAnimation {
                    property: "scale";
                    from: 1;
                    to: 1;
                    duration: time_Anim
                }

            }


        }

    Transition {
        id: enter_account_anim
            ParallelAnimation {
                NumberAnimation {
                    property: "x";
                    from: 0;
                    to: ui.width_Navigation + ui.basic_spacing;
                    duration: time_Anim
                }

                NumberAnimation {
                    property: "scale";
                    from: 0.4;
                    to: 1.0;
                    duration: time_Anim
                }


            }
        }
}
