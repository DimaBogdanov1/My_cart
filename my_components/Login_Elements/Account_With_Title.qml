import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Column{
    id: root_Column
    width: parent.width
    height: ui.height_Button * 2 + ui.middle_spacing + ui.text_SmallSize
    spacing: ui.middle_spacing

    property int id_account: 0

    property int color_account: 0

    property bool isIcon

    property string login_account: "Dima Bogdanov"

    signal pickedAccount_Signal(picked_login: string, picked_color: int)

    Account_Icon{
       id: account_Icon
       size: Account_Icon.Size.Big
       isIcon: root_Column.isIcon
       login: root_Column.login_account
       color_value: root_Column.color_account

       onClicked_Signal: {

           pickedAccount_Signal(login, color_value)
       }
   }

    Custom_Rectangle_Label {
        id: label
        width: parent.width
        margin_text: 0
        needBack: false
      // vertical: Text.AlignTop

       // horizontal: Text.AlignLeft
        text: id_account !== -1 ?  account_Icon.login  : qsTr("Новый аккаунт")



    }


}
