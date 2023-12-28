import QtQuick 2.15
import QtCharts 2.15

import Style 1.0


import my_components 1.0

Item {

    readonly property string left_name: "left_rail"

    readonly property string right_name: "right_rail"

    readonly property string mesLine_name: "measure_rail"

    readonly property string sleeper_name: "sleeper"

    readonly property string mes_name: "mes"

    readonly property string first_kmLine_name: "kmLine_startLine"


    enum Sleepers_Type { // сейчас это копипаст, но птом это будет из базы данных
           Wood,
           Reinforced_Concrete,
           Before_1996
       }

    function createSleepers(y_start, y_finish, sleepers_Type){

        chartView.series(left_name).append(x_start, y_finish)

        chartView.series(right_name).append(x_finish, y_finish)

        chartView.series(mesLine_name).append(x_max + tmp_offset_mes, y_finish)


        const offset = 1

        const step = step_picket / 2

        const center = step / 2


        var startCycle

        var breakCycle

        var countCycle


        switch(sleepers_Type){

        case Measure_Rails.Sleepers_Type.Wood:

            startCycle = center

            breakCycle = center

            countCycle = 1

            break

        case Measure_Rails.Sleepers_Type.Reinforced_Concrete:

            startCycle = center - offset

            breakCycle = center + offset

            countCycle = 2 * offset

            break

        case Measure_Rails.Sleepers_Type.Before_1996:

            startCycle = center - offset

            breakCycle = center + offset

            countCycle = offset

            break
        }


        for(var i = 0; i < y_finish - y_start; i += step){  // var i = y_start; i < y_finish; i += step

            var arr

            var new_slepper = y_start + i

            // j = center - offset
            for(var j = startCycle ; j <= breakCycle ; j+=  countCycle){ // j+=  2 * offset - 2палки ;   j+=  offset - 3палки

                arr = [ [x_start, new_slepper + j] , [x_finish, new_slepper + j ]]

                var name = sleeper_name + km_Item.km_id + (i + j)

                km_Item.sleepers_arr.push(name)

                measure_Objects.createLine_Structure(arr, name ,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)
            }

        }

    }

     function dropRails() {

        // console.log("km_item_arr[0].sleepers_arr.length = " + km_item_arr[0].sleepers_arr.length)

         //var y_count = 0

          if(km_item_arr.length > 0){

               chartView.series(left_name).remove(0)

               chartView.series(right_name).remove(0)

               chartView.series(mesLine_name).remove(0)


              if(km_item_arr[0].km_id === 0){

                  chartView.removeSeries(chartView.series(first_kmLine_name) )

              }


              for(var i = 0; i < km_item_arr[0].sleepers_arr.length; i++){

                 chartView.removeSeries(chartView.series(km_item_arr[0].sleepers_arr[i]) )
              }

              for(var j = 0; j < km_item_arr[0].kmLines_arr.length; j++){

                  chartView.removeSeries(chartView.series(km_item_arr[0].kmLines_arr[j][0]))

                  km_item_arr[0].kmLines_arr[j][1].destroy()

              }

              for(var k = 0; k < km_item_arr[0].pickets_arr.length; k++){

                  chartView.removeSeries(chartView.series( km_item_arr[0].pickets_arr[k][0]))

                  km_item_arr[0].pickets_arr[k][1].destroy()

              }

              chartView.removeSeries(chartView.series(km_item_arr[0].km_Finish_Line) )

              //y_count = km_item_arr[0].distance

              for(var r = 0; r < km_item_arr[0].objects_arr.length; r++){

                  for(var t = 0; t < km_item_arr[0].objects_arr[r].length; t++){

                      chartView.removeSeries(chartView.series( km_item_arr[0].objects_arr[r][t]))

                  }


              }


              km_item_arr.shift()

             /* if(km_item_arr.length > 0){

                  km_item_arr.shift()

              } */

             // console.log("check km_item_arr.length = " + km_item_arr.length)
          }


          return km_item_arr[0].distance

     }



    function create_Riht(y_start, y_finish, isLeft){

        //console.log("km_count = " + km_count)

        var left_border

        var right_border

        var miniLeft_border

        var miniRight_border

        if(isLeft){

         //  left_border = x_start - measure_Objects.offset / 2

          //  right_border = x_finish

            miniLeft_border =  x_start - measure_Objects.offset / 2  //left_border

            miniRight_border = x_start
        }
        else{

         //   left_border = x_start

         //   right_border = x_finish + measure_Objects.offset / 2

            miniLeft_border = x_finish

            miniRight_border = x_finish + measure_Objects.offset / 2 //right_border

        }

        var check = true

        var tm_c = 0

      //  km_Item.y_start = y_start

      //  km_Item.y_finish = y_finish

        console.log("y_start = " + y_start)

        console.log("y_finish = " + y_finish)

        for(var i = 0; i < y_finish - y_start; i+= 2){ // var i = y_start; i < y_finish; i+= 2

            var arr

            var new_slepper = y_start + i

            arr = [ [miniLeft_border, new_slepper] , [miniRight_border, new_slepper]]


          /*  if(check){

                arr = [] // [ [left_border, new_slepper] , [right_border, new_slepper]]  //  arr = [ [left_border, i] , [right_border, i]]

                check = false
            }
            else{

                arr = [ [miniLeft_border, new_slepper] , [miniRight_border, new_slepper]]

                check = true

            } */


            measure_Objects.createLine_Structure(arr, sleeper_name + km_Item.km_id +  i ,   Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

          //  console.log("name  = " + sleeper_name + km_Item.km_id +  i)

           // console.log("sdssd = " + i)

            km_Item.sleepers_arr.push(sleeper_name + km_Item.km_id +  i)

            tm_c++

        }
    }

    function createRails(){

        const arr_left = [[x_start, 0]]

        const arr_right = [[x_start + width_Line, y_ValueAxis.min]]

        measure_Objects.createLine_Structure(arr_left, left_name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        measure_Objects.createLine_Structure(arr_right, right_name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)


        const border_offset = [[x_max + tmp_offset_mes, 0]]

        measure_Objects.createLine_Structure(border_offset, mesLine_name, Style.secondaryAccent_Color, ChartView.SeriesTypeLine) //Style.secondaryAccent_Color

    }
}
