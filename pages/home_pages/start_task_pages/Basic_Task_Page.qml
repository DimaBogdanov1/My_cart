import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property int block_width: 400

    Rectangle{
        width: parent.width < 1000 ? parent.width * 0.6 : 600
        height: 30 +  ui.height_Button * 4 + ui.block_height + 300 + 16 * 7 + 24
        radius: ui.radius
        anchors.centerIn: parent
        color: Style.light_Color

        Column{ // Создаём Основную Колонку
            width: 450
            height: parent.height - 24
            anchors.centerIn: parent
            spacing: ui.middle_spacing //ui.basic_spacing * 2

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
                    text: qsTr("Создадим маршрут!") + mytrans.emptyString

                }


             //   Main_Gradient{anchors.fill: title_1; source: title_1}

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


             Custom_Row_TextField{
                 id: startPoint_Row
                 source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                 start_Keyboard: 300
                 model: ListModel{

                     ListElement{
                         title: "Километр"
                         isLetter: false
                         km: true
                     }

                     ListElement{
                         title: "Метр"
                         isLetter: false
                         meter: true


                     }

                 }
             }


             Custom_Button{
                 id: start_Button
                 width: parent.width
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:  qsTr("Начать маршрут") + mytrans.emptyString
                 onClicked_Signal: {

                     big_db.check_Coordination(upNom_ListModel.get(list.currentIndex).code , upNom_ListModel.get(list.currentIndex).name, putNom_ListModel.get(list2.currentIndex).put , startPoint_Row.get_text(0), startPoint_Row.get_text(1))

                  //   sub_index_HomePage = 2 // Переходим На График

                    //homePage_Loader.index_Page = 2

                 //    putNom_ListModel.append({"put": put, "type": type})

                 }

             }

        }



    }




    Connections{

       target: big_db

       function onCheckResult_signal(result){

           if(result){

               //console.log("Код = " + upNom_ListModel.get(list.currentIndex).code)

               console.log("Код = " + upNom_ListModel.get(list.currentIndex).code    ) // + " Направление = " + putNom_ListModel.get(list.currentIndex) + " Путь = " + list2.get(list2.currentIndex))

               sub_index_HomePage = 2

           }
           else{

               start_Button.create_error_anim()
               //toast.show("Проверка нееееееее пройдена", 3000, 1)
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

