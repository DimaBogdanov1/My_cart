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

    function update_elements(index_arr){

        for(var i = 0; i <  index_arr.length; i++){

            repeater.itemAt(index_arr[i]).text = popup.model.get(index_arr[i]).text

            repeater.itemAt(index_arr[i]).checked = popup.model.get(index_arr[i]).checked
        }
    }

    Column{
        id: root_Column
        width: parent.width - ui.basic_spacing
        height: parent.height - ui.basic_spacing
        anchors.centerIn: parent
        spacing: ui.basic_spacing / 2

      /*  Mini_Title{
            id: title_Block
            text: "Заголовок"

        } */

        Column{
            width: parent.width
            height: parent.height
            spacing: ui.basic_spacing / 2

            Repeater{
                id: repeater
                width: parent.width
                height: parent.height
                model: root_Item.model // popup.model

                Column{
                    width: parent.width
                    height: popup.height_menu_element //ui.height_Button + ui.border_Size + spacing
                    spacing: ui.basic_spacing / 2

                    Menu_Element{
                        height: ui.height_Button
                        source: popup.model.get(index).source !== undefined ? popup.model.get(index).source : ""
                        text: popup.model.get(index).text
                        checkable: popup.model.get(index).checkable
                        checked: popup.model.get(index).checked
                        onlyTrueCheck: popup.model.get(index).onlyTrueCheck !== undefined ? popup.model.get(index).onlyTrueCheck : false

                        onClicked_Signal: {

                            var update_index = popup.model.get(index).pick(checked)

                            if(update_index !== null){

                                update_elements(update_index)

                            }

                        }

                    }

                 //   Custom_Border{color: "red"}

                }


            }

        }


    }
}
