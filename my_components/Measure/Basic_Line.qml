import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

import Style 1.0

LineSeries {
    id: measure_LineSeries
    color: "#F68160"
    axisX: x_ValueAxis
    axisY: y_ValueAxis
    width: ui.line_width
    useOpenGL: true

    property real x_start

    property real x_finish
}
