import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import Style 1.0
import my_components 1.0


Item {
   id: root_Item
   width: parent.width
   height: parent.height

   property var model

   property string title

 //  property string text


    function update_elements(index_arr){

        for(var i = 0; i <  index_arr.length; i++){

            repeater.itemAt(index_arr[i]).text = root_Item.model.get(index_arr[i]).text

            repeater.itemAt(index_arr[i]).checked = root_Item.model.get(index_arr[i]).checked
        }
    }

    Item{
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        anchors.centerIn: parent

        Column{
            id: root_Column
            width: parent.width
            height: parent.height - ui.basic_spacing / 2
            anchors.bottom: parent.bottom
            spacing: ui.basic_spacing / 2

            Mini_Title{
                id: title_Block
                boldStyle: true
                text: root_Item.title //"Заголовок"

            }

            Column{
                width: parent.width
                height: parent.height //- title_Block.height - ui.basic_spacing / 2
                spacing: ui.basic_spacing / 2

                Repeater{
                    id: repeater
                    width: parent.width
                    height: parent.height
                    model: root_Item.model // popup.model

                    Menu_Element{
                        height: ui.height_Button //popup.height_menu_element //ui.height_Button
                        source: root_Item.model.get(index).source !== undefined ? root_Item.model.get(index).source : ""
                        text: root_Item.model.get(index).text
                        checkable: root_Item.model.get(index).checkable
                        checked: root_Item.model.get(index).checked
                        onlyTrueCheck: root_Item.model.get(index).onlyTrueCheck !== undefined ? root_Item.model.get(index).onlyTrueCheck : false

                        onClicked_Signal: {

                            var update_index = root_Item.model.get(index).pick(checked)

                            if(update_index !== null){

                                update_elements(update_index)

                            }

                        }

                    }


                    /*Column{
                        width: parent.width
                        height: popup.height_menu_element //ui.height_Button + ui.border_Size + spacing
                        spacing: ui.basic_spacing / 2


                     //   Custom_Border{color: "red"}

                    } */


                }

            }


        }

    }

}
