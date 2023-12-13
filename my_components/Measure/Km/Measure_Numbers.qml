import QtQuick 2.15
import QtCharts 2.15

import Style 1.0


import my_components 1.0

Item {
    property bool tmp_check

    property bool tmp_tmp_check


    function updatePointPosition(){

        if(tmp_check){

            for(var i = 0; i < km_item_arr.length; i++){  // i < kmLines_arr.length

                for(var k = 0; k < km_item_arr[i].kmLines_arr.length; k++){

                    var e = chartView.mapToPosition(  chartView.series(km_item_arr[i].kmLines_arr[k][0]).at(1),  chartView.series(km_item_arr[i].kmLines_arr[k][1]) );

                    km_item_arr[i].kmLines_arr[k][1].x = e.x - km_item_arr[i].kmLines_arr[k][1].width / 2

                    km_item_arr[i].kmLines_arr[k][1].y = e.y - km_item_arr[i].kmLines_arr[k][1].height / 2

                }

                for(var j = 0; j < km_item_arr[i].pickets_arr.length; j++){  // km_item_arr[i].kmLines_arr.length   // pickets_arr.length

                    var r = chartView.mapToPosition(  chartView.series(km_item_arr[i].pickets_arr[j][0]).at(1),  chartView.series(km_item_arr[i].pickets_arr[j][1]) );

                    km_item_arr[i].pickets_arr[j][1].x =  r.x - km_item_arr[i].pickets_arr[j][1].width / 2

                    km_item_arr[i].pickets_arr[j][1].y =  r.y - km_item_arr[i].pickets_arr[j][1].height / 2

                }

            }

        }
        else{

            if(!tmp_tmp_check){

                measure_Rails.createRails()

                measure_Km.create_KmLine(4, "256", false, 0, false)

                //  create_KmLine(4, "256", false, 0, false)

               // km_item_arr.push(km_Item)

               // new_km_start = 0

                tmp_tmp_check = true
            }

        //    measure_Rails.createRails()

        //    new_km_start = 0

          //  create_KmLine(4, "256", false, 0, false)


        }


    }

    function help_createKmLine(name, y_value, y_label, text){

        var tmp_y_offset = 5

        var name_line = "name"  + km_Item.km_id +  km_Item.kmLines_arr.length  //+ dd

     //   var km_line = [[x_center, y_value - tmp_y_offset] , [x_center, y_value - tmp_y_offset]]

        var km_line = [[x_center, y_value - tmp_y_offset], [x_center, y_value - tmp_y_offset] ] // [30, y_value - tmp_y_offset]

        measure_Objects.createLine_Structure(km_line, name_line,  "blue", ChartView.SeriesTypeLine)      //(0, y_coord, x_ValueAxis.max, y_coord, Style.accentLight_Color, Qt.DotLine, "km_1") // Создаём Линию Километра (Дефекта)


      //  console.log("input name_line = " + name_line)

        createKm_Label(y_label - tmp_y_offset, text, chartView.series(name_line).at(1), chartView.series(name_line), name_line)


    }

    // Функция Для Отображения Линии Километра
    function create_KmLine(values, km_text, needFirst, sleepers_Type, isReverse){

       // const step_picket = 10

       // values -= 2

       // console.log("Зашли в create_KmLine isReverse " + " " + isReverse + " ")

        var y_finish = step_picket * values

        var y_value = y_finish + new_km_start

        if(km_item_arr.length > 0){

            km_Item.y_count = y_finish + step_picket
        }
        else{

            km_Item.y_count = y_finish

        }


        console.log("km_Item.y_count = " + km_Item.y_count )

        var km_line = [[0, y_value], [x_ValueAxis.max, y_value]]

        var name = "kmLine" + km_Item.km_id

        km_Item.km_Finish_Line = name

        measure_Objects.createLine_Structure(km_line, name,  "#BEBDFD", ChartView.SeriesTypeLine)

        km_Item.km_id = km_id_global

        km_id_global++

       /* if(km_item_arr.length > 0){

            //console.log("wwwwww = " + (km_item_arr[km_item_arr.length - 1].km_id + 1))

            km_Item.km_id = km_item_arr[km_item_arr.length - 1].km_id + 1

        } */


        if(needFirst){

            help_createKmLine("km_top_line", new_km_start , y_finish , km_text)

            measure_Rails.createSleepers(new_km_start - step_picket, y_value, sleepers_Type)

        }
        else{

            measure_Rails.createSleepers(new_km_start  , y_value, sleepers_Type)

        }

        km_Item.type_Sleepers = sleepers_Type

        help_createKmLine("km_bottom_line",  y_value  , y_finish, km_text)



    /*   const tmp_offset_mes  = 1 ///  0.5

        var border_3 = [[x_max + tmp_offset_mes, 0], [x_max + tmp_offset_mes, y_ValueAxis.max]]

        measure_Objects.createLine_Structure(border_3, "border_2",  "red" , ChartView.SeriesTypeLine)

        */


        create_KmMeasure(values, new_km_start, isReverse)

        //console.log("sleepers_Type = " + sleepers_Type + " y_value = " + y_value)


        new_km_start += (values + 1) * step_picket

        //km_id.push(km_id[km_id.length - 1] + 1)



       // km_Item.km_id = 0





       // km_Item.km_id.push(km_Item.km_id[km_Item.km_id.length - 1] + 1)

        // km_count++
    }

    function create_KmMeasure(value, y_start, isReverse){

        const size_mes = 0.6

        const size_y = 10 // Растояние по у

        const picket_start = 2 // Пикеты начинаются с 2


        for(var i = 0; i < value; i += 1){

            var name = "mes" + km_Item.km_id + km_Item.pickets_arr.length   //+ ff + i

           // console.log("xxxxxxx km_Item.km_id = " + km_Item.km_id)

           // console.log("xxxxxxx km_Item.pickets_arr = " + km_Item.pickets_arr.length)

            var arr = [ [x_max + tmp_offset_mes , (i * size_y) + y_start] , [x_max + tmp_offset_mes -size_mes, (i * size_y) + y_start]]

            measure_Objects.createLine_Structure(arr, name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

           //create_Mesure(chartView.series(name).at(1), chartView.series(name) , name, i  + picket_start)

            if(!isReverse){

                create_Mesure(chartView.series(name).at(1), chartView.series(name) , name, i  + picket_start)

            }
            else{

                var reverse_value = value - i - 1

                create_Mesure(chartView.series(name).at(1), chartView.series(name) , name, reverse_value  + picket_start)
            }

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


        km_Item.pickets_arr.push(arr)

    }


    function createKm_Label(y_coord, title, series, line, name){

       // var name = "picket" + pickets_arr.length

//        var p = chartView.mapToPosition(Qt.point(x_start + width_Line / 2 , y_coord), name);

        var p = chartView.mapToPosition(series, line);

        var component = Qt.createComponent("qrc:/my_components/Elements/Custom_Rectangle_Label.qml")

        var kmLabel = component.createObject(parent,{"x":p.x ,"y":p.y })

       // pickets_arr.push(kmLabel)

        kmLabel.text = title

        kmLabel.margin_text = 16 //16 // 32

        kmLabel.x -= kmLabel.width / 2

        kmLabel.y -= kmLabel.height / 2

        kmLabel.needBorder = true

        var arr = [name, kmLabel]

        //kmLines_arr.push(arr)

        //km_Item.kmLabel_arr.push(kmLabel)

        //km_Item.kmName_arr.push(name)

        km_Item.kmLines_arr.push(arr)


       // picket.width = 100

        //picket.height = 48

    }

}
