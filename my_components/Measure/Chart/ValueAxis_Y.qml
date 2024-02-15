import QtQuick 2.15
import QtCharts 2.15

import Style 1.0

ValueAxis {
   min: 0
   tickType: ValueAxis.TicksFixed
   tickInterval: 10
   labelsVisible: false
   labelsFont:Qt.font({pointSize: 1})
}
