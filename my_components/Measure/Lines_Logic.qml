import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

import Style 1.0

Item {

    function convert_x(x_value, isReal_X_to_Chart_X, min, max, x_start, x_finish, reverse){

      //  var max = measure_model[measure_model.length - 1]

       // var min = measure_model[0]

        var delta_value =  max - min

        var delta_x = x_finish - x_start

        var answer, percent

        if(!isReal_X_to_Chart_X){

            // В этом случае answer я знаю
          //  percent =  (100 * (answer - x_start)) / delta_x

            percent =  (100 * (x_value - x_start)) / delta_x

            answer = (percent * delta_value + 100 * min) / 100


        }
        else{

            percent = (x_value - min) * 100 / delta_value

            answer = ((delta_x * percent) / 100) + x_start
        }

        //console.log("answer = " , answer )

        if(reverse){

            console.log("\n")
            console.log("x_value = " , x_value  + " answer = " + answer + " x_start = " + x_start + " x_finish = " + x_finish)


            answer =  x_finish - (answer - x_start)
        }

        return answer
    }

    function change_series(color, style_line, id, isKmChart){

        var series

        if(!isKmChart){

            series = chartView.createSeries(ChartView.SeriesTypeLine, id, x_ValueAxis, y_ValueAxis)

        }
        else{

            series = km_ChartView.createSeries(ChartView.SeriesTypeLine, id, xKm_ValueAxis, yKm_ValueAxis)

        }

        series.color = color

        series.width = ui.line_width

        series.style =  style_line

        series.capStyle = Qt.DotLine

        series.joinStyle =  Qt.RoundJoin

        if(series.style === Qt.DotLine){

            series.opacity = measure_LineSeries.border_opacity //0.2

        }

        return series
    }

    function dropLine(y) {

        console.log("measure_LineSeries.count = " + measure_LineSeries.count + " y = " + y)

        var result = 0

        var multi = 1 / chartView.offset // 2


        var check_diff =  measure_LineSeries.count - y * multi

        var condition = y * multi

        if(check_diff < 0){

            condition = measure_LineSeries.count
        }

        for(var i = 0; i < condition; i++){  // (var i = 0; i < y * multi; i++

           measure_LineSeries.remove(0)

        }

        result = y

         /*if(measure_LineSeries.count >= y * multi){

           for(var i = 0; i < y * multi; i++){  // (var i = 0; i < y * multi; i++

               measure_LineSeries.remove(0)

            }

            result = y 8

        }
        else{

            toast.show("Нельзя удалить!", 3000, 1) // Показываем Тоcт
        } */

        if(chartView.series(border_arr[0]).count !== 0){

            for(var j = 0; j < border_arr.length; j++){

                chartView.series(border_arr[j]).remove(0)


            }
        }

        return result

        //measure_LineSeries.pointRemoved(10, 40)
    }

}
