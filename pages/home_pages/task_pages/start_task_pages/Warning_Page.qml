import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Row{
        width: parent.width
        height: parent.height

        Rectangle{
            width: parent.width / 2
            height: parent.height
            radius: ui.radius
            color: Style.light_Color

            Column{ // Создаём Основную Колонку
                width: 450
                height: parent.height - 24
                anchors.centerIn: parent
                spacing: ui.middle_spacing //ui.basic_spacing * 2

                Custom_Row_ComboBox{
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
                }

                Custom_Row_TextField{
                    id: roadInfo_TextField
                    source: "qrc:/icons/" + Style.theme + "/utils/lock.svg"
                    start_Keyboard: 0 //root_Item.start_Keyboard + ui.block_height + ui.middle_spacing
                    model: ListModel{

                        ListElement{
                            title: "Код направления"
                            isLetter: false
                            maximumLength: 5

                        }

                        ListElement{
                            title: "Номер пути"
                            isLetter: false
                            maximumLength: 1

                        }

                    }
                }

                Custom_Row_ComboBox{
                    id: speed_ComboBox
                    width: parent.width
                    height: ui.block_height
                    source: "qrc:/icons/" + Style.theme + "/home_page/pencil.svg"
                    title: qsTr("Скорость") + mytrans.emptyString
                    property int speed: 15
                  //  model:  [qsTr("Рабочая") + mytrans.emptyString , qsTr("Контрольная") + mytrans.emptyString , qsTr("Дополнительная") + mytrans.emptyString]

                    onCurrentIndexChanged: {

                        speed = speed_ComboBox.model[currentIndex].split(" ")[0]

                    }

                    Component.onCompleted: {

                        var a = new Array

                        //a.push()
                        for(var i = speed; i < 150; i+= 15){

                            a.push(i + qsTr(" Км/ч") + mytrans.emptyString)
                        }

                        model = a
                    }
                }


                Custom_Row_TextField{
                    id: startPoint_Row
                    source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 300
                    model: ListModel{

                        ListElement{
                            title: "Начальный километр"
                            isLetter: false
                            km: true
                        }

                        ListElement{
                            title: "Начальный метр"
                            isLetter: false
                            meter: true


                        }

                    }
                }

                Custom_Row_TextField{
                    id: endPoint_Row
                    source:  "qrc:/icons/" + Style.theme + "/top_bar/location.svg"
                    start_Keyboard: 300
                    model: ListModel{

                        ListElement{
                            title: "Конечный километр"
                            isLetter: false
                            km: true
                        }

                        ListElement{
                            title: "Конечный метр"
                            isLetter: false
                            meter: true


                        }

                    }
                }


                Custom_Date_Block {
                    id: date_Block
                    title: qsTr("Время действия") + mytrans.emptyString
                    source:  "qrc:/icons/" + Style.theme + "/utils/calendar.svg"

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
                    text:  qsTr("Добавить предупреждение") + mytrans.emptyString
                    icon_with_Text: true
                    source: "qrc:/icons/" + Style.theme + "/top_bar/plus_white.svg" // "qrc:/icons/" + Style.theme + "/navigation/home.svg"
                    onClicked_Signal: {

                       // console.log("picked_siteID = "  + picked_siteID , "picked_upNom = "  + picked_upNom , "picked_putNom = "  + picked_putNom )

                    //   Warnings.add_Warning(picked_siteID, picked_upNom, picked_putNom, startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

                        var result = false

                        if(roadInfo_TextField.check_text()){

                            if(startPoint_Row.check_text()){

                                if(endPoint_Row.check_text()){

                                    result = true
                                    // нужно ли сравнивать километры

                                    Warnings.add_Warning(road_ComboBox.num_Value, roadInfo_TextField.get_text(0), roadInfo_TextField.get_text(1), startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

                                }

                            }

                        }


                        if(!result){

                            create_error_anim()
                        }


                     //   Warnings.add_Warning(road_ComboBox.num_Value, roadInfo_TextField.get_text(0), roadInfo_TextField.get_text(1), startPoint_Row.get_text(0), startPoint_Row.get_text(1), endPoint_Row.get_text(0), endPoint_Row.get_text(1), date_Block.get_dates(0), date_Block.get_dates(1), speed_ComboBox.speed)

                    }

                }

            }
        }

    }
}
