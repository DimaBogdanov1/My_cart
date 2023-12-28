import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

import Style 1.0


// Основная Линия
LineSeries {
    id: measure_LineSeries
    color: "#F68160" //Style.accent_Color E9FAA7 B9B2F9
    axisX: x_ValueAxis
    axisY: y_ValueAxis
  //  axisXTop: x_ValueAxis
   // axisYRight: y_ValueAxis
    width: ui.line_width
    useOpenGL: true
   // XYPoint { x: 10; y: 0 }
   // XYPoint { x: 10; y: 10 }

    property var border_arr: [] // Список Для Хранения Id Линий Границ

    property var model: []

    property var no_values_model: [-90]

    property int line_name

   // property int count

    property real x_start

    property real x_finish

    property var realValue_arr: []


    property real border_opacity: 0.2


    onClicked: {

        // var point = measure_LineSeries.at(0);

       // console.log(point.x, point.y)

        // console.log("onClicked: " +  measure_LineSeries)

        console.log("onClicked: " + point.x + ", " + point.y);

    }

    onPointAdded: {
      //  var point = measure_LineSeries.at(index);
        //console.log("новая точка " + point.x, point.y)
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


    // Добавляем Точку Для Линии Основной Линии
    function addPoint(x, y, value) {

        realValue_arr.push(value)
        
        measure_LineSeries.append(x, y)

        // add_point_border(y)

      /*  if(chart_anim.checkScroll){

            return value.toFixed(2)

        }
        else{ // Здесь Будет Значение Визера

         //   return 0

        }

        return value.toFixed(2) */

    }

    function test_function(){

        for(var i = 0; i < model.length; i++){

            var name = line_name + "border_" + i

            create_Line(model[i], 0, model[i], 1000, Style.primaryDark_Color, Qt.DotLine, name) // Создаём Границу

            border_arr.push(name)

        }
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

//       create_middleLine(x_start + 2) // Сейчас Здесь Потом Перенесу

      create_db_Line(x_start + 6) // Сейчас Здесь Потом Перенесу
    }


    function create_Line(x_start, y_start, x_finish, y_finish, color, style, id){

        var series = change_series(color, style, id)

        series.append(x_start, y_start);

        series.append(x_finish, y_finish);

    }


    // Создание Средней Линии Графика
   function create_middleLine(x_start){

       var series = change_series(Style.secondaryAccent_Color, Qt.SolidLine, "middle_line")

       series.append(x_start, 0);

       series.append(x_start, 60);

   }

   // Создание Линии Из Базы Данных
  function create_db_Line(x_start){

      // FF747A - for error ?

      var series = change_series("#7BBBFF", Qt.SolidLine, "db_line") // #E17259"

      series.append(x_start, 0);

      series.append(x_start, 80);

  }

   // Функция Для Изменения Серии
   function change_series(color, style_line, id){

       var series = chartView.createSeries(ChartView.SeriesTypeLine, id, x_ValueAxis, y_ValueAxis)

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

