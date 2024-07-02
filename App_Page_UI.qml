import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import QtQuick.Dialogs 1.3

//import Authorized_Account 1.0
//import Style 1.0

import App_Page 1.0


import Name_Main_Pages 1.0
import my_components 1.0

Item {
    id: root_Page
    width: parent.width
    height: parent.height


    App_Page{
        id: app_Page
    }


   // property int index_Page: -1

    property int sub_index_HomePage: 2 // 1 //2  // Я его сюда вынес чисто из за флипа на старт мы падаем сюда


    readonly property var sourcePages_Array: [
                                              {index: Name_Main_Pages.Home_Page,  source: "qrc:/pages/main_pages/Home_Frame_Page_UI.qml"},
                                              {index: Name_Main_Pages.Diagnostic_Page,  source: "../pages/Diagnostic_Page.qml"},
                                              {index: Name_Main_Pages.History_Page,  source: "qrc:/pages/history_pages/History_Frame_Page_UI.qml"},      //"qrc:/pages/history_pages/History_Charts_Page_UI.qml"},
                                              {index: Name_Main_Pages.Login_Page,  source: "qrc:/pages/account_pages/Account_Register_Page_UI.qml"}, //     source: "../pages/Login_Page.qml"},
                                              {index: Name_Main_Pages.Settings_Page,  source: "qrc:/pages/settings_pages/Settings_Frame_Page_UI.qml"}, //"../pages/Settings_Page.qml"},
                                              {index: Name_Main_Pages.Help_Page,  source: "qrc:/pages/help_pages/Help_Frame_Page_UI.qml"}, // "../pages/Help_Page.qml"},
                                              {index: 6,  source: "qrc:/pages/home_pages/Start_Page.qml"},
                                              {index: 7,  source: "qrc:/pages/home_pages/Test_Page_2.qml"},
                                              {index: 8,  source: "../pages/Home_Page.qml"}, //../pages/Home_Page.qml
                                              {index: 9,  source: "qrc:/pages/main_pages/Home_Task_DB_Page_UI.qml"},
                                              {index: 10,  source: "qrc:/pages/main_pages/Home_Finish_Task_Page_UI.qml"}

                                            ]

   // "../pages/Defect_Charts.qml",
   // "../pages/Charts_test.qml"


    Item{
        width: parent.width
        height: parent.height

        Navigation{
            id: navigation
            logo: "qrc:/my_components/images/logo_white_trans.png"
            top_model: [

                    {
                        icon:"qrc:/my_components/icons/" + Style.theme + "/navigation/home.svg",
                        icon_check: "qrc:/my_components/icons/" + Style.theme + "/navigation/home_accent.svg",
                        page_num: Name_Main_Pages.Home_Page,
                        text: my_str.page_Names.main_Page
                    },

                    {
                        icon:"qrc:/my_components/icons/" + Style.theme + "/navigation/presentation_1.svg",
                        icon_check: "qrc:/my_components/icons/" + Style.theme + "/navigation/presentation_1_accent.svg",
                        page_num: Name_Main_Pages.Diagnostic_Page,
                        text: my_str.page_Names.diagnostic_Page

                    },

                    {
                        icon:"qrc:/my_components/icons/" + Style.theme + "/navigation/document.svg",
                        icon_check: "qrc:/my_components/icons/" + Style.theme + "/navigation/document_accent.svg",
                        page_num: Name_Main_Pages.History_Page,
                        text: my_str.page_Names.history_Page

                    },


                    {
                        icon:"qrc:/my_components/icons/" + Style.theme + "/navigation/setting.svg",
                        icon_check: "qrc:/my_components/icons/" + Style.theme + "/navigation/setting_accent.svg",
                        page_num: Name_Main_Pages.Settings_Page,
                        text: my_str.page_Names.settings_Page

                    },


                ]

            bottom_model: [
                    {
                        icon:"qrc:/my_components/icons/" + Style.theme + "/navigation/question.svg",
                        icon_check: "qrc:/my_components/icons/" + Style.theme + "/navigation/question_accent.svg",
                        page_num: Name_Main_Pages.Help_Page,
                        text:  my_str.page_Names.help_Page
                    },
                ]

            onTop_Clicked_Signal:{

                switch(index){

                case 0:

                    opacity_Anim.create_page_anim(Name_Main_Pages.Home_Page)

                    break

                case 1:

                    opacity_Anim.create_page_anim(Name_Main_Pages.Diagnostic_Page)

                    break

                case 2:

                    opacity_Anim.create_page_anim(Name_Main_Pages.History_Page)

                    break


                case 3:

                    opacity_Anim.create_page_anim(Name_Main_Pages.Settings_Page)

                    break
                }
            }

            onBotom_Clicked_Signal:{

                switch(index){

                case 0:

                    opacity_Anim.create_page_anim(Name_Main_Pages.Help_Page)

                    break


                }
            }
        }


        Item {
            id: content_Item
            width: parent.width - ui.width_Navigation
            height: parent.height
            clip: true
            anchors{

                left: parent.left
                leftMargin: ui.width_Navigation

            }


            Loader{
                id: page_Loader
                width: parent.width
                height: parent.height
                focus: true
                source: sourcePages_Array[navigation.index_Page].source
                Component.onCompleted: navigation.index_Page = Name_Main_Pages.Home_Page //8 //Name_Main_Pages.Settings_Page //Name_Main_Pages.Home_Page //8 //Name_Main_Pages.Home_Page // 0 //4 //2 //0 //1 //source = sourcePages_Array[index_Page]



                onSourceChanged: {

                    keyboard.check_close()

                   // console.log("app_Page.history_Frame_Page.page_num = " + app_Page.history_Frame_Page.page_num)

                    //page_Loader.item.page_num = app_Page.history_Frame_Page.page_num
                }


            }







        }


        Opacity_Anim{
            id: opacity_Anim
            animation_target: page_Loader

        }


    }




    Loading_Popup{
        id: loading_popup

    }

    Content_Dialog{
        id:dialog

        onAgree_click: {


            toast.show("test click", 3000, 1) // Показываем Тоcт

        }

    }

}
