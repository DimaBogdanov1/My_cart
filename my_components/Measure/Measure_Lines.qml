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


    // Добавляем Точку Для Линии Основной Линии
    function addPoint(x, y) {

        measure_LineSeries.append(x, y)

    }

    // Продлеваем Границу
    function add_point_border(){

        var step_x = 0

        console.log("sd", "sssssss " + border_arr.length)

        for(var i = 0; i < border_arr.length; i++){

            chartView.series(border_arr[i]).append(x_start + step_x, 60)

            step_x += (x_finish - x_start) / count
        }
    }



    // Добавляем Линии Границы Параметра
    function create_BorderSeries(){

        var step_x = 0

        for(var i = 0; i < count; i++){

            var name = line_name + "border_" + i

            create_Line(x_start + step_x, 0, x_start + step_x, chartView.y_finish, Style.accentLight_Color, Qt.DotLine, name) // Создаём Границу

            border_arr.push(name)

            step_x += (x_finish - x_start) / count
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

       chartView.createSeries(chartView.Seri)

       series.color = color

       series.width = ui.line_width

       series.style =  style_line

       return series
   }


}

