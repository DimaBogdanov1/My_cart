import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Home_Page_Names 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height


    StackLayout {
        width: parent.width
        height: parent.height
        currentIndex: app_Page.home_Frame_Page.page_num

        Home_Start_Page_UI{

        }

        Home_Task_DB_Page_UI{

            onBack_Page_Signal: {

                app_Page.home_Frame_Page.page_num = Home_Page_Names.Start_Page

            }

            onNext_Page_Signal: {

                finish_Task_Page.last_page_num = 1

                app_Page.home_Frame_Page.page_num = 4

            }
        }


        Home_Custom_Task_Page_UI{

            onBack_Page_Signal: {

                app_Page.home_Frame_Page.page_num = 0

            }

            onNext_Page_Signal: {

                finish_Task_Page.last_page_num = 2

                app_Page.home_Frame_Page.page_num = 4

            }
        }

        Home_Warning_Page_UI{

            onBack_Page_Signal: {

                app_Page.home_Frame_Page.page_num = 0

            }
        }

        Home_Finish_Task_Page_UI {
            id: finish_Task_Page

            onNext_Page_Signal: {

                app_Page.home_Frame_Page.page_num = 5

            }
        }

        Home_Chart_Page_UI {

            onBack_Page_Signal: {

                app_Page.home_Frame_Page.page_num = 4

            }
        }

    }

}

