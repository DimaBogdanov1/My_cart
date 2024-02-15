import QtQuick 2.15
import Style 1.0

import my_components 1.0


Custom_Rectangle_Label {
    width: parent.width
    height: parent.height
    text: (task_Values.startCood + sensorsVal.odometer_value).toFixed(2)  //  qsTr("255.50")
    color: Style.background_Color

    Connections{
        target: Mqqt_Client

        function onNewSystemCoord_signal(value){

            sensorsVal.setOdometer(value)

            //text = value
        }

    }
}
