import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0

Item {

    id: root_Item

    readonly property real offset: 0.7

    readonly property real arrow_offset: 1

    readonly property real marker_Size: 8


    function createRails(){


       // measureLines.create_Line(x_start, y_ValueAxis.min, x_start, 100, Style.secondaryAccent_Color, Qt.SolidLine, "left_Rail") // Создаём Рельс

       // measureLines.create_Line(x_start + width_Line, y_ValueAxis.min, x_start + width_Line, 100, Style.secondaryAccent_Color, Qt.SolidLine, "raight_Rail") // Создаём Рельс



        var arr_left = [[x_start, 0], [x_start, 100]]

        var arr_right = [[x_start + width_Line, y_ValueAxis.min], [x_start + width_Line, 100]]

        createLine_Structure(arr_left, "left_rail",  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        createLine_Structure(arr_right, "right_rails",  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        for(var i = 0; i < 100; i += 2){

            var arr = [ [x_start, i] , [x_start + width_Line, i]]
            createLine_Structure(arr, "right_rails",  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

            //measureLines.create_Line(x_start, i, x_start + width_Line, i, Style.secondaryAccent_Color, Qt.SolidLine, "line")
        }
    }


    function createLine_Structure(arr, id, color, type){

        var series = km_ChartView.createSeries(type, id, xKm_ValueAxis, yKm_ValueAxis)

        series.color =  color


        if(type === ChartView.SeriesTypeScatter){

            series.markerSize = root_Item.marker_Size

            series.color =  Style.background_Color

            series.borderColor = Style.primaryDark_Color

        }


        series.width = ui.line_width

        series.style =  Qt.SolidLine

        series.capStyle = Qt.RoundCap

        series.joinStyle = Qt.RoundJoin

        for(var i = 0; i < arr.length; i++){

            series.append(arr[i][0], arr[i][1]);

        }
    }

    function createArrowSwitch_Structure(y_coord){




        var arr_middle = [[x_start - offset, y_coord], [x_finish + offset, y_coord]]

        createLine_Structure(arr_middle, "middleSwitch_struct",  Style.warning_Color, ChartView.SeriesTypeLine)

        createArrow(x_start - offset - arrow_offset, y_coord, false)


        createArrow(x_finish + offset + arrow_offset, y_coord, true)


    }

    function createBorder_Structure(y_coord)
    {

        var arr_middle = [[x_start - offset, y_coord], [x_finish + offset, y_coord]]

        createLine_Structure(arr_middle, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)


        var point_left = [[x_start - offset, y_coord]]

        createLine_Structure(point_left, "left_point", "", ChartView.SeriesTypeScatter)


        var point_right = [[x_finish + offset , y_coord]]

        createLine_Structure(point_right, "left_point", "", ChartView.SeriesTypeScatter)

    }

    function createArtificial_Structure(y_coord)
    {
        var a = x_start - arrow_offset

        var x_offset = a - offset

        var y_offset = y_coord - 2



        var arr_left = [[x_offset, y_offset], [a, y_coord], [a, y_coord + 20], [x_offset, y_coord + 20 + 2]]

        createLine_Structure(arr_left, "left_struct", Style.warning_Color, ChartView.SeriesTypeLine)



        var b =  x_start + width_Line + arrow_offset

        var c = b + offset




        var arr_right = [[c, y_offset], [b, y_coord], [b, y_coord + 20] , [c, y_coord + 20 + 2]]

        createLine_Structure(arr_right, "right_struct", Style.warning_Color, ChartView.SeriesTypeLine)


    }

    function createArrowSensors_Structure(y_coord)
    {
        var arr_middle = [[x_start - offset, y_coord], [x_finish + offset, y_coord], [x_finish + offset + arrow_offset, y_coord - 2]]

        createLine_Structure(arr_middle, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)


        createArrow(arr_middle[0][0] - arrow_offset,  y_coord, false)

    }

    function createRailroad_Crossing(y_coord){


        var arr_top = [[x_start - offset, y_coord], [x_finish + offset, y_coord]]


        var arr_bottom = [[arr_top[0][0], y_coord + 2], [arr_top[1][0], y_coord + 2]]



        var arr_2 = [[ x_center , arr_top[0][1] ], [x_center, arr_bottom[1][1]] ]

        createLine_Structure(arr_2, "middle_struct",  Style.primaryDark_Color, ChartView.SeriesTypeLine)


        var arr_1 = [[ x_center - offset , arr_top[0][1] ], [x_center - offset , arr_bottom[1][1]] ]

        createLine_Structure(arr_1, "middle_struct", Style.primaryDark_Color, ChartView.SeriesTypeLine)


        var arr_3 = [[ x_center + offset , arr_top[0][1] ], [x_center + offset , arr_bottom[1][1]] ]

        createLine_Structure(arr_3, "middle_struct", Style.primaryDark_Color, ChartView.SeriesTypeLine)


        createLine_Structure(arr_top, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)

        createLine_Structure(arr_bottom, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)

    }

    function createArrow(x_offset, y_offset, isRight){

        var a = arrow_offset

        var b = 1

        if(isRight){

            a *= -1
            b *= -1
        }


        var arrow_left = [[x_offset + a, y_offset - b], [x_offset, y_offset], [x_offset + a, y_offset + b]]


        createLine_Structure(arrow_left, "middleSwitch_struct", Style.primaryDark_Color, ChartView.SeriesTypeLine)
    }



}
