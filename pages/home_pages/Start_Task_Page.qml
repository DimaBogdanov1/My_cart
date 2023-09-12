import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Dialogs 1.0

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height


    property int block_width: 400

    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: Style.background_Color

        Rectangle{
            width: 200
            height: 400
            //color: "orange"
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Column{ // Создаём Основную Колонку
                width: parent.width
                height: parent.height - 24
                //anchors.centerIn: parent
                spacing: 16 //ui.basic_spacing * 2

                Item{
                    width: parent.width
                    height: 20

                    Custom_Label{
                      //  id: title_1
                        horizontalAlignment: Text.AlignHCenter
                        font.weight:  ui.font_weight_Bigsize
                        font.family: customTitle_FontLoader.name
                        font.pixelSize:  ui.text_BigSize // Меняем Размер Шрифта
                        color: Style.primaryDark_Color // Меняем Цвет Текста
                     //   visible: false
                        text: qsTr("Создадим задание!") + mytrans.emptyString

                    }


                }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("Up") + mytrans.emptyString
                     onClicked_Signal: {


                            keyboard.open(100)
                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("Down") + mytrans.emptyString
                     onClicked_Signal: {


                            keyboard.close()

                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("next") + mytrans.emptyString
                     onClicked_Signal: {

                         index_swipe_Home++


                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("open db") + mytrans.emptyString
                     onClicked_Signal: {

                         big_db.openDatabase("/Users/dimabogdanov/Documents/MyCart_res/ApBAZE.db")


                     }

                 }

                 Custom_Button{
                     width: 200
                     height: ui.height_Button
                      outlined: true
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("dialog") + mytrans.emptyString
                     onClicked_Signal: {

                         dialog.open()


                     }

                 }



            }
        }

        Rectangle{
            width: parent.width < 1000 ? parent.width * 0.6 : 600
            height: 30 +  ui.height_Button * 5 + 300 + 16 * 7 + 24
            radius: ui.radius
            anchors.centerIn: parent
            color: Style.light_Color

            Column{ // Создаём Основную Колонку
                width: 450
                height: parent.height - 24
                anchors.centerIn: parent
                spacing: 16 //ui.basic_spacing * 2

                Item{
                    width: parent.width
                    height: 30

                    Custom_Label{
                        id: title_1
                        horizontalAlignment: Text.AlignHCenter
                        font.weight:  ui.font_weight_Bigsize
                        font.family: customTitle_FontLoader.name
                        font.pixelSize:  ui.text_BigSize // Меняем Размер Шрифта
                        color: Style.primaryDark_Color // Меняем Цвет Текста
                        //visible: false
                        text: qsTr("Создадим задание!") + mytrans.emptyString

                    }


                 //   Main_Gradient{anchors.fill: title_1; source: title_1}

                }

                 Custom_Pick_Button{
                     width: parent.width
                     height: ui.height_Button
                     model: ["Главные пути", "Станционные пути"]

                     onPicked_indexChanged: {

                         putNom_ListModel.clear()

                         upNom_ListModel.clear()

                        big_db.update_Type(picked_index)

                     }
                 }

                 Row{
                     width: parent.width
                     height: ui.height_Button
                     spacing: ui.basic_spacing

                     Custom_Icon{
                         height: parent.height
                         source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"

                      }


                     Custom_Combobox{
                         id: road_ComboBox
                         width: parent.width - ui.icon_nav_size - ui.basic_spacing
                         height: ui.height_Button
                         model: ListModel {}

                         onCurrentIndexChanged: {

                             var num_Value = road_ComboBox.model.get(currentIndex).value.split(" - ");

                           //  toast.show(num_Value[0].toString(), 3000, 1)

                             putNom_ListModel.clear()

                             upNom_ListModel.clear()

                             big_db.update_numRoad(num_Value[0])
                         }

                     }


                 }

                 Row{
                     width: parent.width
                     height: 150
                     spacing: ui.basic_spacing

                     Rectangle{
                         width: parent.width //- ui.basic_spacing / 2
                         height: parent.height
                         color: Style.background_Color
                         radius: ui.radius
                         clip: true

                         Column{
                             width: parent.width - ui.big_spacing
                             height:  parent.height - ui.basic_spacing / 2
                             anchors.centerIn: parent
                             spacing: ui.border_Size
                             //layer.enabled: true
                             //layer.effect: Mask_Rectangle{target: parent}

                             List_Row{
                                 id: title_Row
                                 model: [ qsTr("Код"), qsTr("Направление")]
                                 sizes: [0.3, 0.7]
                             }

                             Custom_Border{}

                             My_List{
                                id: list
                                width: parent.width
                                height: parent.height - title_Row.height - ui.border_Size * 2
                                model: ListModel{id: upNom_ListModel}

                             /*   highlight: Rectangle {
                                          color: 'grey'
                                } */

                                delegate: List_Row{
                                    listview: list
                                    width: list.width
                                    model: [code, name]
                                    sizes: title_Row.sizes
                                    cur: list.currentIndex

                                }

                                onCurrentIndexChanged: {

                                    //toast.show(currentIndex.toString(), 3000, 1)

                                    putNom_ListModel.clear()

                                    big_db.update_putNom(upNom_ListModel.get(currentIndex).code)
                                }

                             }

                         }

                     }


                 }

                 Row{
                     width: parent.width
                     height: 150
                     spacing: ui.basic_spacing

                     Rectangle{
                         width: parent.width
                         height: 150
                         color: Style.background_Color
                         radius: ui.radius
                         clip: true

                         Column{
                             width: parent.width - ui.big_spacing
                             height:  parent.height - ui.basic_spacing / 2
                             anchors.centerIn: parent
                             spacing: ui.border_Size
                             //layer.enabled: true
                             //layer.effect: Mask_Rectangle{target: parent}

                             List_Row{
                                 id: title_Row2
                                 model: [ qsTr("Путь"), qsTr("Тип")]
                                 sizes: [0.3, 0.7]
                             }

                             Custom_Border{}

                             My_List{
                                id: list2
                                width: parent.width
                                height: parent.height - title_Row.height - ui.border_Size * 2
                                model: ListModel{id: putNom_ListModel}



                                delegate: List_Row{
                                    listview: list2
                                    width: list2.width
                                    model: [put, type]
                                    sizes: title_Row2.sizes
                                    cur: list2.currentIndex

                                }

                             }
                         }

                        }

                 }

                 Custom_Text_Arrow{
                    id: km_Text_Arrow
                    height: ui.height_Button
                 }


                 /*Row{
                     width: parent.width
                     height: ui.height_Button
                     spacing: ui.basic_spacing


                     Custom_Icon{
                         height: parent.height
                         source: "qrc:/icons/light_theme/top_bar/location.svg"

                      }

                     Custom_Combobox{
                         width: parent.width - ui.icon_nav_size - ui.basic_spacing
                         height: ui.height_Button
                         model: ListModel {}

                         onCurrentIndexChanged: {

                             var num_Value = road_ComboBox.model.get(currentIndex).value.split(" - ");

                           //  toast.show(num_Value[0].toString(), 3000, 1)

                             putNom_ListModel.clear()

                             upNom_ListModel.clear()

                             big_db.update_numRoad(num_Value[0])
                         }

                     }


                 }*/


                 Row{
                     width: parent.width
                     height: ui.height_Button
                     spacing: ui.basic_spacing

                     Custom_Icon{
                         height: parent.height
                         source: "qrc:/icons/light_theme/top_bar/location.svg"

                      }

                     Custom_TextField {
                         id: textField_1
                         width: parent.width / 2 - ui.basic_spacing - ui.icon_nav_size / 2
                         height: ui.height_Button
                         //inputMethodHints: Qt.ImhSensitiveData | Qt.ImhPreferUppercase | Qt.ImhNoPredictiveText
                         //inputMask: "#### km"
                         maximumLength: 10
                         validator: IntValidator{}
                         placeholderText: qsTr("Введите километр")

                         onReady_to_write_signal: {

                             keyboard.text_target = textField_1

                             keyboard.open(290)

                         }

                     }

                     Custom_TextField {
                         id: textField_2
                         width: parent.width / 2 - ui.basic_spacing - ui.icon_nav_size / 2
                         height: ui.height_Button
                         maximumLength: 3
                         validator: IntValidator{}
                         placeholderText: qsTr("Введите метр")

                         onReady_to_write_signal: {

                             keyboard.text_target = textField_2

                             keyboard.open(290)

                         }

                     }
                 }

                 Custom_Button{
                     id: start_Button
                     width: parent.width
                     height: ui.height_Button
                     anchors.horizontalCenter: parent.horizontalCenter
                     text:  qsTr("Начать задание") + mytrans.emptyString
                     onClicked_Signal: {

                         big_db.check_Coordination(upNom_ListModel.get(list.currentIndex).code , putNom_ListModel.get(list2.currentIndex).put , textField_1.text, textField_2.text)

                      //   index_swipe_Home = 2 // Переходим На График

                        //homePage_Loader.index_Page = 2

                     //    putNom_ListModel.append({"put": put, "type": type})

                     }

                 }

            }



        }

    }


    Keyboard{
        id: keyboard
        width: parent.width
        page_target: page
        number: true
        text_target:textField_1
    }


    Connections{

       target: big_db

       function onCheckResult_signal(result){

           if(result){

               //console.log("Код = " + upNom_ListModel.get(list.currentIndex).code)

               console.log("Код = " + upNom_ListModel.get(list.currentIndex).code    ) // + " Направление = " + putNom_ListModel.get(list.currentIndex) + " Путь = " + list2.get(list2.currentIndex))

               toast.show("Проверка пройдена", 3000, 1) // Переход На Другую Страницу
           }
           else{

               start_Button.create_error_anim()
               toast.show("Проверка нееееееее пройдена", 3000, 1)
           }
       }

       function onNewRoad_signal(nameRoad){

           road_ComboBox.model.append({"value": nameRoad})

       }

       function onNewUpNom_signal(code, name){

           upNom_ListModel.append({"code": code, "name": name})

       }

       function onNewPutNom_signal(put, type, km_start, m_start, km_end, m_end){

          // console.log(put + " " + type)

           putNom_ListModel.append({"put": put, "type": type})

           km_Text_Arrow.text_1 = km_start + " км " + m_start + " м "

           km_Text_Arrow.text_2 =  km_end + " км " + m_end + " м"

       }

    }

}

