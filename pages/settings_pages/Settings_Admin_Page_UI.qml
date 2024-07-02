import QtQuick 2.15
import QtQuick.Controls 2.15

import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Column{
        width: ui.width_conetent_halfPage
        height: titles.height + admin_Block.height + spacing
        anchors.centerIn: parent
        spacing:  ui.middle_spacing

        Titles{
            id: titles
            first_title: qsTr("Получите права администратора!)")
            second_title: qsTr("Пожалуйста, введите данные для получение прав администратора")
        }

        Custom_Row_TextField{
            id: admin_Block
            width: parent.width
            height:  width / 4 - spacing * 3//+ ui.height_MiniTitle //+ spacing * 3
            start_Keyboard: 250
            pin_visible: true

            model: [
                     {maximumLength: 1},
                     {maximumLength: 1},
                     {maximumLength: 1},
                     {maximumLength: 1},
               ]

            onTextChanged: {

                switch(index_model){

                case 0:

                    set_focus(1)

                    break

                case 1:

                    set_focus(2)

                    break

                case 2:

                    set_focus(3)

                    break

                case 3:

                   // set_text(0, "")
                   // set_text(1, "")
                   // set_text(2, "")

                   // set_text(3, "")

                    set_focus(0)

                    button_Anim.create_error_anim()



                   toast.show("Проверка пароля!", 3000, 1) // Показываем Тоcт

                    break
                }
            }
        }



        Button_Anim{
           id: button_Anim
           animation_target: admin_Block

           onFinish_anim_Signal: {

               admin_Block.set_text(0, "")

               admin_Block.set_text(1, "")

               admin_Block.set_text(2, "")

               admin_Block.set_text(3, "")
           }
        }

      /*  Admin_Block{
            id: admin_Block
            width: parent.width
            height: 200

        } */

    }


}
