import QtQuick 2.15

import Style 1.0
import MyLang 1.0

import my_components 1.0
Item {
    id: root_Item
    width: parent.width
    height: parent.height


    readonly property var sourcePages_Array: [
                                               "qrc:/pages/login_pages/Pick_Account_Page.qml",
                                               "qrc:/pages/login_pages/Authorization_Page.qml",
                                                "qrc:/pages/login_pages/Register_Page.qml",
                                            ]

    property int sub_index_LoginPage: 0

    property string login_authorization

    property int color_authorization

    Row{
        id: root_Row
        width: parent.width
        height: parent.height

        Rectangle {
            width: sub_index_LoginPage === 0 ? parent.width : parent.width / 2
            height: parent.height
            color: Style.light_Color

            Loader{
                id: page_Loader
                width: parent.width
                height: parent.height
                source: root_Item.sourcePages_Array[sub_index_LoginPage] //"qrc:/pages/login_pages/Authorization_Page.qml" // "qrc:/pages/login_pages/Register_Page.qml" //"qrc:/pages/login_pages/Authorization_Page.qml"  //
             //   Component.onCompleted: index_Page =  0 //1 //source = sourcePages_Array[index_Page]

                onSourceChanged: {

                    if(keyboard.on_keyboard){

                        keyboard.close()
                    }
                }
            }
        }

        Rectangle {
            width: sub_index_LoginPage === 0 ? 0 : parent.width / 2
            height: parent.height
            visible: sub_index_LoginPage !== 0
            color: Style.background_Color

            Column{
                width: parent.width
                height: parent.height
                spacing: 20


                Account_Icon{
                    color_value: 0

                }

                Account_Icon{
                    color_value: 1

                }

                Account_Icon{
                    color_value: 2

                }

                Account_Icon{
                    color_value: 3

                }

                Account_Icon{
                    color_value: 4

                }

                Account_Icon{
                    color_value: 5

                }



                Custom_Button{
                    width: 200
                    height: ui.height_Button
                     outlined: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("add person") + mytrans.emptyString
                    onClicked_Signal: {

                        Accounts.add_Person("name ddd", 9999, 1)


                    }

                }
                Custom_Button{
                    width: 200
                    height: ui.height_Button
                     outlined: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("delete_person") + mytrans.emptyString
                    onClicked_Signal: {

                        Accounts.delete_Person(1)


                    }

                }

                Custom_Button{
                    width: 200
                    height: ui.height_Button
                     outlined: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("get all") + mytrans.emptyString
                    onClicked_Signal: {

                        Accounts.get_All_Users()


                    }

                }

                Custom_Button{
                    id: signIn_Button
                    width: 200
                    outlined: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  qsTr("flip") + mytrans.emptyString
                    onClicked_Signal: {

                        applicationWindow.flipped = true

                    }

                }
            }

        }
    }


   /*Keyboard{
        id: keyboard
        width: parent.width
        page_target: root_Row
        number: true
    }*/


}

