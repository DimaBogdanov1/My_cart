import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

import Style 1.0
import MyLang 1.0

// Основная Линия
LineSeries {
    id: measure_LineSeries
    color: Style.accent_Color
    axisX: x_ValueAxis
    axisY: y_ValueAxis
  //  axisXTop: x_ValueAxis
   // axisYRight: y_ValueAxis
    width: ui.line_width
    useOpenGL: true
   // XYPoint { x: 10; y: 0 }
   // XYPoint { x: 10; y: 10 }

    property var border_arr: [] // Список Для Хранения Id Линий Границ

    property int line_name

    property int count

    property real x_start

    property real x_finish

    property var realValue_arr: []

    onClicked: {

        var point = measure_LineSeries.at(0);

        console.log(point.x, point.y)

        // console.log("onClicked: " +  measure_LineSeries)

       // console.log("onClicked: " + point.x + ", " + point.y);

    }

    onPointAdded: {
      //  var point = measure_LineSeries.at(index);
        //console.log("новая точка " + point.x, point.y)
    }


    // Добавляем Точку Для Линии Основной Линии
    function addPoint(x, y, value) {

        realValue_arr.push(value)
        
        measure_LineSeries.append(x, y)

    }

    // Продлеваем Границу
    function add_point_border(){

        var step_x = 0

        console.log("sd", "sssssss " + border_arr.length)

        for(var i = 0; i < border_arr.length; i++){

            chartView.series(border_arr[i]).append(x_start + step_x, 60)

            step_x += (x_finish - x_start) / (count - 1)
        }
    }


    function get_value_by_y(index_point){

        var point = measure_LineSeries.at(index_point);

        console.log("Получившаяся точка = " + point.x, point.y)



       /* for(var i = 0; i < measure_LineSeries.count; i++){

            var last_point = measure_LineSeries.at(i);

            var next_point = measure_LineSeries.at(i + 1);

            if(last_point !== null && next_point !== null){

                console.log("last = " + last_point + " next =" + next_point)

                if(last_point.y < 70 && next_point.y > 70){


                }
            }

        } */

      /*  const excludeTypes = ["21"];
        const procedure_types_number = 21;

        console.log(excludeTypes.includes(procedure_types_number));

        const procedure_types_string = "21"; */

       // console.log(excludeTypes.includes(procedure_types_string));

        return 7
    }

    // Добавляем Линии Границы Параметра
    function create_BorderSeries(){

        var step_x = 0

        for(var i = 0; i < count; i++){

            var name = line_name + "border_" + i

            create_Line(x_start + step_x, 0, x_start + step_x, chartView.y_finish, Style.primaryDark_Color, Qt.DotLine, name) // Создаём Границу

            border_arr.push(name)

            step_x += (x_finish - x_start) / (count - 1)
        }

        create_middleLine(x_start + 2) // Сейчас Здесь Потом Перенесу

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

       series.append(x_start, chartView.y_finish);

   }

   // Создание Линии Из Базы Данных
  function create_db_Line(x_start){

      var series = change_series(Style.primary_Color, Qt.SolidLine, "db_line")

      series.append(x_start, 0);

      series.append(x_start, chartView.y_finish);

  }

   // Функция Для Изменения Серии
   function change_series(color, style_line, id){

       var series = chartView.createSeries(ChartView.SeriesTypeLine, id, x_ValueAxis, y_ValueAxis)

       series.color = color

       series.width = ui.line_width

       series.style =  style_line

       if(series.style === Qt.DotLine){

           series.opacity = 0.4

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

