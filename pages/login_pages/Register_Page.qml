import QtQuick 2.15

import Style 1.0


import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height


    /* Component.onCompleted:{

         console.log("width = " + width.toString())

         console.log("height = " + height.toString())
     }*/

    property int start_Keyboard: 23

    Back_Arrow{
        visible: !applicationWindow.flipped // Видна Только На Стартовом Окне
        onClicked_Signal: {

            sub_index_LoginPage = 0 // Откатываемся На Выбор Аккаунта


        }
    }

    Column{
        width: ui.width_conetent_halfPage //parent.width * 0.7
        height: ui.text_BigSize + 50 + ui.block_height * 3 + ui.height_Button + ui.middle_spacing * 4
        anchors.centerIn: parent
        spacing:  ui.middle_spacing

        Titles{
            first_title: qsTr("Создадим аккаунт!")
            second_title: qsTr("Пожалуйста, введите свои данные для создания аккаунта")
        }

        /*Row{
            width: parent.width
            height: ui.block_height
            spacing: ui.basic_spacing

            Custom_Icon{
                height: ui.height_Button
                anchors.bottom: parent.bottom
                source: "qrc:/icons/" + Style.theme + "/utils/user.svg" // "qrc:/icons/light_theme/top_bar/location.svg"

             }

            Custom_TextField {
                id: name_TextField
                width: parent.width / 2 - ui.basic_spacing - ui.icon_nav_size / 2
                title: qsTr("Имя")
                maximumLength: 15
                validator: IntValidator{}

                onReady_to_write_signal: {

                    keyboard.number = false

                    keyboard.text_target = get_target()

                    keyboard.open(root_Item.start_Keyboard)

                }

            }

            Custom_TextField {
                id: surname_TextField
                width: parent.width / 2 - ui.basic_spacing - ui.icon_nav_size / 2
                title: qsTr("Фамилия")
                maximumLength: 15
                validator: IntValidator{}

                onReady_to_write_signal: {

                    keyboard.number = false

                    keyboard.text_target = get_target()

                    keyboard.open(root_Item.start_Keyboard)

                }

            }
        }

        */

        Custom_Row_TextField{
            id: name_and_surname_Row
            source: "qrc:/icons/" + Style.theme + "/utils/user.svg"
            start_Keyboard: root_Item.start_Keyboard
            model: ListModel{

                ListElement{
                    title: "Имя"
                    password: false
                    maximumLength: 15
                    isLetter: true
                }

                ListElement{
                    title: "Фамилия"
                    password: false
                    maximumLength: 15
                    isLetter: true

                }
            }
        }

        Custom_Row_TextField{
            id: password_Row
            source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"
            start_Keyboard: root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
            model: ListModel{

                ListElement{
                    title: "Пароль"
                    password: true
                    isLetter: false
                }

            }
        }

        Custom_Row_TextField{
            id: passwordRepeat_Row
            source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"
            start_Keyboard: root_Item.start_Keyboard + (ui.block_height + ui.middle_spacing) * 2
            model: ListModel{

                ListElement{
                    title: "Повторите пароль"
                    password: true
                    isLetter: false
                }

            }
        }

       /* Row{
            width: parent.width
            height: ui.block_height
            spacing: ui.basic_spacing

            Custom_Icon{
                height: ui.height_Button
                anchors.bottom: parent.bottom
                source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"

             }

            Custom_TextField {
                id: password_TextField
                width: parent.width - ui.basic_spacing - ui.icon_nav_size
                title: qsTr("Пароль")
                password: true
                maximumLength: 4
                validator: IntValidator{}

                onReady_to_write_signal: {

                    keyboard.number = true

                    keyboard.text_target = get_target()

                    keyboard.open(root_Item.start_Keyboard + ui.block_height + ui.middle_spacing)

                }

            }

        }

        */
       /* Row{
            width: parent.width
            height: ui.block_height
            spacing: ui.basic_spacing

            Custom_Icon{
                height: ui.height_Button
                anchors.bottom: parent.bottom
                source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"

             }

            Custom_TextField {
                id: passwordRepeat_TextField
                width: parent.width - ui.basic_spacing - ui.icon_nav_size
                title: qsTr("Повторите пароль")
                password: true
                maximumLength: 4
                validator: IntValidator{}

                onReady_to_write_signal: {

                    keyboard.number = true

                    keyboard.text_target = get_target()

                    keyboard.open(root_Item.start_Keyboard + ui.block_height + ui.middle_spacing)

                }

            }

        }

        */

        Custom_Button{
            id: addUser_Button
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            text:  qsTr("Создать аккаунт")
            onClicked_Signal: {

                var name =  name_and_surname_Row.get_text(0)  //name_TextField.get_target().text

                var surname =  name_and_surname_Row.get_text(1)   ///surname_TextField.get_target().text

                var password = password_Row.get_text(0)   // password_TextField.get_target().text

                var repeat_password = passwordRepeat_Row.get_text(0)   // password_TextField.get_target().text

                var check = false


                if(name_and_surname_Row.check_text()){

                    if(password_Row.check_password() ){

                        if(password === repeat_password){

                            Accounts.add_User(update_firstLetter(name) + " " + update_firstLetter(surname), parseInt(password))

                            check = true
                        }
                        else{

                            passwordRepeat_Row.open_error(0, "Пароли не совпадают!")

                        }

                }


                if(!check){

                    create_error_anim()

                }



            }

            function update_firstLetter(string){

                return string.charAt(0).toUpperCase() + string.slice(1)
            }

        }





    }

    Connections{
        target: Accounts

        function onResult_of_Adding_signal(value){

            if(value){

                if(!applicationWindow.flipped){

                    applicationWindow.flipped = true
                }
                else{
                    /// ???

                  //  back_Loader.item.index_Page = 0

                   // back_Loader.item.sub_index_HomePage = 1
                }

            }
            else{

                addUser_Button.create_error_anim()

            }

            console.log("результат добавления " + value.toString())

            toast.show("результат добавления " + value.toString(), 3000, 1) // Показываем Тоcт
        }
    }

    }


}

