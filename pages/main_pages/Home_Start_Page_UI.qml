import QtQuick 2.15

import Type_Button 1.0
import Type_Content_Button 1.0
import Type_SubIcon_Button 1.0

import Home_Start_Page 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Home_Start_Page{
        id: home_Start_Page
    }

    Flickable_Page{
        id: page
        width: parent.width
        height: parent.height
        page_top_Bars_Models: home_Start_Page.top_Bars_Models
        needNotification: true
        needBack: false
        visible_Search: true

        title:  qsTr("Добрый день, ") + authorized_Account.login  + "!) 👋" //  my_str.page_Names.main_Page
        sourceComponent: Component {


            Column{
               width: page.content_width //- title.left_margin * 2 // ui.big_spacing
               height: page.content_height //- topBar.height - title.height - parent.spacing * 2 - ui.big_spacing / 2
               spacing: ui.basic_spacing


               Row{
                   id: route_Item
                   width: parent.width
                   height: parent.height - help_Row.height - parent.spacing
                   spacing: ui.basic_spacing


                   Column{
                      width: parent.width * 0.62 //- stories_Item.height - parent.spacing
                      height: parent.height
                      spacing: ui.basic_spacing

                      Custom_Rectangle_Label{
                         id: stories_Item
                         width: parent.width //height * 6 + ui.big_spacing * 5 //* 0.62 - ui.basic_spacing
                         height: 95
                         anchors.right: parent.right
                        // needBack: true
                        // needBorder: true
                         //text: "Блок для сторисов"

                         Row{
                             width: parent.width
                             height: parent.height
                           //  layoutDirection: Qt.RightToLeft
                             spacing: ui.big_spacing


                             Repeater{
                                 width: parent.width
                                 height: parent.height

                                 model: 6


                                 Stories_Block{
                                     required property int index

                                     width: parent.height
                                     text: "Вопрос " + (index + 1)

                                     onClicked_Signal: {

                                         Stories_Values.open_Stories_Signal(index)


                                     }
                                 }
                             }
                         }

                      }

                      Custom_Rectangle_Label{
                         width: parent.width
                         height: parent.height * 0.85 - stories_Item.height - parent.spacing
                         needBack: true
                         needBorder: true
                         text: "Блок для сохранённых маршрутов"


                       /*  Custom_Combobox_2{
                             width: 100
                             anchors.centerIn: parent
                             model: ["wew", "sdds"]
                         } */


                         Custom_Button{
                             width: 300
                             text: "Открыть сохранённый маршрут"

                             anchors.horizontalCenter: parent.horizontalCenter
                             anchors.bottom: parent.bottom
                             anchors.bottomMargin: ui.basic_spacing

                             onClicked_Signal: {

                                app_Page.home_Frame_Page.page_num = 1

                             }
                         }
                      }

                      Row{
                          width: parent.width
                          height: parent.height * 0.15 - parent.spacing
                          spacing: ui.basic_spacing

                          Custom_Button{
                              width: parent.width * 0.38
                              height: parent.height
                              text: my_str.page_Names.task_DB
                              color: "transparent"
                              type_Button:  Type_Button.Outlined_Button
                              type_Content:  Type_Content_Button.Text_And_Icon_Content
                              iconHelp_source: Type_SubIcon_Button.Add_Icon

                              onClicked_Signal: {

                                app_Page.home_Frame_Page.page_num = 1

                              }
                          }

                          Custom_Button{
                              width: parent.width * 0.31 - parent.spacing
                              height: parent.height
                              text:  my_str.page_Names.custom_Task
                              color: "transparent"
                              type_Button:  Type_Button.Outlined_Button
                              type_Content:  Type_Content_Button.Text_And_Icon_Content
                              iconHelp_source: Type_SubIcon_Button.Add_Icon

                              onClicked_Signal: {

                                  app_Page.home_Frame_Page.page_num = 2

                              }
                          }

                          Custom_Button{
                              width: parent.width * 0.31 - parent.spacing
                              height: parent.height
                              text: my_str.page_Names.warnings
                              color: "transparent"
                              type_Button:  Type_Button.Outlined_Button
                              type_Content:  Type_Content_Button.Text_And_Icon_Content
                              iconHelp_source: Type_SubIcon_Button.Add_Icon

                              onClicked_Signal: {

                                  app_Page.home_Frame_Page.page_num = 3

                              }
                          }

                      }


                   }

                   Column{
                      width: parent.width * 0.38 - parent.spacing
                      height: parent.height
                      spacing: ui.basic_spacing

                      Custom_Rectangle_Label{
                         width: parent.width
                         height: parent.height * 0.5 - parent.spacing / 2
                         needBack: true
                         needBorder: true
                         text: "Блок для дополнительной информации"

                      }

                      Custom_Rectangle_Label{
                         width: parent.width
                         height: parent.height * 0.5 - parent.spacing / 2
                         needBack: true
                         needBorder: true
                         text: "Блок для карты"



                         Row{
                             width: parent.width
                             height: parent.height
                             spacing: ui.basic_spacing


                             Custom_Button{
                                 width:  parent.width / 2 - parent.spacing / 2
                                 text: "старт брокер"
                                 anchors.bottom: parent.bottom
                                 anchors.bottomMargin: ui.basic_spacing

                                 onClicked_Signal: {

                                   home_Start_Page.connect_Broker(true)

                                 }
                             }

                             Custom_Button{
                                 width:  parent.width / 2 - parent.spacing / 2
                                 text: "стоп брокер"

                                 anchors.bottom: parent.bottom
                                 anchors.bottomMargin: ui.basic_spacing

                                 onClicked_Signal: {

                                   home_Start_Page.connect_Broker(false)

                                 }
                             }
                         }


                      }
                   }


               }


               Row{
                   id: help_Row
                   width: parent.width
                   height: 120 // - stories_Item.height - route_Item.height
                   spacing: ui.basic_spacing

                   Custom_Rectangle_Label{
                      width: parent.width * 0.5 - parent.spacing - qr_Block.width / 2
                      height: parent.height
                      needBack: true
                      needBorder: true
                      text: "Блок для диагностики"
                   }

                   Custom_Rectangle_Label{
                      width: parent.width * 0.5 - parent.spacing  - qr_Block.width / 2
                      height: parent.height
                      needBack: true
                      needBorder: true
                      text: "Блок для памяти"
                   }

                   Custom_Rectangle_Label{
                      id: qr_Block
                      width: parent.height //parent.width * 0.2 - parent.spacing * 2 / 3
                      height: parent.height
                      needBack: true
                      needBorder: true
                      text: "Блок для qr"
                   }
               }


            }


        }




    }




     /*Column{
       width: parent.width
       height: parent.height
       spacing: ui.basic_spacing

         Custom_TopBar{
             id: topBar
             width: parent.width
             page_top_Bars_Models: home_Start_Page.top_Bars_Models
             needNotification: true
             needBack: false


         }

         Custom_Title{
             id: title
             title: my_str.page_Names.main_Page
         }

         Column{
            width: parent.width - title.left_margin * 2 // ui.big_spacing
            height: parent.height - topBar.height - title.height - parent.spacing * 2 - ui.big_spacing / 2
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: ui.basic_spacing


            Custom_Rectangle_Label{
               id: stories_Item
               width: parent.width
               height: parent.height * 0.12
               needBack: true
               needBorder: true
               text: "Блок для сторисов"

               Custom_Button{
                   width: 300
                   text: "Открыть историю"

                   anchors.right: parent.right

                   onClicked_Signal: {

                       stories_Popup.open()

                   }
               }
            }

            Row{
                id: route_Item
                width: parent.width
                height: parent.height * 0.65 - parent.spacing * 2
                spacing: ui.basic_spacing

                Column{
                   width: parent.width * 0.6 - parent.spacing / 2
                   height: parent.height
                   spacing: ui.basic_spacing

                   Custom_Rectangle_Label{
                      width: parent.width
                      height: parent.height * 0.8 - parent.spacing / 2
                      needBack: true
                      needBorder: true
                      text: "Блок для сохранённых маршрутов"



                      Custom_Button{
                          width: 300
                          text: "Открыть сохранённый маршрут"

                          anchors.horizontalCenter: parent.horizontalCenter
                          anchors.bottom: parent.bottom
                          anchors.bottomMargin: ui.basic_spacing

                          onClicked_Signal: {

                             app_Page.home_Frame_Page.page_num = 1

                          }
                      }
                   }

                   Row{
                       width: parent.width
                       height: parent.height * 0.2 - parent.spacing / 2
                       spacing: ui.basic_spacing

                       Custom_Rectangle_Label{
                          width: parent.width / 3 - parent.spacing * 2 / 3
                          height: parent.height
                          needBack: true
                          needBorder: true
                          text: "Новый маршрут с БПД"


                       }

                       Custom_Rectangle_Label{
                          width: parent.width / 3 - parent.spacing * 2 / 3
                          height: parent.height
                          needBack: true
                          needBorder: true
                          text: "Новый пользовательский маршрут"


                       }

                       Custom_Rectangle_Label{
                          width: parent.width / 3 - parent.spacing * 2 / 3
                          height: parent.height
                          needBack: true
                          needBorder: true
                          text: "Новое предупреждение"


                       }
                   }


                }

                Column{
                   width: parent.width * 0.4 - parent.spacing / 2
                   height: parent.height
                   spacing: ui.basic_spacing

                   Custom_Rectangle_Label{
                      width: parent.width
                      height: parent.height * 0.3 - parent.spacing / 2
                      needBack: true
                      needBorder: true
                      text: "Блок для дополнительной информации"
                   }

                   Custom_Rectangle_Label{
                      width: parent.width
                      height: parent.height * 0.7 - parent.spacing / 2
                      needBack: true
                      needBorder: true
                      text: "Блок для карты"
                   }
                }


            }

            Row{
                width: parent.width
                height: parent.height * 0.23 // - stories_Item.height - route_Item.height
                spacing: ui.basic_spacing

                Custom_Rectangle_Label{
                   width: parent.width * 0.5 - parent.spacing - qr_Block.width / 2
                   height: parent.height
                   needBack: true
                   needBorder: true
                   text: "Блок для диагностики"
                }

                Custom_Rectangle_Label{
                   width: parent.width * 0.5 - parent.spacing  - qr_Block.width / 2
                   height: parent.height
                   needBack: true
                   needBorder: true
                   text: "Блок для памяти"
                }

                Custom_Rectangle_Label{
                   id: qr_Block
                   width: parent.height //parent.width * 0.2 - parent.spacing * 2 / 3
                   height: parent.height
                   needBack: true
                   needBorder: true
                   text: "Блок для qr"
                }
            }


         }



     } */



}
