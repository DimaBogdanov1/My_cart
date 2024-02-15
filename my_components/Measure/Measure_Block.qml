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

    property var no_values_model: []


    property int no_x_index: -1

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

    property int tmp_offset: 24

    Lines_Logic{
        id: lines_Logic
    }

    function create_model(){


        for(var i = 0; i < measure_model.length; i++){

         //   console.log(title + " qqqq = " + convert_x(measure_model[i]))

                   // var a =  (difference * root_Item.width / 2 )  / (center_value - amplitude )

          //  console.log(title + " repeater = " +  convert_x(repeater.itemAt(i).width))


            if(reverse){

                var b = measure_model[measure_model.length - 1] - measure_model[i] + measure_model[0]

               // console.log(title + " b = " + b)

                x_values_model.push(convert_x(b, true))

            }
            else{

                x_values_model.push(convert_x(measure_model[i], true) )

              //  console.log(title + " convert_x(i) = " +  convert_x(measure_model[i])  )

               // console.log(title + " convert_x(1) = " +  convert_x(1) )

            }

        }

        if(no_x_index != -1){

            x_values_model.splice(no_x_index, 1);

        }


    }

    function convert_x(x_value, isReal_X_to_Chart_X){

        return lines_Logic.convert_x(x_value, isReal_X_to_Chart_X,  measure_model[0], measure_model[measure_model.length - 1], x_start, x_finish, reverse)

    }

    function check_visible(value){

        var result = true

        for(var i = 0; i < no_values_model.length; i++){

            if(value === no_values_model[i]){

                result = false

                break
            }
        }

        return result

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

                a = a - width_block / 4
            }
            else{

                if(value > center_value){

                    a = a + width_block / 4

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

                 Item{
                     width: title_Label.width + tmp_offset // 36 - это значение width на сколько влезет value
                     height:  parent.height
                     anchors.centerIn: parent

                    // color: "red"

                     Item{
                        width: parent.width // 2
                        height:  parent.height

                        Custom_Rectangle_Label {
                            id: title_Label
                           // width: parent.width / 2
                            height: parent.height
                            needBack: false
                            anchors.left: parent.left
                            pixel_size:  ui.text_miniSize
                            text: my_str.addColon(title)  //+ value

                        }

                        Custom_Rectangle_Label {
                            id: value_Label
                            width: tmp_offset - 4 //parent.width / 2
                            height: parent.height
                            needBack: false
                            color:"green"

                            horizontal: Text.AlignLeft //Text.AlignRight // Text.AlignLeft

                            anchors.right: parent.right
                            pixel_size:  ui.text_miniSize
                            text: value //"-30.54" //value

                        }

                     }


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
                        width: parent.width - ui.big_spacing
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        model: root_Item.measure_model


                        Custom_Rectangle_Label {

                            id: measure_label
                            required property int index

                            required property real modelData

                           // width: parent.width / repeater.count //repeater.model.count

                            width: repeater.width * 0.14  //modelData.toString().length > 3 ? repeater.width * 0.14 : repeater.width * 0.14

                            height: parent.height
                            visible:  check_visible(modelData)
                            margin_text: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.horizontalCenterOffset: create_x(modelData, width)
                            needBack: false
                            horizontal: Text.AlignHCenter
                            pixel_size:  ui.text_miniSize
                            text: modelData
                            color: "red"

                        }

                    }

                }
             }
         }


    }

    Component.onCompleted: {

        create_model()
    }

}
