import QtQuick 2.15
import QtQuick.Controls 2.15


import Type_Content_Button 1.0
import Type_SubIcon_Button 1.0

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
                width: ui.width_conetent_halfPage
                height: ui.height_Button * 3 + ui.block_height * 2 + 300 + ui.middle_spacing * 6
                anchors.centerIn: parent
                spacing: ui.middle_spacing //ui.basic_spacing * 2


                Custom_Row_ComboBox{
                    id: road_ComboBox
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                    model: [
                        { title: my_str.siteID, combo_model: [], picked_index: 0}
                    ]


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
                     model: [qsTr("Главные пути") , qsTr("Станционные пути") ]

                     onIndexChanged: {

                        putNom_ListModel.clear()

                        upNom_ListModel.clear()

                        big_db.update_Type(index)

                     }
                 }

                 List_With_Title{
                    id: list
                    width: parent.width
                    height: 150
                    noTitle: true
                    color: Style.light_Color

                    header_model: [
                            { title: qsTr("Код"), size: 0.3},
                            { title: qsTr("Направление"), size: 0.7}
                        ]
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
                        header_model: list.header_model
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
                    header_model: [
                            { title: qsTr("Путь"), size: 0.3},
                            { title: qsTr("Тип"), size: 0.7}
                        ]

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
                        header_model: list2.header_model
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
                     source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                     start_Keyboard: 300

                     model: [
                            { title: my_str.km, text: ""},
                            { title: my_str.meter, text: ""}
                        ]

                     onTextChanged: {

                        /* if(index_model == 0){

                             task_Page.set_StartKm(text)
                         }

                         if(index_model == 1){

                             console.log("sssssssssssssss")

                             task_Page.set_StartM(text)
                         } */

                     }

                 }


                 Custom_Button{
                     id: start_Button
                     width: parent.width
                     type_Content: Type_Content_Button.Text_And_Icon_Content
                     iconHelp_source:  Type_SubIcon_Button.Next_Icon
                     text:  qsTr("Продолжить")
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


           km_Text_Arrow.text_1 = km_start + " км"+ " " + m_start + " м"

           km_Text_Arrow.text_2 =  km_end + " км" + " " + m_end + " м"

       }

    }

}

