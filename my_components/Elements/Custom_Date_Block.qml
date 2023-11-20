import QtQuick 2.0

import Style 1.0
import MyLang 1.0

import my_components 1.0

Row{
    id: root_Row
    width: parent.width
    height:    ui.block_height  //ui.height_Button // ui.block_height //
    spacing: ui.basic_spacing


    property string title

    property string source

    property bool isStartDate

    readonly property var currentDate: new Date()

    property var left_Date: new Date()

    property var right_Date: new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + calendar.max_days)

    readonly property var maximum: new Date(currentDate.getFullYear(), currentDate.getMonth() + 6, currentDate.getDate())

    function convert_date(value){

        if(value < 10){

            return "0" + value
        }
        else{

            return value

        }
    }

    function set_date(date, days){

        var tmp_Date = new Date(date.getFullYear(), date.getMonth(),  date.getDate() + days)

        var text_date  = convert_date(tmp_Date.getDate()) + "." + convert_date(tmp_Date.getMonth() + 1) + "." + tmp_Date.getFullYear()

        return text_date

    }

    function get_dates(index){

        var arr = [label_1.text, label_2.text, set_date(currentDate, 0)]

        return arr[index]
    }

    Icon_In_Row{}

    Column{
        width: parent.width - ui.basic_spacing - ui.icon_nav_size
        height: ui.block_height
        spacing: ui.basic_spacing / 2

        Mini_Title{
            id: title_Block
            text: root_Row.title
        }

        Rectangle {
           width: parent.width
           height: ui.height_Button //- title_Block.height - ui.basic_spacing / 2
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
                   basic_text: true
                   isOnlyText: true
                   color: Style.light_Color //Style.primaryDark_Color

                   text: set_date(currentDate, 0)
                   onClicked_Signal: {

                       isStartDate = true

                       var a = new Date(right_Date.getFullYear(), right_Date.getMonth(), right_Date.getDate() - calendar.max_days)

                       if(a > currentDate){

                        //   calendar.minimumDate = a

                       }
                       else{

                         //  calendar.minimumDate = currentDate

                       }

                       calendar.minimumDate = currentDate

                       calendar.maximumDate = root_Row.maximum

                   //    calendar.maximumDate = right_Date

                       label_2.text = ""

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
                   basic_text: true
                   outlined: true
                   isOnlyText: true
                   color: Style.light_Color //Style.primaryDark_Color
                   text: set_date(currentDate, calendar.max_days)
                   onClicked_Signal: {

                       isStartDate = false

                       calendar.selectedDate = right_Date //new Date(right_Date.getFullYear(), right_Date.getMonth(), right_Date.getDate())


                       calendar.minimumDate = left_Date

                       calendar.maximumDate = new Date(left_Date.getFullYear(), left_Date.getMonth(), left_Date.getDate() + calendar.max_days)


                       calendar.x = ui.icon_nav_size * 2  + label_1.width + ui.basic_spacing * 3

                       calendar.open()

                   }

               }


           }


        }

    }



    Calendar_Popup{
        id: calendar


        minimumDate: new Date() //left_Date
        maximumDate: root_Row.maximum // right_Date

        onNewDate_signal: {

            var date  = convert_date(day) + "." + convert_date(month + 1) + "." + year

            if(isStartDate){

                left_Date = new Date(year, month, day)

                label_1.text = set_date(left_Date, 0)

            }
            else{

                right_Date = new Date(year, month, day)

                label_2.text = set_date(right_Date, 0)

            }

        }
    }






}
