import QtQuick 2.15

import Style 1.0
import my_components 1.0

Item {
    width: parent.width
    height: parent.height

    Row{
        id: row
        width: parent.width
        height: parent.height
        spacing: ui.basic_spacing / 2

        readonly property real offset: ui.basic_spacing * 2 / 5

        Rectangle{ // Общая Информация
            width: parent.width * 0.28 - row.offset
            radius: ui.radius
            height:  parent.height
            color: Style.background_Color

            Row{
                width: parent.width
                height: parent.height

                Custom_Rectangle_Label {
                    id: upNom_Label
                    width: parent.width * 0.3
                    height: parent.height
                    needBack: false
                    text: qsTr("Код: ") + task_Values.upNom

                }

                Custom_Rectangle_Label {
                    id: direction_Label
                    width: parent.width * 0.4
                    height: parent.height
                    needBack: false
                    text: task_Values.nameDirection //qsTr("Москва-Рига")

                }



                Custom_Rectangle_Label {
                    id: putNom_Label
                    width: parent.width * 0.3
                    height: parent.height
                    needBack: false
                    text: qsTr("Путь: ") + task_Values.putNom

                }
            }

        }

        Rectangle{
            width: parent.width * 0.28 - row.offset
            radius: ui.radius
            height:  parent.height
            color: Style.background_Color

            Row{
                width: parent.width
                height: parent.height

                Custom_Rectangle_Label {
                    id: pch_Label
                    width: parent.width * 0.25
                    height: parent.height
                    needBack: false
                    text: qsTr("ПЧ: ") + task_Values.now_pch_List[0]

                }

                Custom_Rectangle_Label {
                    id: pchy_Label
                    width: parent.width * 0.25
                    height: parent.height
                    needBack: false
                    text: qsTr("ПЧУ: ") + task_Values.now_pch_List[1]

                }

                Custom_Rectangle_Label {
                    id: pd_Label
                    width: parent.width * 0.25
                    height: parent.height
                    needBack: false
                    text: qsTr("ПД: ") + task_Values.now_pch_List[2]

                }

                Custom_Rectangle_Label {
                    id: pdb_Label
                    width: parent.width * 0.25
                    height: parent.height
                    needBack: false
                    text: qsTr("ПДБ: ") + task_Values.now_pch_List[3]

                }
            }

        }

        Custom_Text_Arrow{
           id: stationBlock
           width: parent.width * 0.28 - row.offset
           height: ui.height_Button
           enabled: false
           text_1: task_Values.now_Station_Pair[0]  // qsTr("Станиция 1")
           text_2: task_Values.now_Station_Pair[1]  //qsTr("Станиция 2")

        }

        Custom_Rectangle_Label {
            id: speedLabel
            width: parent.width * 0.08 - row.offset
            height: parent.height
            color: Style.background_Color
            text: sensorsVal.speed + qsTr(" км/ч")

        }

        Rectangle{
            width: parent.width * 0.08 - row.offset
            radius: ui.radius
            height:  parent.height
            color: Style.background_Color

            Custom_Text_With_Icon{
                id: chargeLabel
              //  width: parent.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                icon_size: 24
                source: "qrc:/icons/"+ Style.theme + "/utils/battery.svg"
                //property real charge: 100

                text: sensorsVal.charge_percent + "%"  // charge

            }
        }

    }

    Connections{
        target: Mqqt_Client

        function onNewSpeed_signal(speed){

            sensorsVal.setSpeed(speed)
        }

        function onNewCharge_signal(charge){

            sensorsVal.charge_percent = charge
        }

        function onNewDirection_signal(up_nom, name){

            task_Values.setUpNom(up_nom)

            task_Values.setNameDirection(name)

        }

        function onNewPutNom_signal(putNom){

            task_Values.setPutNom(put_nom)

        }

        function onNewPCH_signal(pch, pchy, pd, pdb){

            task_Values.setPch([pch, pchy, pd, pdb])

        }

        function onNewStation_signal(station_1, station_2){

            task_Values.setStation([station_1, station_2])

            //stationBlock.text_1 = station_1

           // stationBlock.text_2 = station_2

        }


        function onNewSpeedTrain_signal(startCoord, finishCoord, speedPass, speedFreight, speedSallowBird, speedSapsan){

            //console.log("Новая ")

        }
    }

    Connections{
        target: big_db

        function onNewTask_signal(up_nom, name, put_nom){

           /* direction_Label.text = name

            upNom_Label.text = qsTr("Код: ") + up_nom

            putNom_Label.text = qsTr("Путь: ") + put_nom

            console.log("Код = " + up_nom + " Направление = " + name + " Путь = " + put_nom) */
        }
    }
}
