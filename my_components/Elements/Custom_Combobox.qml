import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height
    //clip: true
    signal clicked_Signal

    property string openIcon
    property string closeIcon

    Rectangle{
        id: main_Rectangle
        width: parent.width
        height: parent.height
        radius: ui.radius_mini //ui.radius
        color: Style.background_Color

        border{
            width: ui.border_Size
            color: Style.primary_Color
        }

        Item {
            width: parent.width
            height: parent.height

            Custom_Label{
                id: pick_Label
                text: my_ListModel.get(0).text_list
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
        }
        Hover_Anim{
            id: hover_Anim
            width: parent.width
            height: parent.height
            radius: ui.radius_mini

            onClicked_Signal: {

                popup.open()

                down_Anim.start()
               // main_Rectangle.border.color =  Style.accent_Color

               // root_Item.clicked_Signal()

            }
        }
    }


    Popup{
        id: popup
        width: parent.width
        height: my_ListModel.count < 4 ? parent.height : 4 * ui.height_Button
        y: main_Rectangle.height + 2
        padding: 0
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnReleaseOutsideParent

        background: Rectangle {
           width: parent.width
           height: parent.height
           color: "transparent"
        }

        contentItem:
            Item{
                width: parent.width
                height: parent.height
                clip:true

                /*Item{
                    width: parent.width
                    height: 5

                    Rectangle{
                        width: parent.width
                        height: parent.height
                        color: "orange"
                        radius: ui.radius
                    }

                    Rectangle{
                        width: parent.width
                        height: parent.height / 2
                        anchors.bottom: parent.bottom
                        color: "orange"
                    }
                }

                    */

                Rectangle{
                    id: list_Rectangle
                    width: parent.width
                    height: parent.height
                    //y: parent.height * -1
                    color: Style.background_Color //"white"

                  //  radius: ui.radius_mini

                    layer.enabled: true
                    layer.effect: OpacityMask {
                           maskSource: Item {
                               width: list_Rectangle.width
                               height: list_Rectangle.height
                               Rectangle {
                                   anchors.centerIn: parent
                                   width: list_Rectangle.width
                                   height: list_Rectangle.height
                                   radius: ui.radius_mini
                                   border.color: Style.primary_Color
                                   border.width: 1
                               }
                           }
                    }

                    ListView {
                         id:listView
                         width: parent.width //- ui.radius_mini / 2
                         height: parent.height //- 15
                         anchors.left: parent.left
                         model: my_ListModel
                         clip: true
                         delegate:   delegate_Component

                         ScrollIndicator.vertical: ScrollIndicator { }
                     }

                }

        }

    }



    ListModel{

        id: my_ListModel

        ListElement {
            text_list: "Старт"
            index: 0
        }

        ListElement {
            text_list: "222"
            index: 1
        }

        ListElement {
            text_list: "qq"
            index: 2
        }

        ListElement {
            text_list: "qq"
            index: 2
        }
        ListElement {
            text_list: "qq"
            index: 2
        }
        ListElement {
            text_list: "qq"
            index: 2
        }

        ListElement {
            text_list: "qq"
            index: 2
        }
        ListElement {
            text_list: "qq"
            index: 2
        }
        ListElement {
            text_list: "qq"
            index: 2
        }

    }

    Component {

        id: delegate_Component

        Item{
            width: parent.width
            height: ui.height_Button
            clip: true

            Hover_Anim{
                width: parent.width
                height: parent.height
                outlined: true
                radius:  ui.radius_mini  //index === 0 || index === my_ListModel.count - 1 ? ui.radius : 0

                onClicked_Signal: {

                    main_Rectangle.border.color =  Style.primaryDark_Color

                    pick_Label.text = my_ListModel.get(index).text_list
                   // popup.close()

                }
            }

            Custom_Label{
               text: text_list
               anchors.left: parent.left
               anchors.leftMargin: 10
            }
        }


    }

    NumberAnimation {id: down_Anim ; target: list_Rectangle; property: "y"; from: -1 * list_Rectangle.height; to: 0; duration: 250}

}
