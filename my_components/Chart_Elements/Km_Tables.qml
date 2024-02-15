import QtQuick 2.15
import QtQuick.Controls 2.15
//import Defect_Model 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    function open(){

        table_Anim_open.stop()

        table_Anim_open.start()
    }

    function close(){

        table_Anim_close.stop()

        table_Anim_close.start()

    }




    Row{
        width: parent.width
        height: parent.height
        spacing: ui.basic_spacing

        List_With_Title{
               id: defect_List
               width:  parent.width * 0.85 - ui.basic_spacing //parent.width
               height: parent.height
               noTitle: true
               title_name_model: [qsTr("Координата"), qsTr("Отстпуление"), str.extent, qsTr("Размер"), qsTr("Длинна"), qsTr("Признак"), str.set_speed, str.limit_speed]
               title_size_model: [0.12, 0.16, 0.1, 0.12, 0.1, 0.12, 0.14, 0.14]

               model: Defect_Model

               delegate: List_Row{
                   //listview: defect_ListView
                   model: [Coord, Defect, Extent, Amp, Width_Defect, Sign, Speed, Speed_Limit] //[coord, defect, extent, amp, width_defect, sign, speed, speed_limit]
                   sizes: defect_List.title_size_model
                   //cur: defect_ListView.currentIndex

               }

           }

        List_With_Title{
               id: km_mark_List
               width: parent.width * 0.4 // - ui.basic_spacing //- ui.basic_spacing // 2
               height: parent.height
               noTitle: true
               title_name_model: [ str.km_big, str.set_speed, str.limit_speed, str.extent , qsTr("Оценка") ]
               title_size_model: [0.18, 0.23, 0.23, 0.23, 0.13]

               model: Km_Mark_Model //km_mark_ListModel

                       //Km_Mark_Model

               delegate: List_Row{
                   width: km_mark_List.width
                   model: [Km, Speed, Speed_Limit, Extent, Mark]
                   sizes: km_mark_List.title_size_model
                  // needHighlight: true

               }

           }



    }


    SequentialAnimation{

       id: table_Anim_open

       ParallelAnimation{


           NumberAnimation {target: bootom_Row; property: "anchors.leftMargin"; from: bootom_Row.anchors.leftMargin; to: - 1 * button_Map_Column.width - ui.basic_spacing; duration: 250 }

           NumberAnimation {target: map; property: "anchors.leftMargin"; from: map.anchors.leftMargin; to: - 1 * button_Map_Column.width - ui.basic_spacing; duration: 250 }

       }

       NumberAnimation {target: defect_List; property: "width"; from: defect_List.width; to: bootom_Row.width * 0.6 -  ui.basic_spacing ; duration: 500 }


    }

    SequentialAnimation{

       id: table_Anim_close

       NumberAnimation {target: defect_List; property: "width"; from: defect_List.width; to: bootom_Row.width * 0.85 - ui.basic_spacing ; duration: 500 }


       ParallelAnimation{

           NumberAnimation {target: bootom_Row; property: "anchors.leftMargin"; from: bootom_Row.anchors.leftMargin; to: 0; duration: 250 }

           NumberAnimation {target: map; property: "anchors.leftMargin"; from: map.anchors.leftMargin; to: ui.big_spacing / 2; duration: 250 }

       }



    }



    Connections{
        target: Mqqt_Client

        function onNewDefect_signal(km, m, defect, extent, amp, width_defect, sign, speed, speed_limit){

            Defect_Model.addDefect(km, m, defect, extent, amp, width_defect, sign, speed, speed_limit)

        }

        function onNewKmMark_signal(km, speed, speed_limit, extent, mark){

            Km_Mark_Model.addKm_Mark(km, speed, speed_limit, extent, mark)
           /* var new_km = km + " км"

            var new_speed = speed + " км/ч"

            var new_speed_limit = speed_limit + " км/ч"

            km_mark_ListModel.append({   "Km": new_km,
                                         "Speed": new_speed,
                                         "Speed_Limit": new_speed_limit,
                                         "Extent": extent,
                                         "Mark": "Отлично"}) */


        }



    }

}





