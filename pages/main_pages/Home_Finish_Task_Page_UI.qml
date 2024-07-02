import QtQuick 2.15
import QtQuick.Controls 2.15

import Finish_Task_Page 1.0

import Type_Content_Button 1.0
import Type_SubIcon_Button 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int picked_siteID: 0

    property int picked_upNom: 0

    property int picked_putNom: 0


    property int last_page_num

    signal next_Page_Signal


    function clear(){

       // warning_ListModel.clear()
    }


    Finish_Task_Page{
        id: finish_Task_Page
    }

    Finish_Task_Block_Page{

        onBack_Page_Signal: {

            app_Page.home_Frame_Page.page_num = last_page_num
        }

        onNext_Page_Signal: {

            root_Item.next_Page_Signal()
        }
    }


    /*Column{
        width: parent.width
        height: parent.height

        Custom_TopBar{
            id: topBar

            onBackClick_Signal: {

                app_Page.home_Frame_Page.page_num = last_page_num

            }
        }



    } */



}
