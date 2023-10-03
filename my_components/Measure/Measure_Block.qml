import QtQuick 2.0
import Style 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height:  parent.height

    property string title

    property real value

    property var measure_model: []

    property var x_values_model: []

    //property int max

   // property int min

    //property int step

    property real x_start

    property real x_finish

    readonly property int count_val: measure_model.length   // ((max - min) / step) + 1

    /////////////////////////
   // property var values_model: [] // [1510, 1512, 1520, 1538, 1546]

    property real minus_width: 4.328125 // qml: minus_width = 4.328125


    property real center_value

    property bool tmp_val

    property bool reverse



    function create_model(){

        /*for(var i = min; i < max + step; i+= step){

          measure_model.push(i.toString())
        }

        if(tmp_val){

            repeater.model = values_model

        }
        else{

            repeater.model = measure_model

        }

        */

        if(tmp_val){

            for(var i = 0; i < measure_model.length; i++){

             //   console.log(title + " qqqq = " + convert_x(measure_model[i]))

                       // var a =  (difference * root_Item.width / 2 )  / (center_value - amplitude )


              //  console.log(title + " repeater = " +  convert_x(repeater.itemAt(i).width))

                x_values_model.push(convert_x(measure_model[i]) )

                console.log(title + " convert_x(i) = " +  convert_x(measure_model[i])  )

                   console.log(title + " convert_x(15) = " +  convert_x(1) )

                /*if(reverse){

                    center_value = Math.abs(measure_model[measure_model.length - 1] + measure_model[0]) / 2


                    if(i != 0 && i != measure_model.length - 1){

                        var b = measure_model[i] - center_value



                        console.log("center_value = " + center_value)

                        console.log(title + " b = " + b)

                        var c = measure_model[i] - b

                        console.log(title + " c = " + c)

                        console.log(title + " convert c = " + convert_x(c))


                        x_values_model.push(convert_x(measure_model[i] - center_value))
                    }
                    else{

                        x_values_model.push(convert_x(measure_model[i]))

                    }



                }
                else{

                    x_values_model.push(convert_x(measure_model[i]))

                }*/

            }

        }


    }

    function convert_x(x_value){

        var max = measure_model[measure_model.length - 1]

        var min = measure_model[0]

        var delta_value =  max - min

        var delta_x = x_finish - x_start

        var percent = (x_value - min) * 100 / delta_value


        var answer = ((delta_x * percent) / 100) + x_start


        //console.log("answer = " , answer )

        return answer
    }



    function create_x(value, width_block){


        var right_bord = false

       //    console.log("Входное значение  == " + value)

     //   center_value =  measure_model [Math.round(measure_model.length / 2) - 1]

        center_value = Math.abs(measure_model[measure_model.length - 1] + measure_model[0]) / 2

        // console.log(title + " center_value " + center_value)

        var amplitude

        var difference = value - center_value


        if(Math.abs(measure_model[measure_model.length - 1])  > Math.abs(measure_model[0])){

            amplitude = measure_model[measure_model.length - 1]

            right_bord = true
        }
        else{

            amplitude = measure_model[0]

        }

        var a =  (difference * repeater.width / 2 )  / (center_value - amplitude )

      //  console.log("old a = " + a)

        //console.log("difference = " + difference)


        if(!right_bord){

            if(value > center_value){

                a = a - width_block / 4
            }
            else{

                if(value < center_value){

                    a = a + width_block / 4
                }

            }

        }
        else{

            if(value < center_value){

                a = a - width_block
            }
            else{

                if(value > center_value){

                    a = a + width_block

                }

            }

            if(!reverse){

                a = a * -1

            }



        }

        // console.log("a = " + a)
         return  a

    }

    /*Custom_Rectangle_Label {
        visible: false
        height: parent.height
        margin_text: 0
        pixel_size:  ui.text_miniSize
        text: "-"

        Component.onCompleted: {

          //  minus_width = width

            //console.log("minus_width = " + minus_width)
        }

    }*/


    Rectangle{
         width: parent.width
         height:  parent.height
         radius: ui.radius
         color: Style.background_Color

         Column{
             width: parent.width
             height:  parent.height

             Item{
                 width: parent.width
                 height:  parent.height / 2  //- ui.border_Size / 2

                 Custom_Label{
                     id: label
                     horizontalAlignment: Text.AlignHCenter
                     font.pixelSize: 12 //ui.text_SmallSize
                   //  color: Style.accent_Color // Меняем Цвет Текста
                     text: title + ": " + value

                 }



             }

             Item{
                 width: parent.width
                 height: ui.border_Size

                 Rectangle{
                     width: parent.width * 0.9
                     height: parent.height
                     anchors.centerIn: parent
                     color: Style.primaryDark_Color


                 }
             }



             Item{
                  width: parent.width
                  height:  parent.height /2 //- ui.border_Size / 2

                  Item{
                    width: parent.width
                    height:  parent.height

                    Repeater{
                        id: repeater
                        width: parent.width - ui.basic_spacing
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        model: root_Item.measure_model


                        Custom_Rectangle_Label {

                            id: measure_label
                            required property int index

                            required property real modelData

                           // width: parent.width / repeater.count //repeater.model.count

                            width: modelData.toString().length > 3 ? 20 : repeater.width * 0.14

                            height: parent.height
                            margin_text: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.horizontalCenterOffset: create_x(modelData, width)
                         //   needBack: false
                            horizontal: Text.AlignHCenter
                            pixel_size:  ui.text_miniSize
                            text: modelData
                            color: "red"

                            function update_margin(){

                                measure_label.anchors.horizontalCenterOffset = create_x(modelData, width)

                                console.log("dfdfdsfsdfdsfdsf")
                            }

                            Component.onCompleted: {

                                /*if(modelData > 0){

                                    width = width + minus_width

                                    horizontal = Text.AlignRight
                                }

                                update_margin() */

                              //  anchors.horizontalCenterOffset = create_x(index, modelData, width)

                               // width = 10

                                //console.log("repeater width = " + repeater.width)
                            }

                        }

                    }

                    /*onWidthChanged: {

                        console.log("rrrrrrrrrrrrrrrrrr")
                        for(var i = 0; i < repeater.count; i++){

                            repeater.itemAt(i).update_margin()

                        }
                    } */
                }
             }
         }


    }

    Component.onCompleted: {

        create_model()


       // console.log(title + " " + count_val)
    }

}
