import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    StackLayout {
        width: parent.width
        height: parent.height
        currentIndex: app_Page.help_Frame_Page.page_num

        Help_Pick_Question_Page_UI{

            onNext_Page_Signal: {

                app_Page.help_Frame_Page.page_num = 1

            }
        }

        Help_Answer_Question_Page_UI{

            onBack_Page_Signal: {

                app_Page.help_Frame_Page.page_num = 0
            }

        }


    }

}
