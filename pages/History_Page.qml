import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtCharts 2.15


import History_Charts_Page 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    History_Charts_Page{
        id: history_Page

        onChart_Km_Values_Changed: {

            chart_Block_Page.draw_New_Km_Block()

        }

        onNew_Riht_Signal: {

            chart_Block_Page.draw_One_Riht()

        }

        onNew_Line_Signal: {

            chart_Block_Page.add_new_Line(index, subType, index_list)

        }


        onNew_SpeedLine_Signal: {

            chart_Block_Page.draw_New_SpeedLine(type)

        }

        onNew_Area_Signal: {

            chart_Block_Page.draw_Area(index)

        }


    }

    Chart_Block_Page{
        id: chart_Block_Page
        width: parent.width
        height: parent.height
        movingChart: false
        charts_Page: history_Page

        onBack_Click_Signal: {

            toast.show("Нажали назад!", 3000, 1)

        }
    }

    Column{
        width: 1000
        height: 48

        anchors{
            right: parent.right
            rightMargin: 100
            bottom: parent.bottom
        }

        Row{
            width: parent.width
            height: 48

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Открыть файл")

                onClicked: {

                    history_Page.open_file()

                }


            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("вниз")
                onClicked: {

                    chart_Block_Page.create_Main_Scroll(30, false)

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("вверх")
                onClicked: {

                    chart_Block_Page.create_Main_Scroll(30, true)

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Поиск файлов")

                onClicked: {

                    history_Page.search_file()
                    //history_Page.open_file()

                }


            }

        }
    }



    /*List_With_Title{
           id: defect_List
           width:  800
           height: 400 //parent.height
           title: "Маршруты"

           header_model: [
                   { title: qsTr("Устройство"), size: 0.2},
                   { title: my_str.siteID, size: 0.2},
                   { title: qsTr("Год"), size: 0.15},
                   { title: qsTr("Месяц"), size: 0.15},
                   { title: qsTr("Вид проверки"), size: 0.15},
                   { title: qsTr("Статус"), size: 0.15}


               ]

           //title_name_model: [qsTr("Координата"), qsTr("Отстпуление"), my_str.extent, qsTr("Размер"), qsTr("Длинна"), qsTr("Признак"), my_str.set_speed, my_str.speed_limit]
           //title_size_model: [0.12, 0.16, 0.1, 0.12, 0.1, 0.12, 0.14, 0.14]

           model: history_Page.file_Model //   defect_model //charts_Page.chart_Block.My_Defect_Model  //Defect_Model

           delegate: List_Row{
               //listview: defect_ListView
               model: [device_Name, siteId, year, month, type_Check, type_Processed] //[coord, defect, extent, amp, width_defect, sign, speed, speed_limit]

               header_model: defect_List.header_model

              // sizes: defect_List.title_size_model
               //cur: defect_ListView.currentIndex

           }

       }

    */
}
