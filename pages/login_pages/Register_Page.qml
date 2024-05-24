import QtQuick 2.15


import Register_Page 1.0


import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Register_Page{
        id: register_Page

        onNew_notification: {

            //Authorized_Account.login = "dsd"

           // Authorized_Account.password = 1111

           // Authorized_Account.color = 3

            toast.show(value, 3000, 1) // Показываем Тоcт

        }
    }

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
            source: "qrc:/my_components/icons/" + Style.theme + "/utils/user.svg"
            start_Keyboard: root_Item.start_Keyboard

            model: [
                   { title: my_str.name, text: register_Page.name, isLetter_Keyboard: true},
                   { title: my_str.surname, text: register_Page.surname, isLetter_Keyboard: true}
               ]

            onTextChanged: {

                switch(index_model){

                case 0:

                    register_Page.set_Name(text)

                    break

                case 1:

                    register_Page.set_Surname(text)

                    break
                }

            }
        }

        Custom_Row_TextField{
            id: password_Row
            source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
            start_Keyboard: root_Item.start_Keyboard + ui.block_height + ui.middle_spacing


            model: [
                   { title: my_str.password, text: register_Page.password, password: true}
            ]

            onTextChanged: {

                register_Page.set_Password(text)

            }

        }

        Custom_Row_TextField{
            id: passwordRepeat_Row
            source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
            start_Keyboard: root_Item.start_Keyboard + (ui.block_height + ui.middle_spacing) * 2

            model: [
                   { title: my_str.addRepeat(my_str.password), text: register_Page.repeatPassword, password: true}
            ]

            onTextChanged: {

                register_Page.set_RepeatPassword(text)

            }

            /*model: ListModel{

                ListElement{
                    title: "Повторите пароль"
                    password: true
                    isLetter: false
                }

            }*/
        }

        Custom_Button{
            id: addUser_Button
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            text:  qsTr("Создать аккаунт")

            function update_firstLetter(string){

                return string.charAt(0).toUpperCase() + string.slice(1)
            }

            onClicked_Signal: {

                var name =  name_and_surname_Row.get_text(0)  //name_TextField.get_target().text

                var surname =  name_and_surname_Row.get_text(1)   ///surname_TextField.get_target().text

                var password = password_Row.get_text(0)   // password_TextField.get_target().text

                var repeat_password = passwordRepeat_Row.get_text(0)   // password_TextField.get_target().text

                var check = false


               // register_Page.add_User("DDrtem Qasasas", 3333)

                //name_and_surname_Row.open_error(0, "sdsd")

                if(name_and_surname_Row.check_text()){

                    if(password_Row.check_password() ){

                        if(password === repeat_password){

                            register_Page.add_User(update_firstLetter(name) + " " + update_firstLetter(surname), parseInt(password))


                            //Accounts.add_User(update_firstLetter(name) + " " + update_firstLetter(surname), parseInt(password))

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



        }





    }


    }


}

