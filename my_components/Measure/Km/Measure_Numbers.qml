import QtQuick 2.15
import QtCharts 2.15

import Style 1.0


import my_components 1.0

Item {
    property bool tmp_check

    property bool tmp_tmp_check

    readonly property int picket_offset: -15


    function updatePointPosition(){

        if(tmp_check){

            for(var i = 0; i < km_item_arr.length; i++){  // i < kmLines_arr.length

                for(var k = 0; k < km_item_arr[i].kmLines_arr.length; k++){

                    var e = km_ChartView.mapToPosition(  km_ChartView.series(km_item_arr[i].kmLines_arr[k][0]).at(1),  km_ChartView.series(km_item_arr[i].kmLines_arr[k][1]) );

                    km_item_arr[i].kmLines_arr[k][1].x = e.x - km_item_arr[i].kmLines_arr[k][1].width / 2

                    km_item_arr[i].kmLines_arr[k][1].y = e.y - km_item_arr[i].kmLines_arr[k][1].height / 2

                }

                for(var j = 0; j < km_item_arr[i].pickets_arr.length; j++){  // km_item_arr[i].kmLines_arr.length   // pickets_arr.length

                    var r = km_ChartView.mapToPosition(  km_ChartView.series(km_item_arr[i].pickets_arr[j][0]).at(1),  km_ChartView.series(km_item_arr[i].pickets_arr[j][1]) );

                    km_item_arr[i].pickets_arr[j][1].x =  r.x - km_item_arr[i].pickets_arr[j][1].width / 2

                    km_item_arr[i].pickets_arr[j][1].y =  r.y - km_item_arr[i].pickets_arr[j][1].height / 2  + get_PicketOffset(km_item_arr[i].isReverse) //- 10

                }

            }

        }
        else{

            if(!tmp_tmp_check){

                measure_Rails.createRails()

                measure_Km.create_KmLine(400, "256", false, 0, false)

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

    function help_createKmLine(name, y_value, text , isBottom){

        var tmp_y_offset = 5

        var name_line = "name"  + km_Item.km_id +  km_Item.kmLines_arr.length


        var y_label

        if(isBottom){

            y_label = y_value - tmp_y_offset
        }
        else{

            y_label = y_value + tmp_y_offset

        }


        var km_line = [[x_center, y_label], [x_center, y_label] ] // [30, y_value - tmp_y_offset]

        measure_Objects.createLine_Structure(km_line, name_line,  "blue", ChartView.SeriesTypeLine)      //(0, y_coord, x_ValueAxis.max, y_coord, Style.accentLight_Color, Qt.DotLine, "km_1") // Создаём Линию Километра (Дефекта)


      //  console.log("input name_line = " + name_line)

        createKm_Label(text, km_ChartView.series(name_line).at(1), km_ChartView.series(name_line), name_line)


    }

    // Функция Для Отображения Линии Километра
    function create_KmLine(values, km_text, needFirst, sleepers_Type, isReverse){

        
        var a = values / 100

        var main_picket_count = Math.floor(a)

        var dop_value = a - main_picket_count

       // console.log("a = " + a + " main_picket_count = " + main_picket_count + " dop_value = " + dop_value)

        

       // console.log("Зашли в create_KmLine isReverse " + " " + isReverse + " ")

        // step_picket



        var distance = step_picket *  a //tmp //(a - 1) //main_picket_count  //values



        var y_finish = distance + new_km_start

       /* if(km_item_arr.length > 0){

            km_Item.y_count = distance + step_picket
        }
        else{

            km_Item.y_count = distance

        } */

        km_Item.distance = distance



        console.log("km_Item.distance = " + km_Item.distance )


        if(km_item_arr.length == 0){

           let km_line = [[0, new_km_start], [x_ValueAxis.max, new_km_start]]

           measure_Objects.createLine_Structure(km_line, measure_Rails.first_kmLine_name,  "#BEBDFD", ChartView.SeriesTypeLine)

            measure_Objects.createLine_Structure(km_line, measure_Rails.first_kmLine_name,  "#BEBDFD", ChartView.SeriesTypeLine, false, false, true)


        }


        var km_line = [[0, y_finish], [x_ValueAxis.max, y_finish]]

        var name = "kmLine" + km_Item.km_id

        km_Item.km_Finish_Line = name



        measure_Objects.createLine_Structure(km_line, name,  "#BEBDFD", ChartView.SeriesTypeLine)

        measure_Objects.createLine_Structure(km_line, name,  "#BEBDFD", ChartView.SeriesTypeLine, false, false, true)

        km_Item.km_id = km_id_global

        km_id_global++


        if(needFirst){

            help_createKmLine("km_top_line", new_km_start, km_text, false)

        }


        measure_Rails.createSleepers(new_km_start, y_finish, sleepers_Type)


        km_Item.type_Sleepers = sleepers_Type

        help_createKmLine("km_bottom_line",  y_finish , km_text, true)




        var counNumbers

        if(dop_value == 0){

            console.log("dop_value = " + dop_value)

            counNumbers = main_picket_count -1 //- 2

        }
        else{

            counNumbers = main_picket_count //- 1


        }


        create_KmMeasure(counNumbers, newSecondPicket_Start, y_finish, isReverse)


      //  measure_Rails.create_Riht(new_km_start, new_km_start + (distance) / 2, true)

       // measure_Rails.create_Riht(new_km_start + (distance) / 2, y_finish, false)



        new_km_start +=  distance

        newSecondPicket_Start += distance


    }

    function create_KmMeasure(counNumbers, y_start, y_finish, isReverse){

        const size_mes = 0.6

        const picket_start = 2 // Пикеты начинаются с 2


        var picketStart_y


        if(!isReverse){

            picketStart_y = y_start

            for(var i = 0; i < counNumbers; i++){

                var name = "mes" + km_Item.km_id + km_Item.pickets_arr.length   //+ ff + i

                var arr = [ [x_max + tmp_offset_mes , (i * step_picket) + picketStart_y] , [x_max + tmp_offset_mes -size_mes, (i * step_picket) + picketStart_y]]


                measure_Objects.createLine_Structure(arr, name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)


                create_Mesure(km_ChartView.series(name).at(1), km_ChartView.series(name) , name, i  + picket_start, isReverse)

                /*if(!isReverse){

                    create_Mesure(chartView.series(name).at(1), chartView.series(name) , name, i  + picket_start, isReverse)

                }
                else{

                    var reverse_value = counNumbers - i - 1

                    create_Mesure(chartView.series(name).at(1), chartView.series(name) , name, reverse_value  + picket_start, isReverse)
                }*/
            }

        }
        else{


            var km_line = [[0, picketStart_y], [x_ValueAxis.max, picketStart_y]]

            measure_Objects.createLine_Structure(km_line, "sdsadsadasda",  "red", ChartView.SeriesTypeLine)


            picketStart_y = y_finish

            for(var j = 0; j < counNumbers; j++){

                let name = "mes" + km_Item.km_id + km_Item.pickets_arr.length   //+ ff + i

                let y_picket = picketStart_y - ((j + 1) * step_picket)


                let arr = [ [x_max + tmp_offset_mes ,  y_picket] , [x_max + tmp_offset_mes -size_mes, y_picket]]

                measure_Objects.createLine_Structure(arr, name,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)



                create_Mesure(km_ChartView.series(name).at(1), km_ChartView.series(name) , name, j  + picket_start , isReverse)

            }
        }


        km_Item.isReverse = isReverse

    }

    function create_Mesure(series, line, name, title, isReverse){

        var p = km_ChartView.mapToPosition(series, line);

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

        mesLabel.y -=  mesLabel.height / 2 - get_PicketOffset(isReverse)

      //  mesLabel.y += 10;

        //kmLabel.needBorder = true


        var arr = [name, mesLabel]


        km_Item.pickets_arr.push(arr)

    }


    function get_PicketOffset(isReverse){

        var _picket_offset = picket_offset

        if(isReverse){

            _picket_offset *= -1
        }

        return  _picket_offset
    }

    function createKm_Label(title, series, line, name){

       // var name = "picket" + pickets_arr.length

//        var p = chartView.mapToPosition(Qt.point(x_start + width_Line / 2 , y_coord), name);

        var p = km_ChartView.mapToPosition(series, line);

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
