import QtQuick 2.15
import QtCharts 2.15

import Style 1.0


Item {

    id: root_Item

    readonly property real offset: (x_start - x_min) / 2

    readonly property real arrow_offset: 1

    readonly property real arrow_y_offset: 2

    readonly property real dot_Size_Px: 4 //12 //10

    readonly property real offsetArrowLine: 2 // в PDF это 1 мм


    function createName(title){

        return title + km_Item.km_id + km_Item.objects_arr.length
    }

    function add_object(name_arr){

        km_Item.objects_arr.push(name_arr)

    }

    function drawPart_Object(arr, name, color){

        var new_name = createName(name)

        createLine_Structure(arr, new_name, color, ChartView.SeriesTypeLine)

        return new_name
    }

    function createLine_Structure(arr, id, color, type, isBorder, isLetter){

        var series = chartView.createSeries(type, id, x_ValueAxis, y_ValueAxis)

        series.color =  color


        if(type === ChartView.SeriesTypeScatter){

            series.markerSize = root_Item.dot_Size_Px

           // series.color =  Style.background_Color

            series.borderColor = Style.primaryDark_Color

        }

        if(isLetter){

            series.width = 1.5

        }
        else{

            series.width = ui.line_width

        }

        series.capStyle = Qt.RoundCap

        series.joinStyle = Qt.RoundJoin

        if(isBorder){

            series.style = Qt.DotLine

            series.opacity = level_MeasureLines.border_opacity //0.2

        }
        else{

            series.style =  Qt.SolidLine

        }


        for(var i = 0; i < arr.length; i++){

            series.append(arr[i][0], arr[i][1]);

        }
    }

    function createDoubleArrow_Structure(y_coord, isNeedChartLine, isNeedDot){


        var arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord]]

        var name =  createName("arrowSwitch")

        createLine_Structure(arr_middle, name,  Style.warning_Color, ChartView.SeriesTypeLine)



        var arrow_left_name = createArrow(x_start - offset, y_coord, false)


        var arrow_right_name = createArrow(x_finish + offset , y_coord, true)




        var y_topLine = y_coord - root_Item.offsetArrowLine

        var y_bottomLine = y_coord + 5




        var dop_names = createArrow_Stage2(y_coord, y_topLine, y_bottomLine, isNeedChartLine, isNeedDot)


        var arr = [name, arrow_left_name, arrow_right_name, dop_names[0], dop_names[1], dop_names[2], dop_names[3]]

        add_object(arr)
    }

    function createBorder_Structure(y_coord) {

        const circle_size = 0.1

        const arr_middle = [[x_start - offset / 2, y_coord], [x_finish + offset / 2, y_coord]]

        createLine_Structure(arr_middle, "middle_struct",  Style.warning_Color, ChartView.SeriesTypeLine)


        const point_left = [[x_start - offset, y_coord + circle_size]]

        createLine_Structure(point_left, "left_point", "", ChartView.SeriesTypeScatter)


        const point_right = [[x_finish + offset + circle_size , y_coord + circle_size]]

        createLine_Structure(point_right, "left_point", "", ChartView.SeriesTypeScatter)

    }


    function createKmPillar_Structure(y_coord) {

        const arr_line = [ [x_finish , y_coord ], [x_finish + offset , y_coord]]

        var name = createName("km_Pillar")

        createLine_Structure(arr_line, name,  Style.primaryDark_Color, ChartView.SeriesTypeLine)


        var arr = [name]

        add_object(arr)

    }


    function createKm_Mark_Structure(y_coord) {


        // chart_Rectangle.width - offset
        // chart_Rectangle.height - ?

        // chart_Rectangle.height * offset / chart_Rectangle.width

        var all_width = offset


        var y_offset = offset * chartView.coef       //  2.608 //chart_Rectangle.height * offset / chart_Rectangle.width //offset


        var x_left = x_start - offset // x_finish //+ offset / 4

        var x_right = x_left + offset

        var y_top = y_coord + y_offset / 2

        var y_bottom = y_coord - y_offset / 2

        var y_center = y_coord //y_bottom + (y_top - y_bottom) / 2




        var x_letter_left = x_left + offset / 3

        var x_letter_right = x_right - offset / 3

        var y_letter_top = y_top - y_offset / 3

        var y_letter_bottom = y_bottom + y_offset / 3


        var a = chart_Rectangle.width / chart_Rectangle.height



        //const arr_rect = [[x_left - offset / 4 , y_center ], [x_left, y_center ], [x_left , y_top ], [x_right , y_top ], [x_right , y_bottom], [x_left , y_bottom],  [x_left , y_top]]


        var name = drawPart_Object(
                                    [
                                        [x_left , y_top ],
                                        [x_right , y_top ],

                                        [x_right, y_center ],
                                        [x_right + offset / 4 , y_center ],
                                        [x_right, y_center ],

                                        [x_right , y_bottom],
                                        [x_left , y_bottom],
                                        [x_left , y_top],



                                    ],


                                    "km_Mark",  Style.warning_Color)


      //  var name = createName("km_Mark")

        //createLine_Structure(arr_rect, name,  Style.warning_Color, ChartView.SeriesTypeLine)





        const arr_k_p1 = [ [x_letter_left , y_letter_top ], [x_letter_left , y_letter_bottom]]

        var name_p1 = createName("km_Kp1")

        createLine_Structure(arr_k_p1, name_p1,  Style.primaryDark_Color, ChartView.SeriesTypeLine, false, true)


        const arr_k_p2 = [ [x_letter_right , y_letter_top ], [x_letter_left , y_center]]

        var name_p2 = createName("km_Kp2")

        createLine_Structure(arr_k_p2, name_p2,  Style.primaryDark_Color, ChartView.SeriesTypeLine, false, true)


        const arr_k_p3 = [ [x_letter_right , y_letter_bottom ], [x_letter_left , y_center]]

        var name_p3 = createName("km_Kp3")

        createLine_Structure(arr_k_p3, name_p3,  Style.primaryDark_Color, ChartView.SeriesTypeLine, false, true)



        var arr = [name, name_p1, name_p2, name_p3]

        add_object(arr)
    }

    function help_create_Isolated_Junction(x, y, height, isRight){

        var x_value

        if(isRight){

            x_value = x + offset / 2
        }
        else{

            x_value = x - offset / 2

        }

        var arr_top = [ [x , y + height / 2], [x_value, y + height / 2]]

        var top_name =  createName("iso_Top")

        createLine_Structure(arr_top, top_name, Style.warning_Color, ChartView.SeriesTypeLine)


        var arr_bottom = [ [x , y - height / 2], [x_value, y - height / 2]]

        var bottom_name = createName("iso_Bottom")

        createLine_Structure(arr_bottom, bottom_name, Style.warning_Color, ChartView.SeriesTypeLine)

        return [top_name, bottom_name]
    }


    function createIsolated_Junction_Structure(y_coord, isRight) {

        var height_value = 3

        var x_value

        var x_value_borders


        if(false){

            x_value = x_finish + offset / 2

            x_value_borders = x_value + offset / 4

        }
        else{

            x_value = x_start - offset / 2

            x_value_borders = x_value - offset / 4

        }


        var center_name = drawPart_Object(
                                    [ [x_value_borders, y_coord - height_value / 2 ], [x_value_borders, y_coord + height_value / 2]],

                                    "iso_Center",  Style.warning_Color)



        var centerMini_name = drawPart_Object(
                                    [ [x_value - offset / 4 , y_coord ], [x_value + offset / 4, y_coord]],

                                    "iso_miniCenter",  Style.warning_Color)






        var side_arr = help_create_Isolated_Junction(x_value, y_coord, height_value, isRight)

        var arr = [center_name, centerMini_name, side_arr[0], side_arr[1]]

        add_object(arr)

    }


    function createBridgeBranch(y_start, y_finish, isRight){

        var x_value

        var x_offset

        var name, bottom_name, top_name

        var all_distance = y_finish - y_start



        var y_start_border = y_start + 4

        var y_start_bridge = y_start_border + arrow_y_offset

        var y_finish_bridge = y_start_bridge +  (all_distance -  2 * (arrow_y_offset + 4))

        var y_finish_border  = y_finish_bridge + arrow_y_offset



        if(!isRight){

            x_value = x_start - offset / 2

            x_offset = x_value - offset / 2

            name = "left_struct"

            top_name = "top_left_struct"

            bottom_name =  "bottom_left_struct"
        }
        else{

            x_value = x_finish + offset / 2

            x_offset = x_value + offset / 2

            name =  "right_struct"

            top_name = "top_right_struct"

            bottom_name = "bottom_right_struct"

        }


        bottom_name = drawPart_Object(
                                  [ [x_offset, y_start], [x_offset, y_start_border] ],

                                    bottom_name,  Style.secondaryAccent_Color)


        name = drawPart_Object(
                                  [ [x_offset, y_start_border], [x_value, y_start_bridge], [x_value, y_finish_bridge], [x_offset, y_finish_border] ],

                                    name,  Style.warning_Color)


        top_name = drawPart_Object(
                                  [ [x_offset, y_finish_border], [x_offset, y_finish]  ],

                                    top_name,  Style.secondaryAccent_Color)

        return [bottom_name, name, top_name]

    }

    function createBridge_Structure(y_start, y_finish) {


        var left_branch = createBridgeBranch(y_start, y_finish, false)

        var right_branch = createBridgeBranch(y_start, y_finish, true)


        var arr = [left_branch[0], left_branch[1], left_branch[2],  right_branch[0], right_branch[1], right_branch[2]]

        add_object(arr)

    }

    function createArrow_Stage2(y_coord, y_topLine, y_bottomLine, isNeedChartLine, isNeedDot){

        var borer_name

        var border_2_name

        var dot_name

        var line_name =  createName("arrowLine_sensor")



        line_name = drawPart_Object(
                                  [[x_center, y_topLine],  [x_center, y_bottomLine]],

                                    "arrowLine_sensor",  Style.warning_Color)


        // По y 1мм на Pdf
      //  const arr_line = [[x_center, y_topLine],  [x_center, y_bottomLine]]

        //createLine_Structure(arr_line, line_name,  Style.warning_Color, ChartView.SeriesTypeLine)



        if(isNeedChartLine){

            border_2_name =  createName("arrowBorder2_sensor")



            borer_name = drawPart_Object(
                                      [[x_min, y_bottomLine],  [x_max + tmp_offset_mes, y_bottomLine]],

                                        "arrowBorder_sensor",  Style.secondaryAccent_Color)


            const border_line_2 = [[x_max + tmp_offset_mes, y_bottomLine],  [x_ValueAxis.max, y_bottomLine]]

            createLine_Structure(border_line_2, border_2_name,  Style.primaryDark_Color, ChartView.SeriesTypeLine, true)

        }


        if(isNeedDot){

            dot_name =  createName("arrow_dot")

            var fault_x = 0.06 //root_Item.dot_Size_Px * 0.05 / 12

            var fault_y = 0.192 //root_Item.dot_Size_Px * 0.2 / 12

            var dot = [[x_center + fault_x , y_coord - fault_y]]

            createLine_Structure(dot, dot_name,  Style.primaryDark_Color, ChartView.SeriesTypeScatter)


          /*  var a = 1
            var tmp_arr = [[x_center - 1, y_coord + a], [x_center + 1, y_coord + a]]

            var tmp_arr2 = [[x_center - 1, y_coord - a], [x_center + 1, y_coord - a]]


            var tmp_arr3 = [[x_center - a / 2, y_coord - 1], [x_center - a /2, y_coord + 1]]

            var tmp_arr4 = [[x_center + a / 2, y_coord - 1], [x_center + a /2, y_coord + 1]]


            createLine_Structure(tmp_arr, name,  "red", ChartView.SeriesTypeLine)

            createLine_Structure(tmp_arr2, name,  "red", ChartView.SeriesTypeLine)

            createLine_Structure(tmp_arr3, name,  "red", ChartView.SeriesTypeLine)

            createLine_Structure(tmp_arr4, name,  "red", ChartView.SeriesTypeLine) */

        }

        return [line_name, borer_name, border_2_name, dot_name]

    }

    function createArrow_Structure(y_coord, index_position, isNeedChartLine, isNeedDot){

        //var name =  createName("arrow_sensor")


        var arrow_Start = x_start - offset

        var lineStart = x_start - offset / 2

        var lineMiddle = x_finish + offset / 2

        var lineFinish = x_finish + offset

        var y_Finish = y_coord - arrow_y_offset



        var isRight_arrow = true


        var y_topLine = y_coord - root_Item.offsetArrowLine

        var y_bottomLine = y_coord + 5

        //var y_border = y_bottomLine



        var left, top


        switch(index_position){

        case 0:

            left = true

            top = true

            break

        case 1: // Bottom_right в Pdf

            left = true

            top = false

            break

        case 2:

            left = false

            top = true

            break

        case 3:

            left = false

            top = false

            break
        }


        if(!left){

            arrow_Start = x_finish + offset

            lineStart = x_finish + offset / 2

            lineMiddle = x_start - offset / 2

            lineFinish = x_start - offset
        }
        else{

            isRight_arrow = false

        }

        if(top){

            y_Finish = y_coord + arrow_y_offset

            y_topLine = y_coord + root_Item.offsetArrowLine

            y_bottomLine = y_coord - 5
        }


        var arrow_name = createArrow(arrow_Start,  y_coord, isRight_arrow)




        var name = drawPart_Object(
                                  [[lineStart, y_coord], [lineMiddle, y_coord], [lineFinish  , y_Finish]],

                                    "arrow_sensor",  Style.warning_Color)


        var dop_names = createArrow_Stage2(y_coord, y_topLine, y_bottomLine, isNeedChartLine, isNeedDot)

        var arr = [name, arrow_name, dop_names[0], dop_names[1], dop_names[2], dop_names[3]]

        add_object(arr)
    }

    function createRailroad_Crossing(y_coord){


        const arr_top = [[x_start - offset, y_coord], [x_finish + offset, y_coord]]

        const arr_bottom = [[arr_top[0][0], y_coord + 3], [arr_top[1][0], y_coord + 3]]



        const arr_2 = [[ x_center , arr_top[0][1] ], [x_center, arr_bottom[1][1]] ]



        var name_1 = drawPart_Object(
                                  [[ x_center , arr_top[0][1] ], [x_center, arr_bottom[1][1]] ],

                                    "1_Line",  Style.primaryDark_Color)


        var name_2 = drawPart_Object(
                                  [[ x_start - offset / 2 , arr_top[0][1] ], [x_start - offset / 2, arr_bottom[1][1]] ],

                                    "2_Line",  Style.primaryDark_Color)


        var name_3 = drawPart_Object(
                                  [[ x_finish + offset / 2 , arr_top[0][1] ], [x_finish + offset / 2 , arr_bottom[1][1]] ],

                                    "3_Line",  Style.primaryDark_Color)


        var top_name = drawPart_Object(
                                  arr_top,

                                    "topLine",  Style.warning_Color)



        var bottom_name = drawPart_Object(
                                  arr_bottom,

                                    "bottomLine",  Style.warning_Color)



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

        var name = drawPart_Object(
                                  [[x_offset + a, y_offset - b], [x_offset, y_offset], [x_offset + a, y_offset + b]],

                                    "arrow" + side,  Style.primaryDark_Color)


        return name
    }



}
