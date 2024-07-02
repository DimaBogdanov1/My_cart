import QtQuick 2.15
import QtQuick.Controls 2.15


import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    signal next_Page_Signal

    signal back_Page_Signal

    Help_Answer_Question_Block_Page{
        width: parent.width
        height: parent.height

        onBack_Page_Signal: {

            root_Item.back_Page_Signal()
        }

    }
}
