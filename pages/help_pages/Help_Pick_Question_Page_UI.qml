import QtQuick 2.15
import QtQuick.Controls 2.15


import my_components 1.0


Item{
    id: root_Item
    width: parent.width
    height: parent.height

    signal next_Page_Signal

    Help_Pick_Question_Block_Page{
        width: parent.width
        height: parent.height

        onNext_Page_Signal: {

            root_Item.next_Page_Signal()

        }
    }
}
