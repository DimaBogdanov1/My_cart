import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Dialogs 1.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Rectangle {
    width: parent.width
    height: parent.height
    color: Style.light_Color

    function clear_list(){

        my_ListModel.clear()

    }

    Rectangle{
        width: parent.width < 1000 ? parent.width * 0.6 : 600
        height: parent.height * 0.6
        radius: ui.radius_mini
        anchors.centerIn: parent
        color: Style.background_Color

        Item{ // Создаём Основную Колонку
            width: parent.width - 24
            height: parent.height - 24
            anchors.centerIn: parent
          //  spacing: 16

            Item{
                width: parent.width
                height: 20

                Custom_Label{
                    horizontalAlignment: Text.AlignHCenter
                    font.weight:  ui.font_weight_Bigsize
                    font.family: customTitle_FontLoader.name
                    font.pixelSize:  ui.text_BigSize // Меняем Размер Шрифта
                    color: Style.primaryDark_Color // Меняем Цвет Текста
                    text: qsTr("Создадим задание!") + mytrans.emptyString

                }


            }

            Custom_Button{
                width: 200
                height: ui.height_Button
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                text_Button:  qsTr("Начать задание") + mytrans.emptyString
                onClicked_Signal: {

                    main_SwipeView.currentIndex = 2 // Переходим На График

                   //homePage_Loader.index_Page = 2
                   toast.show("test click", 3000, 1) // Показываем Тоcт

                }

            }

        }

    }



   /* Column {
        width: parent.width < 1000 ? parent.width * 0.6 : 600
        height: parent.height * 0.6
        spacing: 10

         Item{
             width: parent.width
             height:200



             ListView{
                 id: startTask_Listview
                 width: parent.width
                 height:parent.height
                 model: my_ListModel
                 clip: true
                 highlight: Rectangle {
                             color: 'grey'


                         }
                         focus: true

                 delegate: delegate_Component
             }

         }

         Custom_Button{
             width: 200
             height: ui.height_Button
             text_Button:  qsTr("Старт") + mytrans.emptyString
             onClicked_Signal: {

                homePage_Loader.index_Page = 1
                toast.show("test click", 3000, 1) // Показываем Тоcт

             }

         }

         Custom_Button{
             width: 200
             height: ui.height_Button
             text_Button:  qsTr("Обзор") + mytrans.emptyString
             outlined: true
             onClicked_Signal: fileDialog.open()

         }

    } */


    ListModel { // Создаём Модель Для ListView

        id: my_ListModel

    }


    Component { // Создаём Компонент Для ListView

           id: delegate_Component

           Item{
               width: startTask_Listview.width
               height: 20

               Row{
                   width: parent.width
                   height: parent.height

                   Label{
                       width: parent.width * 0.2
                       height: parent.height
                       font.weight:  ui.font_weight_Smallsize
                       font.family: custom_FontLoader.name
                       font.pixelSize:  ui.text_SmallSize // Меняем Размер Шрифта
                       color: Style.primaryDark_Color // Меняем Цвет Текста
                       text: Code_Value
                   }

                   Label{
                       width: parent.width * 0.1
                       height: parent.height
                       font.weight:  ui.font_weight_Smallsize
                       font.family: custom_FontLoader.name
                       font.pixelSize:  ui.text_SmallSize // Меняем Размер Шрифта
                       color: Style.primaryDark_Color // Меняем Цвет Текста
                       text: WayNum_Value
                   }

                   Label{
                       width: parent.width * 0.5
                       height: parent.height
                       text: WayName_Value
                   }

                   Label{
                       width: parent.width * 0.1
                       height: parent.height
                       text: StartKm_Value
                   }

                   Label{
                       width: parent.width * 0.1
                       height: parent.height
                       text: EndKm_Value
                   }
               }


               MouseArea {
                   anchors.fill: parent
                   onClicked: startTask_Listview.currentIndex = index
               }
           }






    }


    Connections{

       target: big_db

       function onNewItem_Database_signal(code, way, name, start, end) {

           //startTask_Listview.model({Code_Value: "code"})


           my_ListModel.append({
                                   "Code_Value": code,
                                   "WayNum_Value": way,
                                   "WayName_Value": name,
                                   "StartKm_Value": start,
                                   "EndKm_Value": end,

                               })


       }


    }

}
