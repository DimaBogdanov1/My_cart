import QtQuick 2.15

import my_components 1.0


Item {


    function getModel(index){

        var model

        switch(index){

        case 0:

            model = moreMain_model

            break;


        }

        return model
    }

    Task_MoreModel{id: moreMain_model}


}
