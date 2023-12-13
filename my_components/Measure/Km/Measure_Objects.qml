import QtQuick 2.15
import QtCharts 2.15

import Style 1.0


Item {

    id: root_Item

    readonly property real offset: (x_start - x_min) / 2

    readonly property real arrow_offset: 1

    readonly property real arrow_y_offset: 2

    readonly property real marker_Size: 10


    function createName(title){

        return title + km_Item.km_id + km_Item.objects_arr.length
    }

    function add_object(name_arr){

        km_Item.objects_arr.push(name_arr)

    }

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

    function createDoubleArrow_Structure(y_coord){


        var arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord]]

        var name =  createName("arrowSwitch")

        createLine_Structure(arr_middle, name,  Style.warning_Color, ChartView.SeriesTypeLine)



        var arrow_left_name = createArrow(x_start - offset, y_coord, false)


        var arrow_right_name = createArrow(x_finish + offset , y_coord, true)

        var arr = [name, arrow_left_name, arrow_right_name]

        add_object(arr)
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

    function help_create_Isolated_Junction(x, y, height){

        var arr_top = [ [x , y + height], [x + offset / 2, y + height]]

        var top_name =  createName("iso_Top")

        createLine_Structure(arr_top, top_name, Style.warning_Color, ChartView.SeriesTypeLine)


        var arr_bottom = [ [x , y ], [x + offset / 2, y]]

        var bottom_name = createName("iso_Bottom")

        createLine_Structure(arr_bottom, bottom_name, Style.warning_Color, ChartView.SeriesTypeLine)

        return [top_name, bottom_name]
    }

    function createIsolated_Junction_Structure(y_coord)
    {
        var a =  x_start - offset / 2

        var x_offset = a - offset / 2

        var y_offset = y_coord - arrow_y_offset





        var b =   x_start + width_Line + offset / 2  //x_start + width_Line + arrow_offset

        var c = b + offset / 2


        var height_value = 3

        var center_name = createName("iso_Center")


        var arr_right = [ [b + offset / 4, y_coord ], [b + offset / 4, y_coord + height_value]]

        createLine_Structure(arr_right, center_name, Style.warning_Color, ChartView.SeriesTypeLine)



        var arr_center = [ [b - offset / 4 , y_coord + height_value / 2], [b + offset / 4, y_coord + height_value / 2]]

        var centerMini_name = createName("iso_miniCenter")

        createLine_Structure(arr_center, centerMini_name, Style.warning_Color, ChartView.SeriesTypeLine)

        var side_arr = help_create_Isolated_Junction(b, y_coord, height_value)


        var arr = [center_name, centerMini_name, side_arr[0], side_arr[1]]

        add_object(arr)

    }

    function createBridge_Structure(y_coord)
    {
        var a =  x_start - offset / 2//x_start - arrow_offset

        var x_offset = a - offset / 2

        var y_offset = y_coord - arrow_y_offset


        var left_name = createName("left_struct")


        const arr_left = [[x_offset, y_offset], [a, y_coord], [a, y_coord + 20], [x_offset, y_coord + 20 + arrow_y_offset]]

        createLine_Structure(arr_left, left_name, Style.warning_Color, ChartView.SeriesTypeLine)



        var b =   x_start + width_Line + offset / 2  //x_start + width_Line + arrow_offset

        var c = b + offset / 2


        var right_name = createName("right_struct")


        const arr_right = [[c, y_offset], [b, y_coord], [b, y_coord + 20] , [c, y_coord + 20 + arrow_y_offset]]

        createLine_Structure(arr_right, right_name, Style.warning_Color, ChartView.SeriesTypeLine)


        var arr = [left_name, right_name]

        add_object(arr)

    }

    function createArrow_Structure(y_coord)  {
        const arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord], [x_finish + offset  , y_coord - arrow_y_offset]]

        var name =  createName("arrow_sensor")

        createLine_Structure(arr_middle, name,  Style.warning_Color, ChartView.SeriesTypeLine)


        var arrow_name = createArrow(x_start - offset,  y_coord, false)

        var arr = [name, arrow_name]

        add_object(arr)
    }

    function createRailroad_Crossing(y_coord){


        const arr_top = [[x_start - offset, y_coord], [x_finish + offset, y_coord]]

        const arr_bottom = [[arr_top[0][0], y_coord + 3], [arr_top[1][0], y_coord + 3]]



        const arr_2 = [[ x_center , arr_top[0][1] ], [x_center, arr_bottom[1][1]] ]

        var name_1 =  createName("1_Line")

        createLine_Structure(arr_2, name_1,  Style.primaryDark_Color, ChartView.SeriesTypeLine)


        const arr_1 = [[ x_start - offset / 2 , arr_top[0][1] ], [x_start - offset / 2, arr_bottom[1][1]] ]

        var name_2 =  createName("2_Line")

        createLine_Structure(arr_1, name_2, Style.primaryDark_Color, ChartView.SeriesTypeLine)


        const arr_3 = [[ x_finish + offset / 2 , arr_top[0][1] ], [x_finish + offset / 2 , arr_bottom[1][1]] ]

        var name_3 =  createName("3_Line")

        createLine_Structure(arr_3, name_3, Style.primaryDark_Color, ChartView.SeriesTypeLine)



        var top_name =  createName("topLine")

        createLine_Structure(arr_top, top_name,  Style.warning_Color, ChartView.SeriesTypeLine)


        var bottom_name =  createName("bottomLine")

        createLine_Structure(arr_bottom, bottom_name,  Style.warning_Color, ChartView.SeriesTypeLine)


        var arr = [name_1, name_2, name_3, top_name, bottom_name]

        add_object(arr)

    }

    function createArrow(x_offset, y_offset, isRight){

        var a = offset / 4

        var b = arrow_y_offset / 2

        var side = "left"

        if(isRight){

            a *= -1
            b *= -1

            side = "right"
        }

        var name = createName("arrow" + side)

        const arrow_left = [[x_offset + a, y_offset - b], [x_offset, y_offset], [x_offset + a, y_offset + b]]


        createLine_Structure(arrow_left, name, Style.primaryDark_Color, ChartView.SeriesTypeLine)


        return name
    }



}
