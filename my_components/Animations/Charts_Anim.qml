import QtQuick 2.0

Item {
    id:root_Item

    property bool isDown

    property int c: 0

    property int a: 0

    property int maxUp: 1000

    onAChanged: {

        if(isDown){

            if(c < 1000){  //   if(c >= 0)

                c += 1

                chartView.scrollUp(1)

             //   km_ChartView.scrollUp(1)

            }
            else{

                a_Anim.stop()

            }


        }
        else{ // Up

            if(c > -1 * maxUp){ // if(c > 0)

                c -= 1

                chartView.scrollDown(1)

              //  km_ChartView.scrollDown(1)

            }

        }


        measure_Km.updatePointPosition();

       // console.log("isDown = " + isDown + " c = " + c.toString())

    }

    NumberAnimation {id: a_Anim; target: root_Item;  property: "a"; from: 0; duration: 500}


    function create_scroll(value, down){

        a_Anim.to = value

        isDown = down

        /*if(down){

            chartView.scrollDown(value)

        }
        else{

            chartView.scrollUp(value)

        }*/

        a_Anim.stop()

        if(c >= -1000){ // if(c >= 0){

            a_Anim.start()
        }

       /* change_scroll = 0

        scroll_target = value

        isDown = down

        scroll_Anim.stop()

        scroll_Anim.start() */

    }

}
