import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15

import Qt.labs.platform 1.1 as Labs
import QtTest 1.2

Item {

    Labs.MenuBar {
        id: menuBar

        Labs.Menu {
            id: fileMenu
            title: qsTr("File")

            Labs.MenuItem {
                text: qsTr("&About")
               // onTriggered: Qt.quit()
            }
        }



        Labs.Menu {
            id: windowMenu
            title: qsTr("&Window")

            Labs.MenuItem {
                text: qsTr("&Minimize")
                //onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }
            Labs.MenuSeparator{}

            Labs.MenuItem {
                text: qsTr("Scroll Up")
                //onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }
            Labs.MenuItem {
                text: qsTr("Scroll Down")
                //onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }
        }

        ToolTip {
                id: id_toolTip
                contentItem: Text{
                    color: "#21be2b"
                }
                background: Rectangle {
                        border.color: "#21be2b"
                    }
        }

        Labs.Menu {
            id: helpMenu
            title: qsTr("&Help")
            Labs.MenuItem {
                text: qsTr("&View Website")
                //onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }
        }
    }

    /*Flickable {
        id: swipeArea
        width: parent.width
        height: 40



        flickableDirection: Flickable.HorizontalFlick
        onFlickStarted: {
            if (horizontalVelocity < 0) {
                console.log("swiped right")
            }
            if (horizontalVelocity > 0) {
                console.log("swiped left")
            }
            if(verticalVelocity < 0) {
                console.log("swiped top")

            }
        }
        boundsMovement: Flickable.StopAtBounds
        pressDelay: 0

        // children
    }

    */


    Item{
        width: parent.width
        height: 40

        SwipeView {
            id: view
            width: parent.width
            height: parent.height
            currentIndex: 1
            anchors.fill: parent

            Item {
                 id: firstPage
                 Rectangle {
                     width: parent.width
                     height: parent.height
                     color: Style.yellow_Color

                 }
             }
             Item {
                 id: secondPage

                 Rectangle {
                     width: parent.width
                     height:parent.height
                     color: Style.blue_Color
                 }
             }
             Item {
                 id: thirdPage

                 Rectangle {
                     width: parent.width
                     height:parent.height
                     color: Style.accent_Color
                 }
             }



        }

    }


    Item {
        id: root_Item
        width: parent.width
        height: parent.height
        clip: true
        signal clicked_Signal

        property string openIcon
        property string closeIcon

        ComboBox {
          id:main_ComboBox
          anchors.verticalCenter: parent.verticalCenter
          width: parent.width
          height: parent.height

          font.weight:  ui.font_weight_Smallsize
          font.family: custom_FontLoader.name
          font.pixelSize:  ui.text_SmallSize // Меняем Размер Шрифта

          model: [ qsTr("E"), qsTr("R"), qsTr("D") ]

          //the background of the combobox
          background: Rectangle {
              color: Style.light_Color
              radius: ui.radius
          }

          delegate: ItemDelegate {
              id:itemDlgt
              width: main_ComboBox.width
              height: 40//ui.height_Button

              contentItem: Rectangle{
                  id:rectDlgt
                  width:parent.implicitWidth
                  height:itemDlgt.height
                  color:itemDlgt.hovered? "green":"white";

                  Label {
                      id:textItem
                      text: modelData
                      color: Style.primaryDark_Color //hovered?"white":"#507BF6"
                      font: main_ComboBox.font
                      elide: Text.ElideRight
                      verticalAlignment: Text.AlignVCenter
                      horizontalAlignment: Text.AlignLeft
                  }
               }

                onPressed: console.log(itemDlgt.height+" "+rectDlgt.height)//are not the same!
           }

           //the arrow on the right in the combobox
           /*indicator:Image{
                 width:50; height:width;
                 horizontalAlignment:Image.AlignRight
                 source:comboPopup.visible ? openIcon : closeIcon
           }*/

           //the text in the combobox
           contentItem: Label {
               text: main_ComboBox.displayText
               color: Style.primaryDark_Color
               font: main_ComboBox.font
               verticalAlignment: Text.AlignVCenter
               horizontalAlignment: Text.AlignLeft
           }


           //the list of elements and their style when the combobox is open
           popup: Popup {
                 id:comboPopup
                 y: main_ComboBox.height
                 width: main_ComboBox.width
                 height:contentItem.implicitHeigh

                 contentItem: ListView {
                     id:listView
                     implicitHeight: contentHeight
                     model: main_ComboBox.popup.visible ? main_ComboBox.delegateModel : null

                     ScrollIndicator.vertical: ScrollIndicator { }
                 }

                 background: Rectangle {
                    radius: 20
                    border.width: 1
                    border.color: Style.primaryDark_Color
                 }
             }

          }

    }


}
