import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import Register_Page 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    Register_Page{
        id: register_Page

        onNew_notification: {

            toast.show(value, 3000, 1) // Показываем Тоcт

            addUser_Button.create_error_anim()
        }

        onNew_Authorized_Account: {

            authorized_Account.login = login_value

            authorized_Account.color = color_value

        }
    }

    Register_Account_Block_Page {
        id: register_Account_Block_Page
        width: parent.width
        height: parent.height
        register_Page: register_Page

    }
}
