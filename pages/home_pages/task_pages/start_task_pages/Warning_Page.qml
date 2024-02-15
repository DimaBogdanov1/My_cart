import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import Warning_Page 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Warning_Page{
        id: warning_Page
    }

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
                height: parent.height - 24
                anchors.centerIn: parent
                spacing: ui.middle_spacing //ui.basic_spacing * 2

                Custom_Row_ComboBox{
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                    model: [
                        { title: my_str.siteID, combo_model: warning_Page.SiteId_Model, picked_index: warning_Page.pickedindex_SiteIDModel},
                        { title: my_str.typeTracks,  combo_model: warning_Page.Type_Tracks_Model, picked_index: warning_Page.pickedindex_Type_Tracks_Model}
                    ]

                }

                Custom_Row_ComboBox{
                    id: roadInfo_TextField
                    source: "qrc:/my_components/icons/" + Style.theme + "/utils/lock.svg"

                    model: [
                        { title: my_str.upNom, combo_model: warning_Page.Up_Nom_Model, picked_index: warning_Page.pickedindex_Up_Nom_Model},
                        { title: my_str.putNom, combo_model: [], picked_index: 0}
                    ]

                    onChange_index_signal: {

                    }
                }

                Custom_Row_ComboBox{
                    id: speed_ComboBox
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/my_components/icons/" + Style.theme + "/home_page/pencil.svg"

                    property var speed_Model: [15, 30, 45, 60, 75, 90, 105, 120, 135, 150]

                    property int speed: 15

                    model: [
                        { title: my_str.speed, combo_model: speed_Model, picked_index: 0, needConvert: true},
                    ]

                    onChange_index_signal: {

                        speed = speed_ComboBox.model.get(index_model).values.get(index).value.split(" ")[0];

                        console.log("speed = " + speed)

                    }

                    Component.onCompleted: {

                        var a = new Array

                        //a.push()
                        for(var i = speed; i < 150; i+= 15){

                            a.push(i + " км/ч")


                            model[0].combo_model.push(i + " км/ч")

                        }

                        speed_Model.push(111)

                        //model[0].combo_model = a

                        console.log("размер = " + model[0].combo_model.length)

                        //model.values.append = a
                    }
                }


                Custom_Row_TextField{
                    id: startPoint_Row
                    source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 300

                    model: [
                         { title: "Начальный километр", text: warning_Page.start_Km, maximumLength: ui.km_textLength},
                         { title: "Начальный метр", text: warning_Page.start_M, maximumLength: ui.meter_textLength}
                    ]

                    onTextChanged: {

                        switch(index_model){

                        case 0:

                            warning_Page.set_StartKm(text)

                            break

                        case 1:

                            warning_Page.set_StartM(text)

                            break
                        }

                    }

                }

                Custom_Row_TextField{
                    id: endPoint_Row
                    source:  "qrc:/my_components/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 300

                    model: [
                         { title: "Конечный километр", text:  warning_Page.end_Km, maximumLength: ui.km_textLength},
                         { title: "Конечный метр", text: warning_Page.end_M, maximumLength: ui.meter_textLength}
                    ]

                    onTextChanged: {

                        switch(index_model){

                        case 0:

                            warning_Page.set_EndKm(text)

                            break

                        case 1:

                            warning_Page.set_EndM(text)

                            break
                        }

                    }

                }


                Custom_Date_Block {
                    id: date_Block
                    title: qsTr("Время действия")
                    source:  "qrc:/my_components/icons/" + Style.theme + "/utils/calendar.svg"
                    left_Date: warning_Page.left_date
                    right_Date: warning_Page.right_date

                    onNewDate_signal: {

                        var date = new Date(year, month, day)

                        if(isStartDate){

                            warning_Page.set_LeftDate(date)

                        }
                        else{

                            warning_Page.set_RightDate(date)

                        }
                    }

                    Component.onCompleted: {

                        /*var date_1 = new Date()

                        var date_2 = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + get_max_days())

                        warning_Page.set_LeftDate(date_1)

                        warning_Page.set_RightDate(date_2) */


                        //warning_Page.set_LeftDate(date_1.toString())

                        //warning_Page.set_RightDate(date_2.toString())

                    }
                }

                /*Custom_Row_TextField{
                    source:  "qrc:/icons/" + Style.theme + "/utils/calendar.svg"
                    start_Keyboard: 300
                    model: ListModel{

                        ListElement{
                            title: "Время действия"
                            isLetter: false
                            km: true
                        }

                        ListElement{
                            title: "Дата конца"
                            isLetter: false
                            meter: true


                        }

                    }
                }

                */

                Custom_Button{
                    width: parent.width
                    text:  qsTr("Добавить предупреждение")
                    icon_with_Text: true
                    source: "qrc:/my_components/icons/" + Style.theme + "/top_bar/plus_white.svg"
                    onClicked_Signal: {

                       // console.log("picked_siteID = "  + picked_siteID , "picked_upNom = "  + picked_upNom , "picked_putNom = "  + picked_putNom )

                    //   Warnings.add_Warning(picked_siteID, picked_upNom, picked_putNom, startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

                        var result = false

                        /*if(roadInfo_TextField.check_text()){



                        }*/

                        warning_Page.add_Warning(authorization_Account_Icon.authorization_id, 0, 1, 1, startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(2), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)


                        /*if(startPoint_Row.check_text()){

                            if(endPoint_Row.check_text()){

                                result = true
                                // нужно ли сравнивать километры


                                //Warnings.add_Warning(authorization_Account_Icon.authorization_id, 0, roadInfo_TextField.get_text(0), roadInfo_TextField.get_text(1), startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(2), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

                            }

                        }


                        if(!result){

                            create_error_anim()
                        }*/


                     //   Warnings.add_Warning(road_ComboBox.num_Value, roadInfo_TextField.get_text(0), roadInfo_TextField.get_text(1), startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

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
}
