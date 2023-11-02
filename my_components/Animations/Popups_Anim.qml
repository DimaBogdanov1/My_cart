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

    function get_account_exit(){

        return exit_account_anim
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
                    property: "y";
                    from: applicationWindow.height + parent.height;
                    to: applicationWindow.height - parent.height - ui.basic_spacing;//parent.width - ui.basic_spacing; // ui.width_Navigation + ui.basic_spacing;
                    duration: time_Anim
                }

                /*NumberAnimation {
                    property: "scale";
                    from: 0.4;
                    to: 1.0;
                    duration: time_Anim
                }*/


            }
        }

    Transition {
        id: exit_account_anim
            ParallelAnimation {

                NumberAnimation {
                    property: "y";
                    from: applicationWindow.height - parent.height - ui.basic_spacing
                    to: applicationWindow.height + parent.height; //parent.width - ui.basic_spacing; // ui.width_Navigation + ui.basic_spacing;
                    duration: time_Anim
                }

            }
        }


    function get_notification_enter(){

        return enter_notification_anim
    }

    Transition {
        id: enter_notification_anim
            ParallelAnimation {

                NumberAnimation {
                    property: "y";
                    from: parent.y;
                    to:  start_y;
                    duration: 10 //time_Anim
                }

                NumberAnimation {
                    property: "opacity";
                    from: 0;
                    to: 1;
                    duration: 10
                }
                NumberAnimation {
                    property: "x";
                    from: -1 * parent.width;
                    to: ui.width_Navigation + ui.basic_spacing
                    duration: time_Anim
                }

            }
        }

    function get_notification_exit(){

        return exit_notification_anim
    }

    Transition {
        id: exit_notification_anim

        ParallelAnimation {

            NumberAnimation {
                property: "opacity";
                from: 1;
                to: 0;
                duration: time_Anim
            }

            NumberAnimation {
                property: "y";
                from: applicationWindow.height - parent.height - ui.basic_spacing
                to: applicationWindow.height + parent.height; //parent.width - ui.basic_spacing; // ui.width_Navigation + ui.basic_spacing;
                duration: time_Anim

            }

        }

        }


    function get_menu_enter(){

        return enter_menu_anim
    }

    Transition {
        id: enter_menu_anim


            ParallelAnimation {

                onStarted: {

                    popup.start_Enter = true
                }

                NumberAnimation {
                    property: "opacity";
                    from: 0;
                    to: 1;
                    duration: time_Anim
                }

              /*  NumberAnimation {
                    property: "width";
                    from: 0;
                    to: parent.width;
                    duration: time_Anim
                }

                NumberAnimation {
                    property: "height";
                    from: 0;
                    to: parent.height;
                    duration: time_Anim
                }*/

               /* NumberAnimation {
                    property: "scale";
                    from: 0.4;
                    to: 1.0;
                    duration: time_Anim
                }*/

            }
        }
}
