import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0

import my_components 1.0

Item {

    readonly property string left_name: "left_rail"

    readonly property string right_name: "right_rail"

    readonly property string mesLine_name: "measure_rail"

    enum Sleepers_Type {
           Left_Sleepers,
           Right_Sleepers,
           Triple_Sleepers
       }

    function createSleepers(y_start, y_finish, sleepers_Type){

        chartView.series(left_name).append(x_start, y_finish)

        chartView.series(right_name).append(x_finish, y_finish)

        chartView.series(mesLine_name).append(x_max + tmp_offset_mes, y_finish)

        switch(sleepers_Type){

        case Measure_Rails.Sleepers_Type.Left_Sleepers:

            add_sleepers(y_start, y_finish, true)

            break

        case Measure_Rails.Sleepers_Type.Right_Sleepers:

            add_sleepers(y_start, y_finish, false)

            break

        case Measure_Rails.Sleepers_Type.Triple_Sleepers:

            add_triple(y_start, y_finish)

            break
        }


    }

    function add_triple(y_start, y_finish){

        const offset = 1

        const step = step_picket / 2

        for(var i = y_start; i < y_finish; i += step){

            var arr

            var center = step / 2

            for(var j = center - offset; j <= center + offset; j+= offset){

                arr = [ [x_start, i + j] , [x_finish, i + j ]]

                measure_Objects.createLine_Structure(arr, "sleeper" + i ,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

            }

           /* arr = [ [x_start, i + center - offset ] , [x_finish, i + center - offset ]]

            measure_Objects.createLine_Structure(arr, "sleeper" + i ,  "red", ChartView.SeriesTypeLine)


            arr = [ [x_start, i + center ] , [x_finish, i + center]]

            measure_Objects.createLine_Structure(arr, "sleeper" + i ,  "green", ChartView.SeriesTypeLine)


            arr = [ [x_start, i + center + offset] , [x_finish, i + center + offset]]

            measure_Objects.createLine_Structure(arr, "sleeper" + i ,  "blue", ChartView.SeriesTypeLine)

            */
        }
    }

    function add_sleepers(y_start, y_finish, isLeft){

        var left_border

        var right_border

        var miniLeft_border

        var miniRight_border

        if(isLeft){

           left_border = x_start - measure_Objects.offset / 2

            right_border = x_finish

            miniLeft_border = left_border

            miniRight_border = x_start
        }
        else{

            left_border = x_start

            right_border = x_finish + measure_Objects.offset / 2

            miniLeft_border = x_finish

            miniRight_border = right_border

        }

        var check = true

        for(var i = y_start; i < y_finish; i+= 2){

            var arr

            if(check){

                arr = [ [left_border, i] , [right_border, i]]

                check = false
            }
            else{

                arr = [ [miniLeft_border, i] , [miniRight_border, i]]

                check = true

            }


            measure_Objects.createLine_Structure(arr, "sleeper" + i ,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)


        }
    }

    function createRails(){

        const arr_left = [[x_start, 0], [x_start, 0]]

        const arr_right = [[x_start + width_Line, y_ValueAxis.min], [x_start + width_Line, 0]]

        measure_Objects.createLine_Structure(arr_left, left_name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        measure_Objects.createLine_Structure(arr_right, right_name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)


        const border_offset = [[x_max + tmp_offset_mes, 0], [x_max + tmp_offset_mes, 0]]

        measure_Objects.createLine_Structure(border_offset, mesLine_name, Style.secondaryAccent_Color, ChartView.SeriesTypeLine) //Style.secondaryAccent_Color

    }
}
