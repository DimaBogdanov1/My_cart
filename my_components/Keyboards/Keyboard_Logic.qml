import QtQuick 2.15
import my_components 1.0

Item {
    id: root_Item

    property string value

    property bool isNumber_Keyboard

    property bool check_dot

    Audio_Sounds{
        id: audio
    }

    function change_caps(){

        if(!keyboard_Loader.item.caps){

            keyboard_Loader.item.caps = true
        }
        else{

            keyboard_Loader.item.caps = false
        }
    }

    function delete_symbol(){

       audio.play_symbol()

       delete_symbol_signal()

       text_target.text = text_target.text.slice(0, -1)

       value = value.slice(0, -1) // Стираем Последний Символ

    }

    function add_symbol(symbol){

        audio.play_symbol()

        value += symbol

        text_target.text += symbol
      //  new_symbol_signal(symbol)

        if(value.length === 1 || check_dot){

            if(!isNumber_Keyboard){

                keyboard_Loader.item.caps = false

                check_dot = false
            }

        }


    }

    function add_space(){

        if(value.length !== 0){

            audio.play_symbol()

            value += " "

            text_target.text += " "

        }
    }

    function add_dot(){

        var lastChar =  value.substr(value.length - 1)

        if(lastChar !== "." && value.length !== 0){

            audio.play_symbol()

            value += ". "

            text_target.text += ". "

            if(!keyboard_Loader.item.caps){

                keyboard_Loader.item.caps = true
            }

            check_dot = true
        }

    }

    function enter(){

        audio.play_symbol()

        text_target.focus = false

        close()

        toast.show("Ввод", 3000, 1)

    }

    function change_language(){

        var tmp_chek = false

        if(keyboard_Loader.item.caps){

            tmp_chek = true
        }

        if(keyboard_Loader.num_model === 0){

            keyboard_Loader.num_model = 1
        }
        else{

            keyboard_Loader.num_model = 0
        }

        keyboard_Loader.item.caps = tmp_chek
    }

}
