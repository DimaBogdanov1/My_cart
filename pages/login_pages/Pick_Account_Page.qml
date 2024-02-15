import QtQuick 2.15

import Pick_Account_Page 1.0
import Style 1.0


import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Pick_Account_Page{
        id: pick_Account_Page

    }

    Column{
          width: 300
           height: parent.height
           spacing: 30

        Custom_Button{
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            text:  qsTr("Продолжить")
            onClicked_Signal: {

            }

        }

        Custom_Button{
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            text:  qsTr("Добавить аккаунт")
            onClicked_Signal: {
                sub_index_LoginPage = 2

            }

        }

        Custom_Button{
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            text:  qsTr("Удалить аккаунт")
            onClicked_Signal: {

              //  Accounts.delete_User(account_model.get(0).id_val)

                //account_model.remove(0)
            }

        }

    }

    Column{
        width: parent.width
        height: ui.text_BigSize + 50 + ui.height_Button * 2 + ui.middle_spacing + ui.text_SmallSize +  ui.middle_spacing * 3
        anchors.centerIn: parent
        spacing: ui.middle_spacing

        Titles{
            first_title: qsTr("C возвращением!)")
            second_title: qsTr("Для смены или создания аккаунта нажмите ниже")
        }


        ListView{
           id: list
           width:  list.count * 130 + (ui.big_spacing * (list.count - 1)) //list.count * 130 > applicationWindow.width ? parent.width : list.count * 130
           height: ui.height_Button * 2 + ui.middle_spacing + ui.text_SmallSize
           //interactive:  false//list.count * 130 > applicationWindow.width
           model: pick_Account_Page.My_Accounts_Model // ListModel{id: account_model}

           snapMode: ListView.SnapToItem
           //clip: true

           currentIndex: 0
           anchors.horizontalCenter: parent.horizontalCenter
           spacing: ui.big_spacing
           orientation: ListView.Horizontal

           property bool isScrolling

           delegate: Account_With_Title{
               width: 130
               id_account:  0 //index + 1
               login_account: login //login_val
               color_account:color // color_val

               onPickedAccount_Signal: {

                   if (!list.moving){

                       if(index != list.count - 1){

                           login_authorization = picked_login

                           color_authorization = picked_color

                           sub_index_LoginPage = 1
                       }
                       else{

                           sub_index_LoginPage = 2

                       }
                   }



               }
           }


          /* populate: Transition {
                   id: _popuTrans
                   SequentialAnimation {
                       PropertyAction { property: "scale"; value: 0.0 }
                       PauseAnimation { duration: 200 * _popuTrans.ViewTransition.index }
                       NumberAnimation { property: "scale"; from: 0.0; to: 1.0; duration: 400; easing.type: Easing.InOutQuad }
                   }
               }

               add: Transition {
                   NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
               } */





           Component.onCompleted: {

//               account_model.append( {"id_val": -1, "login_val": "new user", "color_val": 4, "icon_val": true})

             //  Accounts.get_All_Users()

           }

        }



        /*Connections{
            target: Accounts

            function onNewUser_signal(id, login, password, color){

                account_model.insert(0, {"id_val": id, "login_val": login, "color_val": color, "icon_val": false})



               // account_model.append({"id_val": id, "login_val": login, "color_val": color, "icon_val": false})
            }
        }*/


    }


    Custom_Rectangle_Label {
        margin_text: 0
        needBack: false
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: ui.middle_spacing

        }

        text: qsTr("Версия приложения 1.0")
    }

}
