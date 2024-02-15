import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15
import qml.name_train 1.0

import Style 1.0



Item {
    property real x_start

    property real x_finish

    //id: passTrain_LineSeries
   // color: "green" //"#F68160" //Style.accent_Color E9FAA7 B9B2F9
   // XYPoint { x: x_1; y: y_1 }
   // XYPoint { x: x_1; y: y_1 + 10 }


    property var speedLine_arr: []

    Lines_Logic{
        id: lines_Logic
    }

    function create_SpeedLine(){

     /*   var series = lines_Logic.change_series("blue", Qt.SolidLine, "speed_line", true) // #E17259"

        series.append(speed_MeasureBlock.convert_x(60, true), y_start);

        series.append(speed_MeasureBlock.convert_x(60, true), y_start + 10);

       // km_ChartView.scrollDown(380)

       */

    }


    function test_f(){

        passTrain_LineSeries.append(x_start, 0)

        passTrain_LineSeries.append(x_start, 20)



        var series = lines_Logic.change_series("red", Qt.SolidLine, "speed_line", true) // #E17259"

        series.append(x_finish, 0);

        series.append(x_finish, 20);


    }

    function createNew_Speed(name, color, x, y_start, y_finish){

        var series = lines_Logic.change_series(color, Qt.SolidLine, name, true)

        speedLine_arr.push(name)

        km_ChartView.series(name).append(speed_MeasureBlock.convert_x(x, true), y_start)

        km_ChartView.series(name).append(speed_MeasureBlock.convert_x(x, true), y_finish)


    }




    Connections{
        target: Mqqt_Client

        function onNewSpeedTrain_signal(startCoord, finishCoord, speedPass, speedFreight, speedSallowBird, speedSapsan){

            // вот здесь финиш коорд надо конвертить finishCoord

            var arr = [speedPass, speedFreight, speedSallowBird, speedSapsan]

            for(var i = 0; i < 4; i++){

                var name = "speed_Line" + i + speedLine_arr.length

                createNew_Speed(name, "blue", arr[i], startCoord, finishCoord)
            }

        }

    }
}
