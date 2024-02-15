import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15
import qml.measure 1.0

import Style 1.0


// Основная Линия
Basic_Line {
    id: measure_LineSeries
    color: "#F68160" //"#F68160" //Style.accent_Color E9FAA7 B9B2F9

    Component.onCompleted: {

       // ChartPoints_Model.

        if(line_name == Name_Measures.Level_Measure){

            mapper.series = measure_LineSeries

        }


        //console.log( ChartPoints_Model.line_Path[0].x)

        //console.log( lineModel.rowCount())

    }

   // XYPoint { x: 10; y: 0 }
   // XYPoint { x: 10; y: 10 }

    property var border_arr: [] // Список Для Хранения Id Линий Границ

    property var backLine_arr: []

    property var model: []

    property var no_values_model: [-90]

    property int line_name

   // property int count



    property var realValue_arr: []


    property real border_opacity: 0.2

    property bool lastMove


    Lines_Logic{
        id: lines_Logic
    }



    function get_x_viser(y_viser){

        var answer = 0;

        var a = (y_viser % chartView.offset).toFixed(2)

        console.log("y_viser = " + y_viser.toFixed(2))

        console.log("Остаток от деления " + a)


        var b_1 = (y_viser - a).toFixed(1)

        var c = (y_viser + chartView.offset - a).toFixed(1)

        console.log("Нижняя точка " + b_1 )

        console.log("Верхняя точка " + c)

        var d = (b_1 - chartView.drop_value) / chartView.offset


        var x1 = measure_LineSeries.at(d).x.toFixed(1)

        var y1 = measure_LineSeries.at(d).y.toFixed(1)

        console.log("Индекс нижней точки " + d )

        console.log("Нижняя точка x = " + x1 + " y = " + y1)


        var e = c / chartView.offset


        var x2 = measure_LineSeries.at(e).x.toFixed(1)

        var y2 =  measure_LineSeries.at(e).y.toFixed(1)

        console.log("Индекс верхней точки " + e )

        console.log("Верхняя точка x = " + x2  + " y = " + y2)

        var k = 0

        var b  = 0

        if((x1 - x2) == 0){ // k = 0 Линия Прямая y = b

            k = 0;

           answer = x1;

        }
        else{

            k = (y2 - y1) / (x2  - x1)

            b = y1 - k * x1


          //  y_viser = kx + b

          //  kx = y_viser - b

            answer =  (y_viser - b) / k
        }

      //  console.log(" k = " +  k)

      //  console.log("b = " + b)

      //  console.log("answer = " + answer)


        return answer

    }

    function dropLine(y) {

        return lines_Logic.dropLine(y)
    }

    function test_add_function(x, y, value, isForward){

        if(isForward){

           // console.log("qqqqqqqqqqqqqqq ")

            ChartPoints_Model.addNewPoint(Qt.point(x, y))

        }
        else{

            console.log("не добавляем точки")

            var name = line_name + "back_line_" + backLine_arr.length

            if(lastMove !== isForward){

                var series = lines_Logic.change_series("#7BBBFF", Qt.SolidLine, name)

                backLine_arr.push(name)
            }


            console.log("rowCount() = " + ChartPoints_Model.rowCount())
            if(ChartPoints_Model.rowCount() !== 0){

                ChartPoints_Model.removeLastPoint()

                chartView.series(backLine_arr[backLine_arr.length - 1]).append(measure_LineSeries.at(measure_LineSeries.count - 1).x , measure_LineSeries.at(measure_LineSeries.count - 1).y)

            }
            else{

                if(chartView.series(backLine_arr[backLine_arr.length - 1]).count === 0){

                    var series2 = lines_Logic.change_series("#7BBBFF", Qt.SolidLine, name)

                    backLine_arr.push(name)

                }

                chartView.series(backLine_arr[backLine_arr.length - 1]).append(x ,y)


            }

            console.log("after rowCount() = " + ChartPoints_Model.rowCount())


            //console.log("measure_LineSeries.model.length == " + measure_LineSeries.count)



          //  chartView.series(backLine_arr[backLine_arr.length - 1]).append(x, y)


            //series.append(x, y);

        }

        lastMove = isForward

        console.log("Количсетво точек = " + ChartPoints_Model.rowCount())

        //        var series = change_series(color, style, id)

//        series.append(x_start, y_start);

        //

        // add_point_border(y)

      /*  if(chart_anim.checkScroll){

            return value.toFixed(2)

        }
        else{ // Здесь Будет Значение Визера

         //   return 0

        }

        return value.toFixed(2) */
    }

    // Добавляем Точку Для Линии Основной Линии
    function addPoint(x, y, value, isForward) {

        //realValue_arr.push(value)
        
        if(isForward){

            measure_LineSeries.append(x, y)

        }
        else{

            console.log("не добавляем точки")

            var name = line_name + "back_line_" + backLine_arr.length

            if(lastMove !== isForward){

                var series = lines_Logic.change_series("#7BBBFF", Qt.SolidLine, name)

                backLine_arr.push(name)
            }


            if(measure_LineSeries.count != 0){

                measure_LineSeries.remove(measure_LineSeries.count - 1)

                chartView.series(backLine_arr[backLine_arr.length - 1]).append(measure_LineSeries.at(measure_LineSeries.count - 1).x , measure_LineSeries.at(measure_LineSeries.count - 1).y)

            }
            else{

                if(chartView.series(backLine_arr[backLine_arr.length - 1]).count === 0){

                    var series2 = lines_Logic.change_series("#7BBBFF", Qt.SolidLine, name)

                    backLine_arr.push(name)

                }

                chartView.series(backLine_arr[backLine_arr.length - 1]).append(x ,y)


            }

            console.log("measure_LineSeries.model.length == " + measure_LineSeries.count)



          //  chartView.series(backLine_arr[backLine_arr.length - 1]).append(x, y)


            //series.append(x, y);

        }

        lastMove = isForward

        //        var series = change_series(color, style, id)

//        series.append(x_start, y_start);

        //

        // add_point_border(y)

      /*  if(chart_anim.checkScroll){

            return value.toFixed(2)

        }
        else{ // Здесь Будет Значение Визера

         //   return 0

        }

        return value.toFixed(2) */

    }


    // Продлеваем Границу
    function add_point_border(y_value){

        for(var i = 0; i < border_arr.length; i++){

            chartView.series(border_arr[i]).append(model[i], y_value)
        }
    }


    function change_visible_borders(value){

        for(var i = 0; i < border_arr.length; i++){

            chartView.series(border_arr[i]).visible = value

        }

    }

    // Добавляем Линии Границы Параметра
    function create_BorderSeries(){

      //  var step_x = 0

        for(var i = 0; i < model.length; i++){

          //  console.log(model[i])

            var name = line_name + "border_" + i

            create_Line(model[i], 0, model[i], 40, Style.primaryDark_Color, Qt.DotLine, name) // Создаём Границу

            border_arr.push(name)


           // step_x += (x_finish - x_start) / (count - 1)
        }

       // add_point_border(40)

       // add_point_border(60)

    //    test_function()

      create_middleLine(x_start + 2) // Сейчас Здесь Потом Перенесу

      create_db_Line(x_start + 6) // Сейчас Здесь Потом Перенесу
    }


    function create_Line(x_start, y_start, x_finish, y_finish, color, style, id){

        var series = lines_Logic.change_series(color, style, id)

        series.append(x_start, y_start);

        series.append(x_finish, y_finish);

    }


    // Создание Средней Линии Графика
   function create_middleLine(x_start){

       var series = lines_Logic.change_series(Style.secondaryAccent_Color, Qt.SolidLine, "middle_line")

       series.append(x_start, 0);

       series.append(x_start, 60);

   }

   // Создание Линии Из Базы Данных
  function create_db_Line(x_start){

      // FF747A - for error ?

      var series = lines_Logic.change_series("#7BBBFF", Qt.SolidLine, "db_line") // #E17259"

      series.append(x_start, 0);

      series.append(x_start, 80);

  }


  // Функция Для Добавления Зоны (Нарушения Выше 2 Уровня)
   function add_area(x_start, y_start, x_finish, y_finish){

       var series = chartView.createSeries(ChartView.SeriesTypeArea, "id", x_ValueAxis, y_ValueAxis)

       series.color = Style.accent_Color

       series.opacity = 0.5

       var upperSeries = Qt.createQmlObject('import QtCharts 2.15; LineSeries {}', series, "s");

       var lowerSeries = Qt.createQmlObject('import QtCharts 2.15; LineSeries {}', series, "s3");

       lowerSeries.append(x_start, y_start);

       lowerSeries.append(x_start, y_finish);


       upperSeries.append(x_finish, y_start);

        upperSeries.append(x_finish, y_finish);


       series.upperSeries = upperSeries

       series.lowerSeries = lowerSeries

   }


}

