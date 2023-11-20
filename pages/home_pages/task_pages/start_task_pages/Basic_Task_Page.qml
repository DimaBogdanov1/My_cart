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


    Row{
        width: parent.width
        height: parent.height

        Rectangle{
            width: parent.width / 2
            height: parent.height
            radius: ui.radius
            color: Style.background_Color //Style.light_Color

            Column{ // Создаём Основную Колонку
                width: 450
                height: ui.height_Button * 3 + ui.block_height * 2 + 300 + ui.middle_spacing * 6
                anchors.centerIn: parent
                spacing: ui.middle_spacing //ui.basic_spacing * 2

               /* Item{
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

                }*/

             /*   Custom_Row_ComboBox{
                    id: road_ComboBox
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                    title: qsTr("Код дороги") + mytrans.emptyString
                    model: ListModel {}

                    property int num_Value: 1


                    onCurrentIndexChanged: {

                         num_Value = road_ComboBox.model.get(currentIndex).value.split(" - ")[0];

                      //  toast.show(num_Value[0].toString(), 3000, 1)

                        putNom_ListModel.clear()

                        upNom_ListModel.clear()

                        big_db.update_numRoad(num_Value)
                    }
                }*/

                Custom_Row_ComboBox{
                    id: road_ComboBox
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                    //title: qsTr("Код дороги") + mytrans.emptyString
                    model:ListModel {

                        ListElement {
                            title: "Код дороги"
                            values: []

                        }

                    }


                    property int num_Value: 1

                    onChange_index_signal: {

                        if(index_model == 0){

                            num_Value = road_ComboBox.model.get(0).values.get(index).value.split(" - ")[0];

                            //num_Value = road_ComboBox.model.get(index).value.split(" - ")[0];

                         //  toast.show(num_Value[0].toString(), 3000, 1)

                           putNom_ListModel.clear()

                           upNom_ListModel.clear()

                           big_db.update_numRoad(num_Value)
                        }
                    }

                }

                Custom_Tabs{
                     width: parent.width
                     height: ui.height_Button
                     model: [qsTr("Главные пути") + mytrans.emptyString, qsTr("Станционные пути") + mytrans.emptyString]

                     onIndexChanged: {

                        putNom_ListModel.clear()

                        upNom_ListModel.clear()

                        big_db.update_Type(index)

                     }
                 }

                  /*Row{
                     id: row
                     width: parent.width
                     height: 150
                     spacing: ui.basic_spacing


                     function listModelSort(listModel, compareFunction) {

                         let indexes = [ ...Array(listModel.count).keys() ]

                         indexes.sort( (a, b) => compareFunction( listModel.get(a), listModel.get(b) ) )
                         let sorted = 0

                         console.log("11111111111")

                         while ( sorted < indexes.length && sorted === indexes[sorted] ) sorted++

                         console.log(listModel.get(0).code)

                         if ( sorted === indexes.length ) return

                         for ( let i = sorted; i < indexes.length; i++ ) {
                             listModel.move( indexes[i], listModel.count - 1, 1 )
                             listModel.insert( indexes[i], { } )
                         }

                         listModel.remove( sorted, indexes.length - sorted )

                         console.log("wwwwwwwwwwwww")

                     }

                     Column{
                         width: 300
                         height: parent.height

                         Row{
                             width: parent.width
                             height: parent.height / 2

                             Button {
                                 width: parent.width / 2
                                         text: qsTr("  По возрастанию  ")
                                         onClicked: row.listModelSort( upNom_ListModel,
                                                                   (a, b) => (a.code - b.code) )


                                     }

                             Button {
                                 width: parent.width / 2

                                         text: qsTr("  По убыванию  ")
                                         onClicked: row.listModelSort( upNom_ListModel,
                                                                   (a, b) => (b.code - a.code) )


                                     }
                         }

                         Row{
                             width: parent.width
                             height: parent.height / 2

                             Button {
                                 width: parent.width / 2
                                         text: qsTr("  По возрастанию  ")
                                         onClicked: row.listModelSort( upNom_ListModel,
                                                                   (a, b) => a.name.localeCompare(b.name) )


                                     }

                             Button {
                                 width: parent.width / 2

                                         text: qsTr("  По убыванию  ")
                                         onClicked: row.listModelSort( upNom_ListModel,
                                                                   (a, b) => - a.name.localeCompare(b.name)  )


                                     }
                         }

                     }



                    Rectangle{
                         width: parent.width //- ui.basic_spacing / 2
                         height: parent.height
                         color:  Style.light_Color // Style.background_Color
                         radius: ui.radius
                         clip: true

                         Column{
                             width: parent.width //- ui.big_spacing
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



                                delegate: List_Row{
                                    listview: list
                                    width: list.width
                                    model: [code, name]
                                    sizes: title_Row.sizes
                                    cur: list.currentIndex
                                    needHighlight: true

                                }

                                onCurrentIndexChanged: {

                                    //toast.show(currentIndex.toString(), 3000, 1)

                                    putNom_ListModel.clear()

                                    big_db.update_putNom(upNom_ListModel.get(currentIndex).code)
                                }

                             }

                         }

                     }



                 }*/

                 List_With_Title{
                    id: list
                    width: parent.width
                    height: 150
                    noTitle: true
                    color: Style.light_Color
                    title_name_model: [ qsTr("Код"), qsTr("Направление")]
                    title_size_model: [0.3, 0.7]
                    title_Type: List_With_Title.Title_Types.Title_Sort_All

                    sort_func: [

                        [(a, b) => (a.code - b.code),  (a, b) => (b.code - a.code)],
                        [(a, b) => a.name.localeCompare(b.name),   (a, b) => - a.name.localeCompare(b.name)],
                    ]


                    model: ListModel{id: upNom_ListModel}

                    delegate: List_Row{
                        listview: list.get_list()
                        width: list.width
                        model:[code, name]
                        sizes: list.title_size_model
                        needHighlight: true
                        cur: list.currentIndex


                    }

                    function sort(index, isAscending){

                        listModelSort(list.model, list.sort_func[index][isAscending])

                    }

                    onCurrentIndexChanged: {

                       // toast.show(currentIndex.toString(), 3000, 1)

                        putNom_ListModel.clear()

                        big_db.update_putNom(upNom_ListModel.get(currentIndex).code)
                    }
                }


                 List_With_Title{
                    id: list2
                    width: parent.width
                    height: 150
                    noTitle: true
                    color: Style.light_Color
                    title_name_model: [ qsTr("Путь"), qsTr("Тип")]
                    title_size_model: [0.3, 0.7]
                    title_Type: List_With_Title.Title_Types.Title_Sort_All

                    sort_func: [

                        [(a, b) => (a.put - b.put),  (a, b) => (b.put - a.put)],
                        [(a, b) => a.name.localeCompare(b.name),   (a, b) => - a.name.localeCompare(b.name)],
                    ]


                    model: ListModel{id: putNom_ListModel}

                    delegate: List_Row{
                        listview: list2.get_list()
                        width: list2.width
                        model:[put, type]
                        sizes: list2.title_size_model
                        needHighlight: true
                        cur: list2.currentIndex


                    }

                    function sort(index, isAscending){

                        listModelSort(list2.model, list2.sort_func[index][isAscending])

                       /* var c = [ [ (a, b) => (a.put - b.put),  (a, b) => (b.put - a.put)] ]

                        switch(index){

                        case 0:

                            if(isAscending){

                                listModelSort(putNom_ListModel, c[0][0])
                            }
                            else{

                                console.log("rrrrrrrrrrrr")
                                listModelSort(putNom_ListModel, (a, b) => (b.put - a.put))

                            }

                            break

                        case 1:

                            if(isAscending){

                                listModelSort(putNom_ListModel, (a, b) => (b.type + a.type))
                            }
                            else{

                                listModelSort(putNom_ListModel, (a, b) => (b.type - a.type))

                            }

                            break
                        }

                        */

                    }
                }

                 /*Row{
                     width: parent.width
                     height: 150
                     spacing: ui.basic_spacing

                     Rectangle{
                         width: parent.width
                         height: 150
                         color: Style.light_Color //Style.background_Color
                         radius: ui.radius
                         clip: true

                         Column{
                             width: parent.width //- ui.big_spacing
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
                                    needHighlight: true

                                }

                             }
                         }

                        }

                 }

                 */

                Custom_Text_Arrow{
                    id: km_Text_Arrow
                    height: ui.height_Button
                    color: Style.light_Color
                 }

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
                     icon_with_Text: true
                     source:  "qrc:/icons/" + Style.theme + "/utils/arrow_right_mini_white.svg" // "qrc:/icons/" + Style.theme + "/navigation/home.svg"
                     text:  qsTr("Продолжить") + mytrans.emptyString
                     onClicked_Signal: {


                         big_db.check_Coordination(upNom_ListModel.get(list.currentIndex).code , upNom_ListModel.get(list.currentIndex).name, putNom_ListModel.get(list2.currentIndex).put , startPoint_Row.get_text(0), startPoint_Row.get_text(1))

                      //   sub_index_HomePage = 2 // Переходим На График

                        //homePage_Loader.index_Page = 2

                     //    putNom_ListModel.append({"put": put, "type": type})

                     }

                 }

            }



        }

        Rectangle{
            width: parent.width / 2
            height: parent.height
            radius: ui.radius
            color: Style.light_Color



        }
    }


    Connections{

       target: big_db

       function onCheckResult_signal(result){

           if(result){

               //console.log("Код = " + upNom_ListModel.get(list.currentIndex).code)

               console.log("Код = " + upNom_ListModel.get(list.currentIndex).code    ) // + " Направление = " + putNom_ListModel.get(list.currentIndex) + " Путь = " + list2.get(list2.currentIndex))


           //    finish_Task_Loader.item.picked_siteID = road_ComboBox.num_Value

         //      finish_Task_Loader.item.picked_upNom = upNom_ListModel.get(list.currentIndex).code

           //    finish_Task_Loader.item.picked_putNom = putNom_ListModel.get(list2.currentIndex).put

               index_Task = 1 // Переход На Финишное Завершение Задания

              // sub_index_HomePage = 2

           }
           else{

               start_Button.create_error_anim()
               //toast.show("Проверка нееееееее пройдена", 3000, 1)
           }
       }

       function onNewRoad_signal(nameRoad){

           road_ComboBox.model.get(0).values.append({ "value": nameRoad })

        //   road_ComboBox.model.values.append({"value": nameRoad})

        //   road_ComboBox.model.append({"value": nameRoad})

       }

       function onNewUpNom_signal(code, name){

           upNom_ListModel.append({"code": code, "name": name})

       }

       function onNewPutNom_signal(put, type, km_start, m_start, km_end, m_end){

          // console.log(put + " " + type)

           putNom_ListModel.append({"put": put, "type": type})


           km_Text_Arrow.text_1 = km_start + str.km + " " + m_start + str.meter

           km_Text_Arrow.text_2 =  km_end + str.km + " " + m_end + str.meter

       }

    }

}

