import QtQuick 2.0

Item {
    id:root_Item

    property bool isDown

    property int coun_scroll: 0

    property int rangePause_scroll: 0


    property int a: 0

    property int maxUp: 10000

    property real coef: 1 //2


    property int stop_y: 0

    property int counter: 0

    property real tmp_value: 0

    property bool checkScroll: true

    property bool check_pause_Scroll: false


    property bool change_check: false

    property int test_val: 0


    property int top_Scroll_Border: 0

    property int bottom_Scroll_Border: 0



    onAChanged: {

        if(counter < tmp_value){


        }

        if(isDown){

            if(coun_scroll > -1 * maxUp){  //   if(c >= 0)

                coun_scroll += 1 * coef // 1

                chartView.scrollUp(1 * coef)

                km_ChartView.scrollUp(1 * coef)

             //   km_ChartView.scrollUp(1)

            }
            else{

                a_Anim.stop()

            }


        }
        else{ // Up

            if(coun_scroll < maxUp){ // if(c > 0)

                coun_scroll -= 1 * coef //1

             //   console.log("c = " + coun_scroll)

                chartView.scrollDown(1 * coef)

                km_ChartView.scrollDown(1 * coef)

              //  km_ChartView.scrollDown(1)

            }

        }


        measure_Km.updatePointPosition();

       // console.log("isDown = " + isDown + " c = " + c.toString())

        counter++

       // console.log("a = " + a + " counter = " + counter)


    }

    NumberAnimation {id: a_Anim; target: root_Item;  property: "a"; from: 0; duration: 1000}

    NumberAnimation {id: fast_Anim; target: root_Item;  property: "test_val"; from: 0; duration: 5000

        onRunningChanged: {

            if(!running){


                Chart_Work.change_check_Draw(true)
                checkScroll = true

                console.log("меняем чек скролл")

            }
        }
    }



    function change_Pause(pause, _stop_y){

        a_Anim.stop()

        if(pause){

            create_fast_scroll(_stop_y) // checkScroll изменится в конце анимации

            check_pause_Scroll = false

            measure_Km.test_f(y_0, "red")

        }
        else{

            var range_scroll = 200

            top_Scroll_Border = coun_scroll //- 200

            bottom_Scroll_Border = coun_scroll - 200//+ 200

            //rangePause_scroll = coun_scroll

            //coun_scroll = 0

            checkScroll = false

            check_pause_Scroll = true

            stop_y = _stop_y // Место где мы остановились

            measure_Km.test_f(chart_anim.stop_y, "green")

        }

    }

    function convert_y_to_pixel(value){

        return (chart_Rectangle.height * value) /  100
    }

    function create_fast_scroll(value){

      //  value -= 10

        console.log("all_value = " + value)

        console.log("stop_value = " + stop_y)


        var c = value % 100

        console.log("остаток от деления  value % 100 = " + c)  // 91 близко к правде


        var diff = value - stop_y

        if(stop_y < 80){

            console.log("Другой скролл")

             checkScroll = true

        }
        else{

            var convert_diff = convert_y_to_pixel(diff)

            console.log("diff = " + diff)

            console.log("convert_diff = " + convert_diff)


            if(diff < 80){

              //  diff = 80
                //convert_diff = convert_y_to_pixel(diff)

            }


            chartView.scrollUp( convert_diff ) // - 40


         //   chartView.scrollDown( convert_diff ) // - 40

          //  console.log("stop_value = " + stop_value)

            //         console.log("coun_scroll = " + coun_scroll * -1)


            Chart_Work.change_check_Draw(false)


            fast_Anim.to = 20

            fast_Anim.stop()

            fast_Anim.start()
        }



       /* fast_Anim.to = a / 20   //  coun_scroll + chart_Rectangle.height / 5

        isDown = false

        coef = 20

        a_Anim.stop()

        fast_Anim.stop()

        fast_Anim.start() */

    }

    function create_scroll(value, down){

        coef = 1

        isDown = down

        a_Anim.to = value

        a_Anim.stop()

        a_Anim.start()

    }

    function create_Scroll_on_Pause(value, down){

        console.log("coun_scroll = " + coun_scroll + " top_Scroll_Border = " + top_Scroll_Border + " bottom_Scroll_Border = " + bottom_Scroll_Border)

        var range_scroll = 200

        if(!down){

            if(bottom_Scroll_Border < coun_scroll ){

                create_scroll(value, down)

            }
            else{

                toast.show("Больше вниз нельзя !!", 3000, 1) // Показываем Тоcт

            }
        }
        else{

            if(coun_scroll < top_Scroll_Border ){

                create_scroll(value, down)

            }
            else{

                toast.show("Больше вверх нельзя !!", 3000, 1) // Показываем Тоcт

            }
        }





/*        if(top_Scroll_Border < coun_scroll && coun_scroll < bottom_Scroll_Border){

            //console.log("успех = " + top_Scroll_Border + " < " + coun_scroll + " < " + bottom_Scroll_Border)

            create_scroll(value, down)

        }
        else{

            toast.show("Максимум прокрутки !!", 3000, 1) // Показываем Тоcт

        }*/


    }

    function create_Main_Scroll(value, down){


        if(coun_scroll <= maxUp && checkScroll){ // if(c >= 0){

            create_scroll(value, down)
        }

      //  chartView.scrollDown(value)

     /*   coef = 1

        a_Anim.to = value */

      //  coef = (2 * value) / 20

        //a_Anim.duration = Math.round((500 * (value * coef)) / (20 * coef) )

       // console.log("value = " +  value)

       // console.log("coef = " +  coef)

     /*   isDown = down


        a_Anim.stop()

        if(coun_scroll >= -1 * maxUp && checkScroll){ // if(c >= 0){

            a_Anim.start()
        } */

       /* change_scroll = 0

        scroll_target = value

        isDown = down

        scroll_Anim.stop()

        scroll_Anim.start() */

    }

}
