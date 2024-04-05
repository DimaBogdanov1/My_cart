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

    function changeEnabled_TaskBlock(value){

        road_ComboBox.enabled = value

        roadInfo_TextField.enabled = value

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


        Column{
          width: parent.width
          height: parent.height - ui.toolBar_Size - ui.basic_spacing
          spacing: ui.basic_spacing

          Item{
              width: parent.width
              height: parent.height / 2 - ui.basic_spacing

              Row{
                  width: parent.width - ui.big_spacing
                  height: parent.height
                  anchors.centerIn: parent
                  spacing: ui.basic_spacing

                  Item{
                      width: parent.width / 2 - parent.spacing / 2
                      height: parent.height
                      //radius: ui.radius
                      //color: "red"//Style.background_Color

                      Column{ // Создаём Основную Колонку
                          width: parent.width //- ui.big_spacing
                          height: parent.height
                          spacing: ui.middle_spacing //ui.basic_spacing * 2
                          anchors.centerIn: parent

                          Task_Info_Column{
                              task_Page: task_Page.task_Passport_DB

                          }

                          /*
                          Custom_Row_ComboBox{
                              id: road_ComboBox
                              width: parent.width
                              source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"
                              start_index_model: [task_Page.pickedindex_SiteIDModel, task_Page.pickedindex_Type_Tracks_Model]

                              model: [
                                  { title: my_str.siteID, combo_model: task_Page.SiteId_Model},
                                  { title: my_str.typeTracks, combo_model: task_Page.Type_Tracks_Model}
                              ]


                              onChange_index_signal: {

                                  if(index_model == 0){

                                      task_Page.set_pickedindex_SiteIDModel(index)

                                  }

                                  if(index_model == 1){

                                      task_Page.set_pickedindex_Type_Tracks_Model(index)

                                  }

                                  task_Page.set_UpNom(task_Page.SiteId_Model.get(task_Page.pickedindex_SiteIDModel).name)

                              }



                          }

                          Custom_Row_ComboBox{
                              id: roadInfo_TextField
                              source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"

                              start_index_model: [task_Page.pickedindex_Up_Nom_Model, task_Page.pickedindex_Put_Nom_Model]
                              model_1: task_Page.Up_Nom_Model
                              model_2: task_Page.Put_Nom_Model
                              model: [
                                  { title: my_str.upNom}, // combo_model: task_Page.Up_Nom_Model}, // pickedindex_Up_Nom_Model
                                  { title: my_str.putNom} // combo_model: task_Page.Put_Nom_Model} // pickedindex_Put_Nom_Model
                              ]

                              onChange_index_signal: {

                                  //console.log("Сработал клик Help Page index = " + index)

                                  if(index_model == 0){

                                      task_Page.set_pickedindex_Up_Nom_Model(index)

                                      task_Page.set_PutNom(task_Page.SiteId_Model.get(task_Page.pickedindex_SiteIDModel).name, task_Page.Up_Nom_Model.get(index).name)

                                  }

                                  if(index_model == 1){

                                      task_Page.set_pickedindex_Put_Nom_Model(index)


                                  }
                              }
                          }


                          */







                         /* Custom_Row_ComboBox{
                              source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"

                              start_index_model: [task_Page.pickedindex_Up_Nom_Model]

                              model: [
                                  { title: my_str.upNom, combo_model: task_Page.Up_Nom_Model} // pickedindex_Up_Nom_Model
                              ]

                              onChange_index_signal: {

                                  console.log("Сработал клик Help Page index = " + index)

                                  if(index_model == 0){

                                      task_Page.set_pickedindex_Up_Nom_Model(index)

                                      task_Page.set_PutNom(task_Page.SiteId_Model.get(task_Page.pickedindex_SiteIDModel).name, task_Page.Up_Nom_Model.get(index).name)

                                  }

                              }
                          }


                          Custom_Row_ComboBox{
                              source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"

                              start_index_model: [task_Page.pickedindex_Put_Nom_Model]

                              model: [
                                  { title: my_str.putNom, combo_model: task_Page.Put_Nom_Model} // pickedindex_Put_Nom_Model
                              ]

                              onChange_index_signal: {

                                  console.log("Сработал клик Help Page index = " + index)

                                  if(index_model == 0){

                                      task_Page.set_pickedindex_Put_Nom_Model(index)

                                  }

                              }
                          } */

                         /* Custom_Row_ComboBox{
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

                          Custom_Row_ComboBox{
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

                          */

                          // Стартовую точку выберем на финальном слое
                          Custom_Row_TextField{
                              id: startPoint_Row
                              source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                              start_Keyboard: 0 //400

                              model: [
                                     { title: my_str.km, text: task_Page.task_Passport_DB.start_Km, maximumLength: ui.km_textLength},
                                     { title: my_str.meter, text: task_Page.task_Passport_DB.start_M, maximumLength: ui.meter_textLength}
                                 ]

                              onTextChanged: {

                                  if(index_model == 0){

                                      task_Page.task_Passport_DB.set_StartKm(text)
                                  }

                                  if(index_model == 1){

                                      console.log("sssssssssssssss")

                                      task_Page.task_Passport_DB.set_StartM(text)
                                  }

                              }

                          }

                          Custom_Rectangle_Label{
                              width: parent.width
                              height: parent.height - startPoint_Row.height * 3 - parent.spacing * 3
                              needBack: true
                              color: Style.light_Color
                              //text: "Это место нужно чем-то забить"

                              Component.onCompleted: {

                                  //console.log("parent.height =    " + parent.height  + " road_ComboBox.height * 3 = " + road_ComboBox.height * 3 + "  parent.spacing * 3 = " + parent.spacing * 3)
                              }

                              Label{
                                  text: my_str.convertCoord(task_Page.coordList[0], task_Page.coordList[1]) + " " + my_str.convertCoord(task_Page.coordList[2], task_Page.coordList[3])
                                  anchors.centerIn: parent
                              }

                              Column{
                                  width: parent.width
                                  height: parent.height

                                  Row{
                                      width: parent.width
                                      height: parent.height / 2
                                      spacing: 10

                                      Custom_Button{
                                          width: 200
                                          text: "Добавить фрагменты"

                                          onClicked_Signal: {


                                              task_Page.set_Fragments(task_Page.SiteId_Model.get(task_Page.pickedindex_SiteIDModel).name,
                                                                      task_Page.Up_Nom_Model.get(task_Page.pickedindex_Up_Nom_Model).name,
                                                                      task_Page.Put_Nom_Model.get(task_Page.pickedindex_Put_Nom_Model).name,
                                                                      check_Moving.checked
                                                                      )



                                          }

                                      }

                                      CheckBox{
                                          id: check_Moving
                                          checked: true
                                          text: "Движение по возрастанию"
                                      }

                                      Custom_Button{
                                          width: 300
                                          text: "Удалить последний элемент из выбранных"

                                          onClicked_Signal: {

                                               toast.show(task_Page.My_Picked_Fragments_Model.rowCount(), 3000, 1)

                                              task_Page.remove_PickedFragment(task_Page.My_Picked_Fragments_Model.rowCount() - 1, check_Moving.checked)

                                          }
                                      }


                                  }

                                  Row{
                                      width: parent.width
                                      height: parent.height // 2
                                      spacing: 10

                                      Custom_Button{
                                          width: 200
                                          text: "Анимация"

                                          onClicked_Signal: {

                                              if(!isCheck){
                                                  isCheck = true

                                                  table_Anim_open.start()

                                              }
                                              else{
                                                  isCheck = false

                                                  table_Anim_close.start()

                                              }

                                          }

                                      }

                                      Custom_Button{
                                          width: 300
                                          text: "Выбрать новую дорогу или направление"

                                          onClicked_Signal: {

                                              //Нужно очистить таблицу и заново
                                              toast.show("Возвращаем enabled", 3000, 1)

                                              changeEnabled_TaskBlock(true)

                                              task_Page.set_Filter(-1, 0, false)
                                               //toast.show(task_Page.My_Picked_Fragments_Model.rowCount(), 3000, 1)

                                             // task_Page.remove_PickedFragment(task_Page.My_Picked_Fragments_Model.rowCount() - 1, check_Moving.checked)

                                          }
                                      }
                                  }
                              }



                          }


                      }



                  }

                  Item{
                      width: parent.width / 2 - parent.spacing / 2
                      height: parent.height

                      Column{
                          width: parent.width
                          height: parent.height
                          spacing: ui.basic_spacing

                          Scheme_And_Map{
                              id: sheme_and_map
                              width: parent.width
                              height: parent.height
                              flipped: task_Page.flip_card
                              source: task_Page.schemePath // "qrc:/my_components/images/station_light.jpg" //"qrc:/images/original.jpg"

                              onNewScheme_Signal: {

                                  task_Page.set_SchemePath(path)
                              }

                              Component.onCompleted: {

                                  console.log("value = " + task_Page.flip_card)
                              }
                          }

                      }


                  }

              }

          }

          Row{
              id: tables_Row
              width: parent.width - ui.big_spacing
              height: parent.height / 2
              spacing: ui.basic_spacing

              anchors {
                left: parent.left
                leftMargin: ui.basic_spacing
               }

              Fragments_List{
                  width: parent.width / 2 - parent.spacing / 2
                  title: my_str.fragments_task
                  model: task_Page.My_Sort_Fragments_Model

                  onFirst_Row_Signal: {

                      toast.show("Cтавим enabled false", 3000, 1)

                      changeEnabled_TaskBlock(false)

                  }

              }

              Fragments_List{
                  id: pickedFragment_list
                  width: parent.width / 2 - parent.spacing / 2
                  title: my_str.addPicked(my_str.fragments_task)
                  model: task_Page.My_Picked_Fragments_Model
                  isPicked_List: true

              }
          }

        }


    }


    SequentialAnimation{

       id: table_Anim_open

       ParallelAnimation{


           NumberAnimation {target: tables_Row; property: "anchors.leftMargin"; from: tables_Row.anchors.leftMargin; to: - 1 * tables_Row.width / 2 + ui.basic_spacing / 2 ; duration: 250 }

           NumberAnimation {target: pickedFragment_list; property: "width"; from: pickedFragment_list.width; to: parent.width - ui.big_spacing  ; duration: 250 }

       }

       onRunningChanged: {

           if(!running){

               pickedFragment_list.updateHeader(true)

               pickedFragment_list.open_Titles()

           }
       }

     //  NumberAnimation {target: defect_List; property: "width"; from: defect_List.width; to: bootom_Row.width * 0.6 -  ui.basic_spacing ; duration: 500 }


    }



    SequentialAnimation{

       id: table_Anim_close

       ParallelAnimation{


           NumberAnimation {target: tables_Row; property: "anchors.leftMargin"; from: tables_Row.anchors.leftMargin; to: ui.basic_spacing ; duration: 250 }

           NumberAnimation {target: pickedFragment_list; property: "width"; from: pickedFragment_list.width; to: parent.width / 2 - ui.basic_spacing * 1.5  ; duration: 250 }

       }

       onRunningChanged: {

           if(!running){

               pickedFragment_list.updateHeader(false)

               pickedFragment_list.open_Titles()

           }
       }

     //  NumberAnimation {target: defect_List; property: "width"; from: defect_List.width; to: bootom_Row.width * 0.6 -  ui.basic_spacing ; duration: 500 }


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

        text: my_str.next
        type_Content: Custom_Button.Type_Content_Button.Text_And_Icon_Content
        iconHelp_source:  Custom_Button.Type_SubIcon.Next_Icon

        onClicked_Signal: {

            sub_index_HomePage = page_Loader.open_next(2)

        //    sub_index_HomePage = 2


        }

    }




    Column{
        width:1000
        height: 48 * 3
        anchors.right: parent.right

        anchors.rightMargin: 150
        anchors.bottom: parent.bottom


        Row{
            width:parent.width
            height: 48

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Получить объекты из бд")
                onClicked: {

                   console.log(task_Page.task_Passport_DB.SiteId_Model.get(task_Page.task_Passport_DB.pickedindex_SiteIDModel).name)


                   /* task_Page.get_Objects(
                                  task_Page.task_Passport_DB.SiteId_Model.get(task_Page.task_Passport_DB.pickedindex_SiteIDModel).name,
                                  task_Page.task_Passport_DB.Up_Nom_Model.get(task_Page.task_Passport_DB.pickedindex_Up_Nom_Model).name,
                                  task_Page.task_Passport_DB.Put_Nom_Model.get(task_Page.task_Passport_DB.pickedindex_Put_Nom_Model).name,
                                  129) */


                    task_Page.get_Objects("", "", "", 2)
                }

            }

        }

        Row{
            width:parent.width
            height: 48

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Новый мост")
                onClicked: {

                   Test_Class.test_slot_add_bridge()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Новая стрелка")
                onClicked: {

                   Test_Class.test_slot_add_arrow()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Новый объект")
                onClicked: {

                   Test_Class.test_slot_add_object()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Новая линия помощи")
                onClicked: {

                   Test_Class.test_slot_helpLine()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("print_pdf")
                onClicked: {

                   // km_ChartView.scrollDown(20)

                    Test_Class.print_pdf()

                    //my_pdf.print_pdf()

                  //  chartView.scrollRight(100)

                  //  viser_Line.update_ViserLine(50)


                }

            }

        }


       Row{
           width:parent.width
           height: 48

           Button{
               width: 200
               height: parent.height
               text:  qsTr("Новый километр")
               onClicked: {

                  Test_Class.test_slot_NewKm()

               }

           }

           Button{
               width: 200
               height: parent.height
               text:  qsTr("Новые параметры")
               onClicked: {

                  Test_Class.test_slot_NewParams()

               }

           }

           Button{
               width: 200
               height: parent.height
               text:  qsTr("Новая общая информация")
               onClicked: {

                  Test_Class.test_slot_NewGeneralInfo()

               }

           }

           Button{
               width: 200
               height: parent.height
               text:  qsTr("Добавит точки")
               onClicked: {

                  Test_Class.test_slot_CloseExportMicroservice()

               }

           }

           Button{
               width: 200
               height: parent.height
               text:  qsTr("Новые шпалы")
               onClicked: {

                  Test_Class.test_slot_add_sleepers()

               }

           }

       }

    }
}
