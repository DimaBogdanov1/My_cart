import QtQuick 2.15
import QtCharts 2.15

import Style 1.0

ValueAxis {
   min: 0
   max: 35
   tickType: ValueAxis.TicksDynamic
   tickInterval: 10
   labelFormat: "%i" // Делаем int Значения
   color: Style.light_Color
   gridLineColor: Style.light_Color  // Цвет Сетки
   labelsFont:Qt.font({pointSize: 1})

}
