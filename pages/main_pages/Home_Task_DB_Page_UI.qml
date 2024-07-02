import QtQuick 2.15
import QtQuick.Controls 2.15


import Task_DB_Page 1.0
import Type_Content_Button 1.0
import Type_SubIcon_Button 1.0

import my_components 1.0

/*Custom_Rectangle_Label {
    margin_text: 0
    needBack: false
    anchors.centerIn: parent

    text: qsTr("Страница помощи")
}*/

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    signal back_Page_Signal

    signal next_Page_Signal


    Task_DB_Page{
        id: task_Page

        onSave_Route_Signal: {

            task_DB_Block_Page.open_dialog()

        }
    }


    Task_DB_Block_Page{
        id: task_DB_Block_Page
        task_Page: task_Page

        onBack_Page_Signal: {

            root_Item.back_Page_Signal()
        }

        onNext_Page_Signal: {

            root_Item.next_Page_Signal()
        }


    }


    Column{
        width:1000
        height: 48 //* 3
        anchors.left: parent.left

        //anchors.rightMargin: 150
        anchors.bottom: parent.bottom


        Row{
            width:parent.width
            height: 48

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Получить объекты из бд")
                onClicked: {

                 //  console.log(task_Page.task_Block.task_Passport_DB.SiteId_Model.get(task_Page.task_Block.task_Passport_DB.pickedindex_SiteIDModel).name)


                  /*  task_Page.task_Block.get_Objects(
                                  task_Page.task_Block.task_Passport_DB.SiteId_Model.get(task_Page.task_Block.task_Passport_DB.pickedindex_SiteIDModel).name,
                                  task_Page.task_Block.task_Passport_DB.Up_Nom_Model.get(task_Page.task_Block.task_Passport_DB.pickedindex_Up_Nom_Model).name,
                                  task_Page.task_Block.task_Passport_DB.Put_Nom_Model.get(task_Page.task_Block.task_Passport_DB.pickedindex_Put_Nom_Model).name,
                                  129) */


                    //task_Page.task_Block.get_Objects("", "", "", 2)



                    task_DB_Block_Page.get_Objects()
                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Новая оценка в таблицу")
                onClicked: {

                   Test_Class.test_slot_NewKm()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Общая информация в файл")
                onClicked: {

                   Test_Class.addGeneral_Info()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Новый километр в файл")
                onClicked: {

                   Test_Class.addNew_Km()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("Добавит точки")
                onClicked: {

                   Test_Class.test_slot_CloseExportMicroservice()

                }

            }

            Button{
                width: 200
                height: parent.height
                text:  qsTr("print_pdf")
                onClicked: {

                   // km_ChartView.scrollDown(20)

                    Test_Class.print_pdf()

                    //my_pdf.print_pdf()

                  //  chartView.scrollRight(100)

                  //  viser_Line.update_ViserLine(50)


                }

            }



        }




    }
}
