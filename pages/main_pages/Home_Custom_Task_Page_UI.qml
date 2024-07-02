import QtQuick 2.15
import QtQuick.Controls 2.15

import Home_Custom_Task_Page 1.0
import Top_Bar_Actions 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    signal back_Page_Signal

    signal next_Page_Signal

    Home_Custom_Task_Page{
        id: custom_Task_Page

        onSave_Route_Signal: {

            custom_Task_Block_Page.open_dialog()

        }

    }

    Custom_Task_Block_Page{
        id: custom_Task_Block_Page

        onBack_Page_Signal: {

            root_Item.back_Page_Signal()
        }

        onNext_Page_Signal: {

            root_Item.next_Page_Signal()
        }
    }


}
