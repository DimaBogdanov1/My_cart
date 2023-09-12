import QtQuick 2.0

Item {
    id:root_Item

    property int time_Anim: 2500

    property real scroll_value: 0 // Реальное Значение Скрола Граифка

    property real change_scroll: 0

    property real scroll_target: 0

    property bool isDown

    property bool check

    property real last: 0

    property real next: 0

    onChange_scrollChanged: {

        if(!check){

            last = change_scroll
            check = true
        }
        else{

            next = change_scroll

            check = false
        }

       // scroll_value = next - last

        var a = Math.abs(next - last)

        console.log("last = ",  last , "next = ",  next , "change = " ,a.toString())

        if(isDown){

            chartView.scrollDown(a)
        }
        else{

            chartView.scrollUp(a)
        }

    }

    function create_scroll(value, down){


        change_scroll = 0

        scroll_target = value

        isDown = down

        scroll_Anim.stop()

        scroll_Anim.start()

    }

    NumberAnimation {id: scroll_Anim; target: root_Item;  property: "change_scroll"; from: scroll_value; to: scroll_target; duration: time_Anim}

}
