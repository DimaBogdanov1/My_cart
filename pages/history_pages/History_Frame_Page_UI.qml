import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

import History_Page_Names 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    function open_page(index){

        var answer;

        switch(index){

        case History_Page_Names.Chart_Page:

            answer = 1

            break


        case History_Page_Names.File_Page:

            answer = 0

            break
        }

        return answer
    }

    StackLayout {
        width: parent.width
        height: parent.height
        currentIndex: app_Page.history_Frame_Page.page_num

        History_File_Page_UI{

            onNext_Page_Signal: {

                app_Page.history_Frame_Page.page_num =  open_page(History_Page_Names.Chart_Page)

            }
        }

        History_Chart_Page_UI{

            onBack_Page_Signal: {

                app_Page.history_Frame_Page.page_num = History_Page_Names.File_Page

            }
        }

    }

}
