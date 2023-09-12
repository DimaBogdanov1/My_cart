import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0


Item {

    property real width_Line: 1.5

    property real x_start

    property var pickets_arr: []

    Measure_Lines{
        id: measureLines
    }

    function create_RailsLine(){

        measureLines.create_Line(x_start, y_ValueAxis.min, x_start, 60, Style.secondaryAccent_Color, Qt.SolidLine, "left_Rail") // Создаём Рельс

        measureLines.create_Line(x_start + width_Line, y_ValueAxis.min, x_start + width_Line, 60, Style.secondaryAccent_Color, Qt.SolidLine, "raight_Rail") // Создаём Рельс

        for(var i = 0; i < 60; i += 2){

             measureLines.create_Line(x_start, i, x_start + width_Line, i, Style.secondaryAccent_Color, Qt.SolidLine, "line")
        }
    }


    // Функция Для Отображения Линии Километра
    function create_KmLine(y_coord){

        measureLines.create_Line(0, y_coord, x_ValueAxis.max, y_coord, Style.accentLight_Color, Qt.DotLine, "km_1") // Создаём Линию Километра (Дефекта)

        createPicket(y_coord, "256")
    }


    function createPicket(y_coord, title)
    {
        var name = "picket" + pickets_arr.length

        var p = chartView.mapToPosition(Qt.point(x_start + width_Line / 2 , y_coord), name);

        var component = Qt.createComponent("qrc:/my_components/Elements/Custom_Rectangle_Label.qml")

        var picket = component.createObject(parent,{"x":p.x ,"y":p.y })

        pickets_arr.push(picket)

        //picket.id = name

        picket.text = title

       // picket.margin_text = 24
        picket.x -= picket.width / 2

        picket.y -= picket.height / 2

        picket.needBorder = true



       // picket.width = 100

        //picket.height = 48

    }

    function update_Pickets(value){

        for(var i = 0; i < pickets_arr.length; i++){

            pickets_arr[i].y -= value

        }


    }

}
