import QtQuick 2.15
import QtCharts 2.15

import Style 1.0


import my_components 1.0

Item {

   // axisX: xKm_ValueAxis
  // axisYRight: yKm_ValueAxis

    property real x_min: 1.2

    property real x_max:  5.9

    property var km_item_arr: []

    property int km_id_global: 0



    property real width_Line: 1.5

    property real x_start:  (x_max + x_min) / 2 -  width_Line / 2  //- width_Line) / 2  //2.5 //(x_ValueAxis.max - width_Line) / 2

    property real x_finish: x_start + width_Line

    property real x_center: x_start + width_Line / 2

   // property var kmLines_arr: []

  //  property var pickets_arr: []


    property int newSecondPicket_Start: step_picket

    property int new_km_start: 0

  //  property var km_id: [0]

    readonly property real tmp_offset_mes:  0.8 //0.38

    readonly property int step_picket:  100 / 6   //   10


    Measure_Numbers{
        id: measure_Numbers

    }

    Measure_Objects{
        id: measure_Objects
    }

    Measure_Rails{
        id: measure_Rails

    }

    Km_Item{
        id: km_Item
    }


    function updatePointPosition(){

        measure_Numbers.updatePointPosition()
    }

    function create_KmLine(values, km_text, needFirst, sleepers_Type, isReverse){

        measure_Numbers.create_KmLine(values, km_text, needFirst, sleepers_Type, isReverse)

        if(km_id_global == 1){

            measure_Objects.createArrow_Structure(18, 0, true, true)

            measure_Objects.createArrow_Structure(35, 1, false, true)

            measure_Objects.createIsolated_Junction_Structure(25)

            //measure_Objects.createIsolated_Junction_Structure(28, true)

            measure_Objects.createDoubleArrow_Structure(4, true, true)

            measure_Objects.createKmPillar_Structure(7)


            measure_Objects.createArrow_Structure(50, 2, true, false)

        }

        if(km_id_global == 2){

            measure_Objects.createBridge_Structure(80, 100)

            measure_Objects.createKm_Mark_Structure(105)


            measure_Objects.createRailroad_Crossing(120)


            measure_Objects.createArrow_Structure(113, 3, false, false)

        }

        var component = Qt.createComponent("qrc:/my_components/Measure/Km/Km_Item.qml")

        var item = component.createObject(null, {"km_id": km_Item.km_id,
                                                 "distance": km_Item.distance,
                                                 "type_Sleepers": km_Item.type_Sleepers,
                                                 "kmLines_arr": km_Item.kmLines_arr,
                                                 "pickets_arr": km_Item.pickets_arr,
                                                 "sleepers_arr": km_Item.sleepers_arr,
                                                 "objects_arr": km_Item.objects_arr,
                                                 "isReverse": km_Item.isReverse,
                                                 "km_Finish_Line": km_Item.km_Finish_Line})


        km_item_arr.push(item)

        km_Item.kmLines_arr = []

        km_Item.pickets_arr = []

        km_Item.sleepers_arr = []

        km_Item.objects_arr = []

        //console.log("size = " + km_item_arr.length)


        //console.log("km_item sleepers_Type = " + km_item_arr[km_item_arr.length - 1].kmLines_arr.length)

    }

    function dropLine(y) {

        return measure_Rails.dropRails()

    }

    function test_for_scroll(){

        for(var i = 0; i < 30; i++){

            var a = (i * 10)

            var tmp2 = [[0, 70 + a], [1000, 70 + a]]

            measure_Objects.createLine_Structure(tmp2, "border_1",  "red", ChartView.SeriesTypeLine)

        }

    }

    function test_f(y, color){

        var tmp4 = [[0, y], [1000, y]]

        measure_Objects.createLine_Structure(tmp4, "border_1",  color, ChartView.SeriesTypeLine)

    }

    function create_RailsLine(){

        //var c = [[x_start + width_Line / 2, 0], [x_start + width_Line / 2, y_ValueAxis.max]]

       // measure_Objects.createLine_Structure(c , "right_rails", "red", ChartView.SeriesTypeLine)



       // measure_Objects.createArtificial_Structure(55)

        //measure_Objects.createBorder_Structure(60)

      //  measure_Objects.createArrowSwitch_Structure(10)

       // measure_Objects.createArrowSensors_Structure(20)

   //     measure_Objects.createIsolated_Joint_Structure(80)

    //    measure_Objects.createRailroad_Crossing(90)

       // const tmp = [[0, 30], [1000, 30]]

       // const tmp2 = [[0, 10], [1000, 10]]




        const tmp = [[0, 100], [1000, 100]]

        const tmp2 = [[0, 80], [1000, 80]]

        const tmp3 = [[0, 170], [1000, 170]]

        const tmp4 = [[0, 430], [1000, 430]]

       // measure_Objects.createLine_Structure(tmp, "border_1",  "red", ChartView.SeriesTypeLine)

       // measure_Objects.createLine_Structure(tmp2, "border_1",  "blue", ChartView.SeriesTypeLine)

       // measure_Objects.createLine_Structure(tmp3, "border_1",  "green", ChartView.SeriesTypeLine)

       // measure_Objects.createLine_Structure(tmp4, "border_1",  "orange", ChartView.SeriesTypeLine)

        //test_for_scroll()

        //const border_1 = [[x_min, 0], [x_min, y_ValueAxis.max]]
       // measure_Objects.createLine_Structure(border_1, "border_1",  "red", ChartView.SeriesTypeLine)

      //  const border_2 = [[x_max, 0], [x_max, y_ValueAxis.max]]
        //measure_Objects.createLine_Structure(border_2, "border_2", "green", ChartView.SeriesTypeLine) //Style.secondaryAccent_Color




        measure_Numbers.tmp_check = true


        measure_Numbers.updatePointPosition()

      //  console.log("eeeeeeeeeeee")

    }

}
