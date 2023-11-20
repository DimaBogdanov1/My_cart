import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0

Item {

    id: root_Item

    readonly property real offset: (x_start - x_min) / 2

    readonly property real arrow_offset: 1

    readonly property real arrow_y_offset: 2

    readonly property real marker_Size: 10


    function createLine_Structure(arr, id, color, type){

        var series = chartView.createSeries(type, id, x_ValueAxis, y_ValueAxis)

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


        var arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord]]

        createLine_Structure(arr_middle, "middleSwitch_struct",  Style.warning_Color, ChartView.SeriesTypeLine)



        createArrow(x_start - offset, y_coord, false)


        createArrow(x_finish + offset , y_coord, true)


    }

    function createBorder_Structure(y_coord)
    {

        const circle_size = 0.1

        const arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord]]

        createLine_Structure(arr_middle, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)


        const point_left = [[x_start - offset, y_coord + circle_size]]

        createLine_Structure(point_left, "left_point", "", ChartView.SeriesTypeScatter)


        const point_right = [[x_finish + offset + circle_size , y_coord + circle_size]]

        createLine_Structure(point_right, "left_point", "", ChartView.SeriesTypeScatter)

    }

    function help_create_IsolatedJoin(x, y, height){

        var arr_top = [ [x , y + height], [x + offset / 2, y + height]]

        createLine_Structure(arr_top, "right_struct", Style.warning_Color, ChartView.SeriesTypeLine)


        var arr_bottom = [ [x , y ], [x + offset / 2, y]]

        createLine_Structure(arr_bottom, "right_struct", Style.warning_Color, ChartView.SeriesTypeLine)

    }

    function createIsolated_Joint_Structure(y_coord)
    {
        var a =  x_start - offset / 2

        var x_offset = a - offset / 2

        var y_offset = y_coord - arrow_y_offset





        var b =   x_start + width_Line + offset / 2  //x_start + width_Line + arrow_offset

        var c = b + offset / 2


        var height_value = 3


        var arr_right = [ [b + offset / 4, y_coord ], [b + offset / 4, y_coord + height_value]]

        createLine_Structure(arr_right, "right_struct", Style.warning_Color, ChartView.SeriesTypeLine)

        var arr_center = [ [b - offset / 4 , y_coord + height_value / 2], [b + offset / 4, y_coord + height_value / 2]]

        createLine_Structure(arr_center, "right_struct", Style.warning_Color, ChartView.SeriesTypeLine)

        help_create_IsolatedJoin(b, y_coord, height_value)
    }

    function createArtificial_Structure(y_coord)
    {
        var a =  x_start - offset / 2//x_start - arrow_offset

        var x_offset = a - offset / 2

        var y_offset = y_coord - arrow_y_offset


        var arr_left = [[x_offset, y_offset], [a, y_coord], [a, y_coord + 20], [x_offset, y_coord + 20 + arrow_y_offset]]

        createLine_Structure(arr_left, "left_struct", Style.warning_Color, ChartView.SeriesTypeLine)



        var b =   x_start + width_Line + offset / 2  //x_start + width_Line + arrow_offset

        var c = b + offset / 2




        var arr_right = [[c, y_offset], [b, y_coord], [b, y_coord + 20] , [c, y_coord + 20 + arrow_y_offset]]

        createLine_Structure(arr_right, "right_struct", Style.warning_Color, ChartView.SeriesTypeLine)


    }

    function createArrowSensors_Structure(y_coord)
    {
        const arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord], [x_finish + offset  , y_coord - arrow_y_offset]]

        createLine_Structure(arr_middle, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)


        createArrow(x_start - offset,  y_coord, false)

    }

    function createRailroad_Crossing(y_coord){


        const arr_top = [[x_start - offset, y_coord], [x_finish + offset, y_coord]]


        const arr_bottom = [[arr_top[0][0], y_coord + 3], [arr_top[1][0], y_coord + 3]]



        const arr_2 = [[ x_center , arr_top[0][1] ], [x_center, arr_bottom[1][1]] ]

        createLine_Structure(arr_2, "middle_struct",  Style.primaryDark_Color, ChartView.SeriesTypeLine)


        const arr_1 = [[ x_start - offset / 2 , arr_top[0][1] ], [x_start - offset / 2, arr_bottom[1][1]] ]

        createLine_Structure(arr_1, "middle_struct", Style.primaryDark_Color, ChartView.SeriesTypeLine)


        const arr_3 = [[ x_finish + offset / 2 , arr_top[0][1] ], [x_finish + offset / 2 , arr_bottom[1][1]] ]

        createLine_Structure(arr_3, "middle_struct", Style.primaryDark_Color, ChartView.SeriesTypeLine)


        createLine_Structure(arr_top, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)

        createLine_Structure(arr_bottom, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)

    }

    function createArrow(x_offset, y_offset, isRight){

        var a = offset / 4

        var b = arrow_y_offset / 2

        if(isRight){

            a *= -1
            b *= -1
        }


        const arrow_left = [[x_offset + a, y_offset - b], [x_offset, y_offset], [x_offset + a, y_offset + b]]


        createLine_Structure(arrow_left, "middleSwitch_struct", Style.primaryDark_Color, ChartView.SeriesTypeLine)
    }



}
