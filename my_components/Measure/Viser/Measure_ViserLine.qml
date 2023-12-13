import QtQuick 2.15
import QtCharts 2.15

import Style 1.0

import my_components 1.0


Item {

    Measure_Lines{
        id: measureLines
    }


    function show_hide_viserLine(value){

        if(value){

           chartView.series("viser_Line").opacity = 1

        }
        else{

           chartView.series("viser_Line").opacity = 0

        }
      //  console.log("dd ", value)

    }

    // Функция Для Отображения Линии Визера
    function create_ViserLine(y_coord){

        measureLines.create_Line(0, 0, x_ValueAxis.max, 0, Style.accentLight_Color, Qt.DotLine, "viser_Line") // Создаём Линию Визера

        chartView.series("viser_Line").width = 1

        chartView.series("viser_Line").opacity = 0

     //   measureLines.create_Line(0, 0, 26.5, 40, Style.accentLight_Color, Qt.DotLine, "gg") // Создаём Линию Визера

    }


    function update_ViserLine(y_coord){

        if(chartView.series("viser_Line") !== null){

            chartView.series("viser_Line").replace(0, 0, y_coord)

            chartView.series("viser_Line").replace(1, x_ValueAxis.max, y_coord)
        }

    }

    /*Opacity_Anim{
        id: opacity_Anim
        animation_target: chartView.series("viser_Line")

    }*/

    Component.onCompleted: {
        create_ViserLine()
    }
}
