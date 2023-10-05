import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import QtQuick.Dialogs 1.3
import MyLang 1.0
import Style 1.0
import my_components 1.0

Item {
    id: root_Page
    width: parent.width
    height: parent.height

    property int index_Page: -1

    property int sub_index_HomePage: 2 //1 //2  // Я его сюда вынес чисто из за флипа на старт мы падаем сюда

    readonly property var sourcePages_Array: [
                                               "../pages/Home_Page.qml",
                                               "../pages/Calib_Page.qml",
                                               "../pages/History_Page.qml",
                                               "../pages/Login_Page.qml",
                                               "../pages/Settings_Page.qml",
                                               "../pages/Help_Page.qml"
                                            ]

   // "../pages/Defect_Charts.qml",
   // "../pages/Charts_test.qml"


    Row{
        width: parent.width
        height: parent.height

        Rectangle {
           width: ui.width_Navigation
           height: parent.height
           color: Style.primaryDark_Color

           Item{
              width: parent.width
              height: ui.iconBlock_Size * 9 + 72
            //  anchors.centerIn: parent

              Column {
                  width: parent.width
                  height: parent.height
                  spacing: ui.icon_nav_size

                  Item {
                      width:  parent.width
                      height: 72
                    //  anchors.bottom: parent.bottom
                     // anchors.bottomMargin: 16
                          Image {
                             width:  parent.height
                             height: parent.height
                             source: "../images/logo_white_trans.png"
                             anchors.centerIn: parent
                             smooth: false // Убираем Сглаживание
                             fillMode: Image.PreserveAspectCrop
                          }

                  }


                  Custom_Icon_Button{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 0
                      icon_path: "qrc:/icons/" + Style.theme + "/navigation/home.svg"
                      icon_checked_path: "qrc:/icons/"+ Style.theme + "/navigation/home_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_page_anim(0)  // Переходим На Старт

                      }
                  }

                  Custom_Icon_Button{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 1
                      icon_path: "qrc:/icons/" + Style.theme + "/navigation/edit.svg"
                      icon_checked_path: "qrc:/icons/" + Style.theme + "/navigation/edit_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_page_anim(1) // Переходим На Калибровку

                      }
                  }

                 /* Custom_Icon_Button{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      icon_path: "qrc:/icons/" + Style.theme + "/navigation/add.svg"
                      onClicked_Signal: {

                         // loading_popup.open()


                          fileDialog.open()

                         //dialog.open()
                         // toast.show("Добавление новой базы данных!", 3000, 1) // Показываем Тоcт

                      }

                  }*/

                  Custom_Icon_Button{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 2
                      icon_path: "qrc:/icons/" + Style.theme + "/navigation/document.svg"
                      icon_checked_path: "qrc:/icons/"+ Style.theme + "/navigation/document_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_page_anim(2) // Переходим В Историю

                      }
                  }

                  Custom_Icon_Button{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 5
                      icon_path: "qrc:/icons/" + Style.theme + "/navigation/question.svg"
                      icon_checked_path: "qrc:/icons/"+ Style.theme + "/navigation/question_accent.svg"
                      onClicked_Signal: {

                          push_Notification.open()
                       //   opacity_Anim.create_page_anim(5)  // Переходим В Справку

                      }
                  }

                  Custom_Icon_Button{
                      width:  parent.width - 16
                      anchors.horizontalCenter: parent.horizontalCenter
                      height: ui.iconBlock_Size
                      isChecked: index_Page == 4
                      icon_path: "qrc:/icons/" + Style.theme + "/navigation/setting.svg"
                      icon_checked_path: "qrc:/icons/" + Style.theme + "/navigation/setting_accent.svg"
                      onClicked_Signal: {

                          opacity_Anim.create_page_anim(4) // Переходим В Настройки

                      }
                  }

              }


           }

           Column {
               width: parent.width
               height: ui.height_Button +  ui.iconBlock_topBar_Size + ui.icon_nav_size
               anchors.bottom: parent.bottom
               anchors.bottomMargin: 16
               spacing: ui.icon_nav_size

               Custom_Icon_Button{
                   isNeedRectangle: true
                   color_rec: Style.light_Color
                   anchors.horizontalCenter: parent.horizontalCenter
                   icon_path: "qrc:/icons/" + Style.theme + "/utils/moon.svg"
                   icon_checked_path: "qrc:/icons/" + Style.theme + "/utils/sun.svg"

                   onClicked_Signal: {

                       create_icon_anim()

                   }

                   onIsCheckedChanged: {

                       if(isChecked){

                           app_Settings.dark_mode = isChecked

                           Style.change_theme(app_Settings.dark_mode)
                       }
                       else{

                           app_Settings.dark_mode = isChecked

                           Style.change_theme(app_Settings.dark_mode)
                       }


                   }

               }


               Account_Icon{
                   id: authorization_Account_Icon

                   onClicked_Signal: {

                       account_Popup.openPopup(login, color_value)

                        //opacity_Anim.create_page_anim(3)
                   }

                   Connections{
                       target: Accounts

                       function onUpdate_AuthorizationUser_signal(login, color){

                           authorization_Account_Icon.login = login

                           authorization_Account_Icon.color_value = color

                       }

                   }

               }

           }


           Account_Popup{
               id: account_Popup
           }

           Push_Notifiaction{

               id: push_Notification
           }

           /*Custom_Border{
               anchors.right: parent.rights
               width: ui.border_Size
               height: parent.height

           }*/
        }



        Item {
            width: parent.width - ui.width_Navigation
            height: parent.height
            clip: true


            Loader{
                id: page_Loader
                width: parent.width
                height: parent.height
                focus: true
                source: sourcePages_Array[index_Page]
                Component.onCompleted: index_Page =  0 //1 //source = sourcePages_Array[index_Page]

                onSourceChanged: {

                    if(keyboard.on_keyboard){

                        keyboard.close()
                    }
                }
            }


            // Создаём Объект Для Показа Тостов
           ToastManager {
                id: toast
            }



        }


        Opacity_Anim{
            id: opacity_Anim
            animation_target: page_Loader

        }


    }




   /* Custom_Combobox{
        width: 200
        height: 40
        openIcon: "../icons/light_theme/navigation/setting.svg"
        closeIcon: "../icons/light_theme/navigation/document.svg"
        anchors.centerIn: parent
    }

    ComboBox{
        width: 200
        height: 50
        model: ["dd", "dd", "eee","eee"]
        anchors.verticalCenter: parent.verticalCenter
    }

    Test_cmb{
        width: 200
        height: 40
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }*/

    Loader{
        id: utils_Loader
        width: parent.width
        height: parent.height
        //focus: true
        Component.onCompleted: source = "../Utils.qml"

    }


    Loading_Popup{
        id: loading_popup

    }


    function open_database(path){

        var rep_path = path.replace(/^(file:\/{2})/,"")

        console.log("You chose: " + path)

        index_Page =  0

       index_swipe_Home = 1 // Переходим На Составление Задания

        big_db.openDatabase(rep_path)

        //index_Page = 1
    }

    FileDialog {
        id: fileDialog
        title: qsTr("Выберите базу данных") + mytrans.emptyString
        folder: shortcuts.documents
        nameFilters: ["(*.db)"]; // Фильтр Для Расширений Файлов

        onAccepted: {

           //clear_list()

            open_database(fileDialog.fileUrls.toString())

        }

        onRejected: {
            console.log("Canceled")

        }

    }

    Content_Dialog{
        id:dialog

        onAgree_click: {


            toast.show("test click", 3000, 1) // Показываем Тоcт

        }

    }

}
