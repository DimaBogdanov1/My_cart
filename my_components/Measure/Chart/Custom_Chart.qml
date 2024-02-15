import QtQuick 2.15
import QtCharts 2.15

import Style 1.0

ChartView {
   x: -56
   y: -34 // -41
   width: parent.width + 100
   height: parent.height + 75//96 //95
   dropShadowEnabled: false
   antialiasing: true
   backgroundColor:  Style.background_Color //"red"//Style.background_Color
   legend.visible:false
   plotAreaColor: Style.background_Color


}
