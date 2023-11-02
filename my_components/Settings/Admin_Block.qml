import QtQuick 2.0
import QtQuick.Controls 2.12

import Style 1.0
import my_components 1.0


Item{
    id: root_Item
    width: size_block * root_Item.model + ui.big_spacing * (root_Item.model - 1)
    height: size_block

    property string admin_password: "1234"

    property string input_password

    property int cur_index: 0

    property real size_block: ui.height_Button * 1.5

    property int model: 4

    property bool check_reset: true

    function reset_text(){

        check_reset = false


        for(var i = 0; i < model; i++){

            repeater.itemAt(i).text = ""
        }

        input_password = ""

        cur_index = 0

        check_reset = true

        keyboard.text_target = repeater.itemAt(cur_index)

    }

    Row{
        width: parent.width
        height: parent.height
        spacing: ui.big_spacing

        Repeater{
            id: repeater
            width: parent.width
            height: parent.height
            model: root_Item.model

            Custom_Rectangle_Label {
                width: ui.height_Button * 1.5
                height: width
                pixel_size: ui.text_MiddleSize
               // needBack: false
               // horizontal: Text.AlignLeft
                text: ""
                color: Style.background_Color

                onTextChanged: {

                    if(cur_index < 3 && check_reset){

                        if(text != "•"){

                            input_password += repeater.itemAt(cur_index).text

                            repeater.itemAt(cur_index).text = "•"

                            cur_index++

                            keyboard.text_target = repeater.itemAt(cur_index)

                        }

                    }
                    else{

                        if(input_password.length != root_Item.model){

                            input_password += text

                            repeater.itemAt(root_Item.model - 1).text = "•"

                            if(input_password == admin_password){

                                toast.show("Проверка пройдена " + input_password, 3000, 1)

                            }
                            else{

                                keyboard.text_target = null //repeater.itemAt(cur_index)

                                button_Anim.create_error_anim()
                            }

                        }


                    }


                }

            }

        }
    }

    Button_Anim{
       id: button_Anim
       animation_target: root_Item

       onFinish_anim_Signal: {

           reset_text()
       }
    }

    MouseArea{
        anchors.fill: parent

        onClicked: {

            keyboard.number = true

            keyboard.text_target = repeater.itemAt(0)

            keyboard.open(300)

        }
    }


}



