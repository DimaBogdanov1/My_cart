import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0

import my_components 1.0

Item {
    property bool tmp_check


    function updatePointPosition(){
        if(tmp_check){

            //var p = chartView.mapToPosition(  chartView.series("middle_struct").at(0),  chartView.series("left_rail") );
            //txt.x = p.x;
           // txt.y = p.y;


            for(var i = 0; i < kmLines_arr.length; i++){

                var e = chartView.mapToPosition(  chartView.series(kmLines_arr[i][0]).at(1),  chartView.series(kmLines_arr[i][0]) );

                kmLines_arr[i][1].x = e.x - kmLines_arr[i][1].width / 2

                kmLines_arr[i][1].y = e.y - kmLines_arr[i][1].height / 2


                //txt.x = e.x;
                //txt.y = e.y;
            }

            for(var j = 0; j < pickets_arr.length; j++){

                var r = chartView.mapToPosition(  chartView.series(pickets_arr[j][0]).at(1),  chartView.series(pickets_arr[j][0]) );

                pickets_arr[j][1].x = r.x - pickets_arr[j][1].width / 2

               pickets_arr[j][1].y = r.y - pickets_arr[j][1].height / 2


            }

        }
        else{

            measure_Rails.createRails()

            new_km_start = 0

            create_KmLine(4, "256", false, 0)


        }


    }

    function help_createKmLine(name, y_value, y_label, text){

        var tmp_y_offset = 5

        var name_line = name + kmLines_arr.length

        var km_line = [[x_center, y_value - tmp_y_offset] , [x_center, y_value - tmp_y_offset]]

        measure_Objects.createLine_Structure(km_line, name_line,  "blue", ChartView.SeriesTypeLine)      //(0, y_coord, x_ValueAxis.max, y_coord, Style.accentLight_Color, Qt.DotLine, "km_1") // Создаём Линию Километра (Дефекта)

        createKm_Label(y_label - tmp_y_offset, text, chartView.series(name_line).at(1), chartView.series(name_line), name_line)

    }

    // Функция Для Отображения Линии Километра
    function create_KmLine(values, km_text, needFirst, sleepers_Type){

       // const step_picket = 10

       // values -= 2

       // console.log("Зашли в create_KmLine " + " " + values + " ")

        var y_finish = step_picket * values

        var y_value = y_finish + new_km_start


        var km_line = [[0, y_value], [x_ValueAxis.max, y_value]]

        var name = "kmLine" + kmLines_arr.length


        measure_Objects.createLine_Structure(km_line, name,  "#BEBDFD", ChartView.SeriesTypeLine)

        if(needFirst){

            help_createKmLine("km_top_line", new_km_start , y_finish , km_text)

            measure_Rails.createSleepers(new_km_start - step_picket, y_value, sleepers_Type)

        }
        else{

            measure_Rails.createSleepers(new_km_start  , y_value, sleepers_Type)

        }

        help_createKmLine("km_bottom_line",  y_value  , y_finish, km_text)


    /*   const tmp_offset_mes  = 1 ///  0.5

        var border_3 = [[x_max + tmp_offset_mes, 0], [x_max + tmp_offset_mes, y_ValueAxis.max]]

        measure_Objects.createLine_Structure(border_3, "border_2",  "red" , ChartView.SeriesTypeLine)

        */


        create_KmMeasure(values, new_km_start)

        console.log("sleepers_Type = " + sleepers_Type + " y_value = " + y_value)


        new_km_start += (values + 1) * step_picket

    }

    function create_KmMeasure(value, y_start){

        const size_mes = 0.6

        const size_y = 10 // Растояние по у

        const picket_start = 2 // Пикеты начинаются с 2


        for(var i = 0; i < value; i += 1){  //for(var i = value; i > 0; i -= 1){

            console.log("i = " + i)

            var name = "mes" + pickets_arr.length + i

        //    var arr = [ [x_max + tmp_offset_mes , ((i -value) * size_y) + y_start] , [x_max + tmp_offset_mes -size_mes, ((i -value) * size_y) + y_start]]

        var arr = [ [x_max + tmp_offset_mes , (i * size_y) + y_start] , [x_max + tmp_offset_mes -size_mes, (i * size_y) + y_start]]

            measure_Objects.createLine_Structure(arr, name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

            create_Mesure(chartView.series(name).at(1), chartView.series(name) , name, i  + picket_start)
        }

    }

    function create_Mesure(series, line, name, title){

        var p = chartView.mapToPosition(series, line);

        var component = Qt.createComponent("qrc:/my_components/Elements/Custom_Rectangle_Label.qml")

        var mesLabel = component.createObject(parent,{"x":p.x ,"y":p.y })

        //picket.id = name

       // picket.anchors.left = parent.left

        //picket.anchors.right = parent.right

        mesLabel.text = title

        mesLabel.color = Style.background_Color //Style.secondaryAccent_Color //"red"

//        mesLabel.width = 10 //15

       // mesLabel.height = 10 //15

     //   mesLabel.needBack = false


        //mesLabel.margin_text = 7

        //picket.margin_text = 24

        mesLabel.x  -= mesLabel.width / 2

        mesLabel.y -=  mesLabel.height / 2

        //kmLabel.needBorder = true


        var arr = [name, mesLabel]

        pickets_arr.push(arr)
    }


    function createKm_Label(y_coord, title, series, line, name){
       // var name = "picket" + pickets_arr.length

//        var p = chartView.mapToPosition(Qt.point(x_start + width_Line / 2 , y_coord), name);

        var p = chartView.mapToPosition(series, line);

        var component = Qt.createComponent("qrc:/my_components/Elements/Custom_Rectangle_Label.qml")

        var kmLabel = component.createObject(parent,{"x":p.x ,"y":p.y })

       // pickets_arr.push(kmLabel)

        //picket.id = name

       // picket.anchors.left = parent.left

        //picket.anchors.right = parent.right

        kmLabel.text = title

        kmLabel.margin_text = 16 //16 // 32

       // picket.margin_text = 24
        kmLabel.x -= kmLabel.width / 2

        kmLabel.y -= kmLabel.height / 2

        kmLabel.needBorder = true


        var arr = [name, kmLabel]


        kmLines_arr.push(arr)


       // picket.width = 100

        //picket.height = 48

    }

}
