import QtQuick 2.15
import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: ui.height_RowList

    property string color: Style.accent_Color

    property var sizes: [0.05, 0.15, 0.15, 0.15, 0.15, 0.15, 0.2]

    property var model: [ "№", qsTr("Координата"), qsTr("Неисправность"), qsTr("Степень"), qsTr("Амплитуда"), qsTr("Длинна"), qsTr("Количество отступлений")]

    property int picked_sort_index: 0

    signal newSort_Signal(index: int, isAscending: int)

    Item {
        width: parent.width - ui.big_spacing /// 2
        height: parent.height //- 10 //ui.big_spacing / 2 //- 6 //ui.big_spacing / 2
        anchors.centerIn: parent

        Highlight_Glow{id: glow; target: back_Rectangle;}

        Item{
            id:back_Rectangle
            width: parent.width
            height: parent.height
           // color: Style.background_Color
           // radius: ui.radius

            Row{
                width: parent.width
                height: parent.height

                Repeater{
                    id: repeater
                    width: parent.width
                    height: parent.height
                    model: root_Item.model

                    Title_Sort {
                        id: label

                        required property int index

                        required property string modelData

                        width: parent.width * root_Item.sizes[index]
                        height: parent.height
                        visibleSort: picked_sort_index == index

                        text: modelData

                        onClicked_Signal: {

                            picked_sort_index = index

                            root_Item.newSort_Signal(index, isAscending)

                        }
                    }


                }
            }

            Custom_Icon_Button{
                width: ui.icon_nav_size
                height: ui.icon_nav_size
                icon_path: "qrc:/icons/" + Style.theme + "/utils/more_mini.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                onClicked_Signal: {

                  //  toast.show("график готов", 3000, 1) // Показываем Тоcт

                    menu.x = root_Item.width - menu.width - ui.basic_spacing / 2
                    menu.open()
                }


            }



        }



    }


    Menu_Popup{
        id: menu
        //x: parent.width - menu.width //calculate_offset(0)
        y: ui.basic_spacing / 4 // 0 //- ui.basic_spacing / 4

        model: Test_menu{}
    }

   // ChartsMore_Model{id: more_model}

}


