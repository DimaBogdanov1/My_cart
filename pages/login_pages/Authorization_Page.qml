import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Back_Arrow{

        onClicked_Signal: {

            sub_index_LoginPage = 0 // Откатываемся На Выбор Аккаунта


        }
    }

    Column{
        width: ui.width_conetent_halfPage
        height: 300
        anchors.centerIn: parent
        spacing: ui.middle_spacing

        Account_With_Title{
           id: account_With_Title
           width: parent.width
           enabled: false
           login_account: login_authorization // Эти Переменные В Родителе
           color_account: color_authorization

       }

        Custom_Row_TextField{
            id: password_Row
            source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
            start_Keyboard: 68

            model: [
                   { title: "Пароль", text: ""}
               ]

        }

        /*Row{
            width: parent.width
            height: ui.block_height
            spacing: ui.basic_spacing

            Custom_Icon{
                height: ui.height_Button
                anchors.bottom: parent.bottom
                source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"

             }

            Custom_TextField {
                id: password_textField
                width: parent.width - ui.basic_spacing - ui.icon_nav_size
                title: qsTr("Пароль") + mytrans.emptyString
                password: true
                maximumLength: 4
                validator: IntValidator{}

                onReady_to_write_signal: {

                    keyboard.number = true

                    keyboard.text_target = password_textField.get_target()

                    keyboard.open(68)

                }

            }

        }*/



        Custom_Button{
            id: signIn_Button
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            text:  qsTr("Войти")
            onClicked_Signal: {

                Accounts.check_Password(account_With_Title.login_account, parseInt(password_Row.get_text(0)), account_With_Title.color_account)

            }

        }

    }

    Connections{
        target: Accounts

        function onResult_of_Authorization_signal(value){

            if(value){

                applicationWindow.flipped = true
            }
            else{

                signIn_Button.create_error_anim()
            }
        }
    }


}
