import QtQuick 2.15
import qml.measure 1.0

import Style 1.0

import my_components 1.0

Item {

    function dropLine(y) {


        var a = measure_Km.dropLine(y)

        console.log("a = " + a)

        return level_MeasureLines.dropLine(a)

        //measure_LineSeries.pointRemoved(10, 40)
    }

    Connections{
       target: Chart_Work


       property real y_1: 0

       property real y_2: 0

       property real y_3: 0

       property real y_4: 0

       property real y_5: 0

       function onNewPoint_Chart_signal(index, x, y) {

         //  y = y.toFixed(2)


           if(true){ // 79 y_0 < 110

               switch(index){

               case Name_Measures.Level_Measure:

                   level_MeasureLines.addPoint(level_MeasureBlock.convert_x(x, true), y_0, x) // level_MeasureBlock.value =

                   if(chart_anim.checkScroll){

                        level_MeasureBlock.value = x.toFixed(2)
                   }


                   //level_MeasureBlock.value = x



                   y_0 += chartView.offset

                   coun_y_Btn.text = y_0

                   if(y_0 === root_Item.start_scroll){

                       chart_anim.create_Main_Scroll(chart_Rectangle.height / 10, true)

                       //chartView.scrollDown(chart_Rectangle.height / 5)

                       start_scroll+= 10
                     //  root_Item.start_scroll = chart_anim.create_main_scroll(root_Item.start_scroll)

                                             // chartView.scrollDown(chart_Rectangle.height / 10)

                                             // measure_Km.updatePointPosition();

                                             // root_Item.start_scroll += 10

                                             // chartView.scrollDown(1)

                                             // measure_Km.updatePointPosition();

                                              //console.log("Пора скролить " + )

                                            //  chart_anim.create_Main_Scroll(30, false)

                                          }

                  //y_0+= 0.1

                   break

               case Name_Measures.Riht_Left_Measure:

                 //  riht_Left_MeasureBlock.value = riht_Left_MeasureLines.addPoint(riht_Left_MeasureBlock.convert_x(x, true), y_1, x)

                   riht_Left_MeasureLines.addPoint(riht_Left_MeasureBlock.convert_x(x, true), y_1, x)

                   if(chart_anim.checkScroll){

                        riht_Left_MeasureBlock.value = x.toFixed(2)
                   }

                   y_1 += chartView.offset

                   break

               case Name_Measures.Riht_Right_Measure:

                //   riht_Right_MeasureBlock.value = riht_Right_MeasureLines.addPoint(riht_Right_MeasureBlock.convert_x(x, true), y_2, x)

                   riht_Right_MeasureLines.addPoint(riht_Right_MeasureBlock.convert_x(x, true), y_2, x)

                   if(chart_anim.checkScroll){

                        riht_Right_MeasureBlock.value = x.toFixed(2)
                   }

                   y_2 += chartView.offset

                   break

               case Name_Measures.Sample_Measure:

               //    sample_MeasureBlock.value = sample_MeasureLines.addPoint(sample_MeasureBlock.convert_x(x, true), y_3, x)

                   sample_MeasureLines.addPoint(sample_MeasureBlock.convert_x(x, true), y_3, x)

                   if(chart_anim.checkScroll){

                        sample_MeasureBlock.value = x.toFixed(2)
                    }

                   y_3 += chartView.offset

                   break

               case Name_Measures.Down_Left_Measure:

              //     down_Left_MeasureBlock.value = down_Left_MeasureLines.addPoint(down_Left_MeasureBlock.convert_x(x, true), y_4, x)

                   down_Left_MeasureLines.addPoint(down_Left_MeasureBlock.convert_x(x, true), y_4, x)

                   if(chart_anim.checkScroll){

                        down_Left_MeasureBlock.value = x.toFixed(2)
                    }

                   y_4 += chartView.offset

                   break

               case Name_Measures.Down_Right_Measure:

               //    down_Right_MeasureBlock.value = down_Right_MeasureLines.addPoint(down_Right_MeasureBlock.convert_x(x, true), y_5, x)

                   down_Right_MeasureLines.addPoint(down_Right_MeasureBlock.convert_x(x, true), y_5, x)


                   if(chart_anim.checkScroll){

                        down_Right_MeasureBlock.value = x.toFixed(2)
                    }

                   y_5 += chartView.offset

                   break


               }

           }



           // chart_LineSeries.append(x, y)


       }

       function onNewPicket_signal(y) {

           measure_Km.create_KmLine(y)

       }

       function onNewViserValue_signal(index, value) {

           let fixed_value = 3

           switch(index){

           case Name_Measures.Level_Measure:

               level_MeasureBlock.value = value.toFixed(fixed_value).toString()

               break

           case Name_Measures.Riht_Left_Measure:

               riht_Left_MeasureBlock.value = value.toFixed(fixed_value).toString()

               break

           case Name_Measures.Riht_Right_Measure:

               riht_Right_MeasureBlock.value = value.toFixed(fixed_value).toString()

               break

           case Name_Measures.Sample_Measure:

               sample_MeasureBlock.value = value.toFixed(fixed_value).toString()

               break

           case Name_Measures.Down_Left_Measure:

               down_Left_MeasureBlock.value = value.toFixed(fixed_value).toString()

               break

           case Name_Measures.Down_Right_Measure:

               down_Right_MeasureBlock.value = value.toFixed(fixed_value).toString()

               break


           }



       }

    }
}
