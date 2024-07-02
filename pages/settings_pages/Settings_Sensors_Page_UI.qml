import QtQuick 2.15
import QtQuick.Controls 2.15

import Type_Button 1.0
import Type_Content_Button 1.0
import Type_SubIcon_Button 1.0

import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    property int index_Page: 0

   /* Custom_Rectangle_Label{
        width: parent.width
        height: parent.height
        needBack: true
        needBorder: true
        text: "Тут будет настройка датчиков!"

    } */

    Column{
        width: parent.width //- ui.big_spacing
        height: parent.height //- ui.big_spacing
        anchors.centerIn: parent
        spacing: ui.middle_spacing

        Custom_Tabs{
            id: tabs
            width:  600
            anchors.horizontalCenter: parent.horizontalCenter
            mini_Size: true

            model: [qsTr("Основные параметры") , qsTr("Дополнительные параметры")]

        }

        SwipeView{
            id: stackLayout
            width: parent.width
            height: parent.height - ui.height_Button - parent.spacing * 2 - tabs.height// - ui.height_Button - parent.spacing * 2
            currentIndex: tabs.index
            clip: true

            onCurrentIndexChanged: {

                tabs.update_position(currentIndex)

                keyboard.check_close()

            }

                  Item {

                      Settings_Sensors{
                          id: basic_Sensors
                          model: [my_str.level, my_str.riht_Left,
                              my_str.riht_Right, my_str.widthTrack,
                              my_str.down_Left, my_str.down_Right]
                      }


                  }

                  Item {

                      Settings_Sensors{
                          model: [
                              my_str.side_Damage_Left, my_str.side_Damage_Right,
                               my_str.bowing_Left,  my_str.bowing_Right
                          ]
                      }


                  }


        }

        Row{
            width: parent.width - basic_Sensors.spacing
            height: ui.height_Button
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: ui.basic_spacing

            Custom_Button{
                width: parent.width / 2 - ui.basic_spacing / 2
                type_Button: Type_Button.Text_Button
                text_color: Style.primaryDark_Color

                text:  qsTr("Значения по умолчанию")
                onClicked_Signal: {

                    popup.close()

                    applicationWindow.flipped = false

                    //index_Page = 0
                }

            }

            Custom_Button{
                width: parent.width / 2 - ui.basic_spacing / 2
                height: ui.height_Button
                type_Button: Type_Button.Outlined_Button
                //type_Content: Type_Content_Button.Text_And_Icon_Content
                //iconHelp_source: Type_SubIcon_Button.Add_Icon

                text:  qsTr("Обновить значения")

                onClicked_Signal: {



                }

            }
        }




    }

}

/*

                      Flickable {
                          id: flickable
                          width: parent.width
                          height: parent.height
                          contentHeight: 10 * ui.block_height  + 10 *  ui.middle_spacing + ui.height_Button
                          clip: true

                          Column{
                              width: parent.width
                              height:  parent.height
                              spacing: ui.middle_spacing

                              Repeater{
                                  width: parent.width
                                  height: parent.height
                                  model: [my_str.level, my_str.riht_Left,
                                      my_str.riht_Right, my_str.widthTrack,
                                      my_str.down_Left, my_str.down_Right,
                                      my_str.side_Damage_Left, my_str.side_Damage_Right,
                                      my_str.bowing_Left,  my_str.bowing_Right
                                  ]

                                  Row{
                                      width: parent.width
                                      height:ui.block_height
                                      spacing: ui.basic_spacing

                                      Custom_Rectangle_Label{
                                          id: title_Label
                                          width: 200
                                          height: parent.height
                                        //  needBack: true
                                        //  needBorder: true
                                        //  color: "red"
                                          horizontal: Text.AlignLeft
                                          text: modelData

                                      }

                                      Custom_Row_TextField{
                                          //source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"
                                          width: parent.width - title_Label.width - parent.spacing
                                          start_Keyboard: 0//root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                                          model: [
                                                 { title: qsTr("Смещение"), text: "0", maximumLength: ui.text_Values.siteId_textLength},

                                              { title: qsTr("Множитель"), text: "1", maximumLength: ui.text_Values.siteId_textLength}
                                             ]

                                          onTextChanged: {

                                            //  custom_Task_Page.task_Passport_DB.set_Custom_SiteId(text)

                                          }
                                      }
                                  }


                              }

                              Row{
                                  width: parent.width
                                  height: ui.height_Button
                                  spacing: ui.basic_spacing

                                  Custom_Button{
                                      width: parent.width / 2 - ui.basic_spacing / 2
                                      type_Button: Type_Button.Text_Button
                                      text_color: Style.primaryDark_Color

                                      text:  qsTr("Значения по умолчанию")
                                      onClicked_Signal: {

                                          popup.close()

                                          applicationWindow.flipped = false

                                          //index_Page = 0
                                      }

                                  }

                                  Custom_Button{
                                      width: parent.width / 2 - ui.basic_spacing / 2
                                      height: ui.height_Button
                                      type_Button: Type_Button.Outlined_Button
                                      //type_Content: Type_Content_Button.Text_And_Icon_Content
                                      //iconHelp_source: Type_SubIcon_Button.Add_Icon

                                      text:  qsTr("Обновить значения")

                                      onClicked_Signal: {



                                      }

                                  }
                              }

                          }

                      }


  */
