import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import Task_Page 1.0


import my_components 1.0

/*Custom_Rectangle_Label {
    margin_text: 0
    needBack: false
    anchors.centerIn: parent

    text: qsTr("Страница помощи")
}*/

Item {
    width: parent.width
    height: parent.height

    Task_Page{
        id: task_Page
    }

    Column{
      width: parent.width
      height: parent.height

        Custom_TopBar{
            id: topBar
            width: parent.width
            height: ui.toolBar_Size //ui.iconBlock_topBar_Size + ui.top_bar_margin
            sourceMenuModel: "qrc:/my_components/Top_Bars/Menu_Models/Task_MenuModels.qml"
            needNotification: true
            mainModel: [0]

            /*model: ListModel{

                ListElement{
                    icon_path: "qrc:/icons/light_theme/top_bar/location.svg"
                    needCounter: true
                    count: 5
                    status: 2
                    typeAction: Custom_TopBar.Actions.Open_Popup_Action

                    pick: function(){

                        toast.show("график готов", 3000, 1)
                    }
                }

                ListElement{
                    icon_path: "qrc:/icons/light_theme/top_bar/zoom_in.svg"

                    model_Menu: [
                        ListElement { value: 0 }
                    ]

                }


            }*/

            onBackClick_Signal: {

                sub_index_HomePage = page_Loader.open_back(sub_index_HomePage, 1)

            }
        }

        Item{
            width: parent.width
            height: parent.height - ui.toolBar_Size - ui.basic_spacing

            Row{
                width: parent.width - ui.big_spacing
                height: parent.height
                anchors.centerIn: parent

                Rectangle{
                    width: parent.width / 2
                    height: parent.height
                    radius: ui.radius
                    color: Style.background_Color

                    Column{
                        width: parent.width - ui.big_spacing
                        height: parent.height
                        anchors.centerIn: parent

                        spacing: ui.basic_spacing

                        Column{ // Создаём Основную Колонку
                            width: parent.width
                            height: parent.height / 2 - parent.spacing / 2
                            spacing: ui.middle_spacing //ui.basic_spacing * 2

                            Custom_Row_ComboBox{
                                id: road_ComboBox
                                width: parent.width
                                source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                                model: [
                                    { title: my_str.siteID, combo_model: task_Page.SiteId_Model, picked_index: task_Page.pickedindex_SiteIDModel},
                                    { title: my_str.typeTracks, combo_model: task_Page.Type_Tracks_Model, picked_index: task_Page.pickedindex_Type_Tracks_Model}
                                ]


                                onChange_index_signal: {

                                    if(index_model == 0){

                                        task_Page.set_pickedindex_SiteIDModel(index)

                                        task_Page.set_SiteID(task_Page.SiteId_Model.get(index).name)

                                        console.log(task_Page.SiteId_Model.get(index).name)
                                    }

                                    if(index_model == 1){

                                        console.log("index = " + index)

                                        task_Page.set_TypeTrack(index)

                                    }
                                }

                            }

                            Custom_Row_ComboBox{
                                id: roadInfo_TextField
                                source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"

                                model: [
                                    { title: my_str.upNom, combo_model: task_Page.Up_Nom_Model, picked_index: task_Page.pickedindex_Up_Nom_Model},
                                    { title: my_str.putNom, combo_model: task_Page.Put_Nom_Model, picked_index: task_Page.pickedindex_Put_Nom_Model}
                                ]

                                onChange_index_signal: {

                                    if(index_model == 0){

                                        task_Page.set_pickedindex_Up_Nom_Model(index)

                                        //task_Page.set_pickedindex_Put_Nom_Model(0)

                                        task_Page.set_UpNom(task_Page.Up_Nom_Model.get(index).name)

                                    }

                                    if(index_model == 1){

                                        task_Page.set_pickedindex_Put_Nom_Model(index)


                                    }
                                }
                            }

                            Custom_Row_TextField{
                                id: startPoint_Row
                                source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                                start_Keyboard: 0 //400

                                model: [
                                       { title: my_str.km, text: task_Page.start_Km, maximumLength: ui.km_textLength},
                                       { title: my_str.meter, text: task_Page.start_M, maximumLength: ui.meter_textLength}
                                   ]

                                onTextChanged: {

                                    if(index_model == 0){

                                        task_Page.set_StartKm(text)
                                    }

                                    if(index_model == 1){

                                        console.log("sssssssssssssss")

                                        task_Page.set_StartM(text)
                                    }

                                }

                            }

                            Custom_Rectangle_Label{
                                width: parent.width
                                height: parent.height - road_ComboBox.height * 3 - parent.spacing * 3
                                color: Style.light_Color
                                //text: "Это место нужно чем-то забить"

                                Label{
                                    text: my_str.convertCoord(task_Page.coordList[0], task_Page.coordList[1]) + " " + my_str.convertCoord(task_Page.coordList[2], task_Page.coordList[3])
                                    anchors.centerIn: parent
                                }
                            }

                        }

                        Fragments_List{
                            title: my_str.fragments_task
                            model: task_Page.My_Fragments_Model

                        }

                    }


                }

                Item{
                    width: parent.width / 2
                    height: parent.height

                    Column{
                        width: parent.width
                        height: parent.height
                        spacing: ui.basic_spacing

                        Scheme_And_Map{
                            id: sheme_and_map
                            width: parent.width
                            height: parent.height / 2 - parent.spacing / 2
                            flipped: task_Page.flip_card
                            source: "qrc:/my_components/images/station_light.jpg" //"qrc:/images/original.jpg"

                            Component.onCompleted: {

                                console.log("value = " + task_Page.flip_card)
                            }
                        }

                        Item{
                            width: parent.width
                            height: parent.height / 2 - parent.spacing / 2
                            //radius: ui.radius
                            //color: Style.light_Color

                            Fragments_List{
                                id: list
                                title: my_str.addPicked(my_str.fragments_task)
                                model: task_Page.My_Picked_Fragments_Model

                            }

                            /*List_With_Title{
                               id: list
                               width: parent.width
                               height: parent.height //- ui.height_Button - ui.basic_spacing
                               title: qsTr("Выбранные фрагменты маршрута")
                               color: Style.light_Color
                               title_name_model: [ qsTr("№"), qsTr("Код"), qsTr("Путь"), qsTr("Начало"), qsTr("Конец"), qsTr("Название")]
                               title_size_model: [0.1, 0.1, 0.1, 0.125, 0.125, 0.45]
                               title_Type: List_With_Title.Title_Types.Title_Sort_All

                               sort_func: [

                                   [(a, b) => (a.code - b.code),  (a, b) => (b.code - a.code)],
                                   [(a, b) => a.name.localeCompare(b.name),   (a, b) => - a.name.localeCompare(b.name)],
                               ]


                               model: task_Page.My_Fragments_Model //Fragments_Model //ListModel{id: upNom_ListModel}

                               delegate: List_Row{
                                   listview: list.get_list()
                                   width: list.width
                                   model: [index + 1,  upNom , putNom, list.convertCoord(startKm, startM), list.convertCoord(endKm, endM), name]

                                   //model:[Fragments_Model.rowCount(), upNom + "  " + name, putNom, startCoord, endCoord, name]
                                   sizes: list.title_size_model
                                   needHighlight: true
                                   cur: list.currentIndex



                               }

                               function sort(index, isAscending){

                                   listModelSort(list.model, list.sort_func[index][isAscending])

                               }

                               Component.onCompleted: {

                                   console.log("qqqqqqqqqqq = " + task_Page.My_Fragments_Model.rowCount())

                                  // task_Page.My_Fragments_Model.clear();

                                   //task_Page.My_Fragments_Model.addFragment(1, 1, 2, 230, 3, 340, "dsdsadasd");

                                  // console.log("qqqqqqqqqqq = " + task_Page.My_Fragments_Model.get(0))

                               }
                           }

                            */

                            /*Row{
                               width: parent.width
                               height: ui.height_Button
                               anchors.horizontalCenter: parent.horizontalCenter
                               anchors.bottom: parent.bottom

                               Custom_Button{
                                   id: start_Button
                                   width: parent.width / 2
                                   outlined: true
                                   isOnlyText: true

                                   text:  qsTr("Начать маршрут")
                                   onClicked_Signal: {

                                       sub_index_HomePage = page_Loader.open_next(2)

                                   //    sub_index_HomePage = 2


                                   }

                               }

                               Custom_Button{
                                   width: parent.width / 2

                                   text:  qsTr("Начать маршрут")
                                   onClicked_Signal: {

                                       sub_index_HomePage = page_Loader.open_next(2)

                                   //    sub_index_HomePage = 2


                                   }

                               }
                            }
                            */


                        }



                    }


                }

            }

        }


    }




    Button{
        width: 100
        height: 40
        text:  qsTr("поворот")

        anchors.bottom: parent.bottom
        anchors.right: parent.right

        onClicked: {

            console.log("Значение поворота " + task_Page.flip_card)

            if(task_Page.flip_card){

                task_Page.set_FlipCard(false)
            }
            else{

                task_Page.set_FlipCard(true)

            }

        }

    }

    Custom_Button{
        width: 150

        anchors.right: parent.right
        anchors.rightMargin: 16

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16

        text:  qsTr("Начать маршрут")
        onClicked_Signal: {

            sub_index_HomePage = page_Loader.open_next(2)

        //    sub_index_HomePage = 2


        }

    }

}
