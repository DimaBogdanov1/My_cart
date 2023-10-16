import QtQuick 2.0

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import Style 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    property real navigation_Height: 50

    property real week_Height: 50

    Rectangle {
        id: bg_Rectangle
        width: parent.width
        height: parent.height
        radius: ui.radius
        layer.enabled: true
        layer.effect: Mask_Rectangle{target: parent}

        Calendar {
            id: calendar
            width: parent.width - ui.basic_spacing
            height: parent.height - ui.basic_spacing
            frameVisible: false
            anchors.centerIn: parent
           // locale: Qt.locale("en_AU")


            minimumDate: new Date(2017, 0, 1)
            maximumDate: new Date(2018, 0, 1)

            selectedDate: minimumDate


            style: CalendarStyle {
                  gridVisible: false

                  background: Rectangle{
                      width: parent.width
                      height: parent.height
                      color: Style.background_Color
                  }

                  navigationBar: Rectangle {
                          height: root_Item.navigation_Height
                          color: Style.background_Color

                          Row{
                              width: parent.width - ui.big_spacing
                              height: parent.height
                              anchors.centerIn: parent

                              Custom_Icon_Button{
                                  height: parent.height
                                  color_rec: Style.light_Color
                                  icon_path: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"

                                  onClicked_Signal: {

                                      control.showPreviousMonth()
                                  }
                              }

                              Custom_Rectangle_Label{
                                  width: parent.width - 2 * ui.iconBlock_topBar_Size
                                  height: parent.height
                                  needBack: false
                                  pixel_size: ui.text_MiddleSize
                                  font_weight:  ui.font_weight_Bigsize
                                  font_family: customTitle_FontLoader.name
                                  text: update_title(control.locale.standaloneMonthName(control.visibleMonth)) //  calendar.visibleMonth + calendar.visibleYear  //   styleData.title


                                  function update_title(month){

                                      var str = month.charAt(0).toUpperCase() + month.slice(1);

                                      return str + " " + calendar.visibleYear
                                  }

                                  /*Component.onCompleted: {


                                      //readonly property string title: control.locale.standaloneMonthName(control.visibleMonth)
                                          //                   + new Date(control.visibleYear, control.visibleMonth, 1).toLocaleDateString(control.locale, " yyyy")
                                        //             }
                                      var day = calendar.selectedDate.getDate();
                                      var month = calendar.selectedDate.getMonth() ; //assuming you want 1..12, getMonth()'s return value is zero-based!
                                      var year = calendar.selectedDate.getFullYear();


                                      //var day2 = calendar.date.getDate();


                                      calendar.visibleMonth
                                      console.log(control.locale.standaloneMonthName(control.visibleMonth))


                                  }*/

                              }

                              Custom_Icon_Button{
                                  height: parent.height
                                  color_rec: Style.light_Color
                                  rotation: 180
                                  icon_path: "qrc:/icons/" + Style.theme + "/top_bar/arrow_left_1.svg"

                                  onClicked_Signal: {

                                     control.showNextMonth()

                                  }
                              }
                          }

                      }

                  dayOfWeekDelegate: Custom_Rectangle_Label {
                      color: Style.background_Color
                      height: root_Item.week_Height
                      //pixel_size: ui.text_MiddleSize
                      font_weight:  ui.font_weight_Bigsize
                      font_family: customTitle_FontLoader.name
                      text: control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)


                  }


                  dayDelegate: Item {
                      width: 50
                      height: width

                      Rectangle {
                          id: rec
                          width: parent.width - ui.basic_spacing
                          height: width
                          anchors.centerIn: parent
                          layer.enabled: true
                          layer.effect: Mask_Rectangle{target: rec;}

                          Main_Gradient{off: !styleData.selected; off_color: Style.background_Color}

                          Custom_Label{
                              opacity: styleData.valid ? 1 : 0.3
                              horizontalAlignment: Text.AlignHCenter
                              color:  styleData.selected ?  Style.background_Color  : Style.primaryDark_Color
                              text: styleData.date.getDate()

                          }

                          Hover_Anim{
                              id: hover_Anim
                              width: parent.width
                              height: parent.height
                              radius: rec.width / 2

                              onClicked_Signal: {


                                  var day = styleData.date.getDate();
                                  var month = styleData.date.getMonth() ; //assuming you want 1..12, getMonth()'s return value is zero-based!
                                  var year = styleData.date.getFullYear();

                                  calendar.selectedDate =  new Date(year, month, day)

                                 // toast.show(styleData.title , 3000, 1) // Показываем Тоcт


                               //   calendar.selectedDate =  new Date(styleData.date.getYear(), styleData.date.getMonth(), styleData.date.getYear())



                              }

                          }

                      }


                      /*Custom_Rectangle_Label {
                            width: parent.width - ui.basic_spacing
                            height: width
                            anchors.centerIn: parent

                            radius: width / 2

                            text_color:  styleData.selected ?  Style.background_Color  : (styleData.valid ?  Style.primaryDark_Color : Style.light_Color)


                           // color: styleData.selected ?   "red" :  Style.background_Color
                            text: styleData.date.getDate()






                        }

                      */
                  }

                  }
        }



    }
}

