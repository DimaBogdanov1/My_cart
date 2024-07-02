import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import Pick_Account_Page 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    Pick_Account_Page{
        id: pick_Account_Page

        onResult_Of_Authorization_Signal: {

            pick_Account_Block_Page.set_Result_Authorization(value)
        }
    }


    Pick_Account_Block_Page{
        id: pick_Account_Block_Page
        width: parent.width
        height: parent.height
        pick_Account_Page: pick_Account_Page
    }
}


