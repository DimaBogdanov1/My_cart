import QtQuick 2.15
import QtCharts 2.15

import Style 1.0
import MyLang 1.0

import my_components 1.0

LineSeries {
    id: series

    axisX: xKm_ValueAxis
   axisYRight: yKm_ValueAxis

    property real width_Line: 3


    property real x_start: (xKm_ValueAxis.max - width_Line) / 2

    property real x_finish: x_start + width_Line

    property real x_center: x_start + width_Line / 2

    property var pickets_arr: []

   property bool tmp_check

    Measure_Objects{
        id: measure_Objects
    }

    function updatePointPosition()
    {
        if(tmp_check){

            var p = km_ChartView.mapToPosition(  km_ChartView.series("middle_struct").at(0),  km_ChartView.series("left_rail") );
            txt.x = p.x;
            txt.y = p.y;
        }


    }

    function create_RailsLine(){



        var arr_left = [[x_start, 0], [x_start, yKm_ValueAxis.max]]

        var arr_right = [[x_start + width_Line, 0], [x_start + width_Line, yKm_ValueAxis.max]]


        measure_Objects.createLine_Structure(arr_left, "left_rail",  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        measure_Objects.createLine_Structure(arr_right, "right_rails",  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        for(var i = 0; i < yKm_ValueAxis.max; i += 2){

            var arr = [ [x_start, i] , [x_start + width_Line, i]]

            measure_Objects.createLine_Structure(arr, "sleeper" + i ,  Style.secondaryAccent_Color, ChartView.SeriesTypeLine)

        }


      //  var c = [[x_start + width_Line / 2, 0], [x_start + width_Line / 2, yKm_ValueAxis.max]]

        //measure_Objects.createLine_Structure(c , "right_rails", "red", ChartView.SeriesTypeLine)


       // measure_Objects.createRails()


        measure_Objects.createArtificial_Structure(30)

        measure_Objects.createBorder_Structure(60)

        measure_Objects.createArrowSwitch_Structure(80)

        measure_Objects.createArrowSensors_Structure(20)

        measure_Objects.createRailroad_Crossing(90)

        tmp_check = true

    }


    // Функция Для Отображения Линии Километра
    function create_KmLine(y_coord){

        //measureLines.create_Line(0, y_coord, x_ValueAxis.max, y_coord, Style.accentLight_Color, Qt.DotLine, "km_1") // Создаём Линию Километра (Дефекта)

        createPicket(80, "256dd")
    }




    function createPicket(y_coord, title)
    {
        var name = "picket" + pickets_arr.length

        var p = km_ChartView.mapToPosition(Qt.point(x_start + width_Line / 2 , y_coord), name);

        var component = Qt.createComponent("qrc:/my_components/Elements/Custom_Rectangle_Label.qml")

        var picket = component.createObject(parent,{"x":p.x ,"y":p.y })

        pickets_arr.push(picket)

        //picket.id = name

        picket.width = 100

        picket.anchors.left = parent.left

        picket.anchors.right = parent.right

        picket.text = title

        picket.margin_text = 32

       // picket.margin_text = 24
        picket.x -= picket.width / 2

        picket.y -= picket.height / 2

        picket.needBorder = true



       // picket.width = 100

        //picket.height = 48

    }

    function update_Pickets(value){

        for(var i = 0; i < pickets_arr.length; i++){

            pickets_arr[i].y -= value

        }


    }

    // Создаём Границы По X Для Нашего Графика
    ValueAxis {
       id: xKm_ValueAxis
       min: 0
       max: 10
       color: Style.light_Color
        gridLineColor: "transparent"
      // gridLineColor: Style.light_Color  // Цвет Сетки
       labelsVisible: false

      // labelsFont:Qt.font({pointSize: 1})

    }

    // Создаём Границы По X Для Нашего Графика
   /* ValueAxis {
       id: x_ValueAxis
       min: 0
       max: 100
       tickType: ValueAxis.TicksDynamic
       tickInterval: 10
       labelFormat: "%i" // Делаем int Значения
       color: Style.light_Color
       gridLineColor: Style.light_Color  // Цвет Сетки
      // labelsColor: Style.primaryDark_Color // Цвет Чисел
      // labelsAngle: 90
      //labelsVisible: false

      // labelsFont: test_label.font// Копируем Шрифт С Вспомогательного Label
       labelsFont:Qt.font({pointSize: 1})

    }*/


    // Создаём Границы По Y Для Нашего Графика
    ValueAxis {
       id: yKm_ValueAxis
       min: 0
       max: 100 //root_Item.max
       tickType: ValueAxis.TicksDynamic
       //tickCount: 2
       tickAnchor: 10
       tickInterval: 10
       reverse: true


       //labelsVisible: false
       labelFormat: "%i"
       color: "#70010219"  //Style.primaryDark_Color

       gridLineColor: "transparent" //  "#d0d0d0"//Style.light_Color// Style.secondaryText_Color // Цвет Сетки
       //labelsColor: Style.primaryDark_Color
       labelsFont: test_label.font
     //  labelsFont:Qt.font({pointSize: ui.text_miniSize})


    }

    Custom_Label{
        id: test_label
        visible: false
        font.pixelSize: ui.text_miniSize
        text: "ss"
    }

}
