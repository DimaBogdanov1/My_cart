import QtQuick 2.15

import my_components 1.0


Item {


    function getModel(index){

        var model

        switch(index){

        case 0:

            model = moreMain_model

            break;

        case 1:

            model = more_model

            break

        case 2:

            model = objects_model

            break

        case 3:

            model = scale_model

            break
        }

        return model
    }

    ChartsMore_Main_Model{id: moreMain_model}

    ChartsMore_Model{id: more_model}

    ChartsObjects_Model{id: objects_model}

    ChartsScale_Model{id: scale_model}


    function openObjectPopup(index_position){

        console.log("Позиция = " + index_position)
        objects_Popup.x = calculate_offset(index_position, objects_Popup.width)
        objects_Popup.open()
    }

    Objects_Popup{
        id: objects_Popup

    }
}
