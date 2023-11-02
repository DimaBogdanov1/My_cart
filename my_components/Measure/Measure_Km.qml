import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0

import my_components 1.0

Item {

   // axisX: xKm_ValueAxis
  // axisYRight: yKm_ValueAxis

    property real x_min: 1.2

    property real x_max:  5.9


    property real width_Line: 1.5

    property real x_start:  (x_max + x_min) / 2 -  width_Line / 2  //- width_Line) / 2  //2.5 //(x_ValueAxis.max - width_Line) / 2

    property real x_finish: x_start + width_Line

    property real x_center: x_start + width_Line / 2

    property var kmLines_arr: []

    property var pickets_arr: []


    property int new_km_start: 0

    readonly property real tmp_offset_mes:  0.8 //0.38

    readonly property int step_picket: 10


    Measure_Numbers{
        id: measure_Numbers

    }

    Measure_Objects{
        id: measure_Objects
    }

    Measure_Rails{
        id: measure_Rails

    }



    function updatePointPosition(){

        measure_Numbers.updatePointPosition()
    }

    function create_KmLine(values, km_text, needFirst, sleepers_Type){

        measure_Numbers.create_KmLine(values, km_text, needFirst, sleepers_Type)
    }

    function create_RailsLine(){

        //var c = [[x_start + width_Line / 2, 0], [x_start + width_Line / 2, y_ValueAxis.max]]

       // measure_Objects.createLine_Structure(c , "right_rails", "red", ChartView.SeriesTypeLine)



        measure_Objects.createArtificial_Structure(55)

        //measure_Objects.createBorder_Structure(60)

        measure_Objects.createArrowSwitch_Structure(10)

        measure_Objects.createArrowSensors_Structure(20)

        measure_Objects.createRailroad_Crossing(90)



        //const border_1 = [[x_min, 0], [x_min, y_ValueAxis.max]]
       // measure_Objects.createLine_Structure(border_1, "border_1",  "red", ChartView.SeriesTypeLine)

      //  const border_2 = [[x_max, 0], [x_max, y_ValueAxis.max]]
        //measure_Objects.createLine_Structure(border_2, "border_2", "green", ChartView.SeriesTypeLine) //Style.secondaryAccent_Color




        measure_Numbers.tmp_check = true


    }

}
