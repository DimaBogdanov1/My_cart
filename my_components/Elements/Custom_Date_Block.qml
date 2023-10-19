import QtQuick 2.0

import Style 1.0
import MyLang 1.0

import my_components 1.0

Row{
    id: root_Row
    width: parent.width
    height:   ui.height_Button // ui.block_height //
    spacing: ui.basic_spacing

    property string title

    property string source

    property bool isStartDate

    readonly property var currentDate: new Date()

    property var left_Date: new Date()

    property var right_Date: new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + calendar.max_days)

    function convert_date(value){

        if(value < 9){

            return "0" + value
        }
        else{

            return value

        }
    }

    function set_date(year, month, day, days){

        var date  = convert_date(day + days) + "." + convert_date(month + 1) + "." + year

      //  var date_2  = convert_date(currentDate.getDate() + days) + "." + convert_date(currentDate.getMonth() + 1) + "." + currentDate.getFullYear()

        return date

    }

    function get_dates(index){

        var arr = [label_1.text, label_2.text]

        return arr[index]

    }

    Custom_Icon{
        height: ui.height_Button
        anchors.bottom: parent.bottom
        source: root_Row.source

     }

    Rectangle {
       width: parent.width - ui.basic_spacing - ui.icon_nav_size
       height: parent.height //- title_Block.height - ui.basic_spacing / 2
       radius: ui.radius
       color: "transparent"// Style.background_Color

       Row{
           width: parent.width
           height: parent.height
           spacing: ui.basic_spacing

           Custom_Button{
               id: label_1
               width: parent.width / 2 - ui.basic_spacing  - ui.icon_nav_size / 2
               height: parent.height
               outlined: true
               isOnlyText: true
               //color: Style.primaryDark_Color

               text: set_date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(), 0)
               onClicked_Signal: {

                   isStartDate = true

                  // calendar.minimumDate = currentDate

                   //calendar.minimumDate = left_Date

                   //calendar.maximumDate = new Date(left_Date.getFullYear(), left_Date.getMonth(), left_Date.getDate() + calendar.max_days)

               //    calendar.selectedDate =

                   console.log("left = " + left_Date.getDate())

                   calendar.selectedDate = left_Date //new Date(left_Date.getFullYear(), left_Date.getMonth(), left_Date.getDate())

                   calendar.x = ui.icon_nav_size + ui.basic_spacing

                   calendar.open()

               }

           }


           Custom_Icon{
               id: arrow_Icon
               width: ui.icon_nav_size
               height: parent.height
               source: "qrc:/icons/" + Style.theme + "/top_bar/minus.svg"


            }

           Custom_Button{
               id: label_2
               width: parent.width / 2 - ui.basic_spacing  - ui.icon_nav_size / 2
               height: parent.height
               outlined: true
               isOnlyText: true
               //color: Style.primaryDark_Color
               text: set_date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(), calendar.max_days)
               onClicked_Signal: {

                   isStartDate = false

                   console.log("right_Date = " + right_Date.getDate())

                   calendar.selectedDate = right_Date //new Date(right_Date.getFullYear(), right_Date.getMonth(), right_Date.getDate())

                  // calendar.minimumDate = currentDate

                   //calendar.maximumDate = right_Date //new Date(right_Date.getFullYear(), right_Date.getMonth(), right_Date.getDate() + calendar.max_days)

                   calendar.x = ui.icon_nav_size * 2  + label_1.width + ui.basic_spacing * 3

                   calendar.open()

               }

           }


       }


    }


    Calendar_Popup{
        id: calendar


       // minimumDate: new Date() //left_Date
       // maximumDate: right_Date

        onNewDate_signal: {

            var date  = convert_date(day) + "." + convert_date(month + 1) + "." + year

            if(isStartDate){

                left_Date = new Date(year, month, day)

                label_1.text = set_date(year, month, day, 0)
            }
            else{

                right_Date = new Date(year, month, day)

                label_2.text = set_date(year, month, day, 0)

            }

        }
    }






}
