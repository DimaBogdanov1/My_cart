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

    property int max

    property int min

    property int step

    property real x_start

    property real x_finish

    readonly property int count_val: ((max - min) / step) + 1


    /////////////////////////
    property var values_model: [] // [-75, -35, -6, 0, 6, 35, 75]

    property bool tmp_val

    property real minus_width: 4.328125 // qml: minus_width = 4.328125




    function create_model(){

        for(var i = min; i < max + step; i+= step){

          measure_model.push(i.toString())
        }

        if(tmp_val){

            repeater.model = values_model

        }
        else{

            repeater.model = measure_model

        }

    }

    function convert_x(x_value){

        var delta_value = max - min

        var delta_x = x_finish - x_start

        var percent = (x_value - min) * 100 / delta_value


        var answer = ((delta_x * percent) / 100) + x_start


        //console.log("answer = " , answer )

        return answer
    }



    function create_x(value, width_block){

        if(tmp_val){

            //console.log("root_Item.width  = " + root_Item.width )

            if(value > 0){

              //  console.log("old width = " + width_block)

             //   width_block =  width_block + minus_width // ((value.length + 1) * width_block) / value.length

               // repeater.itemAt(index).width = width_block

                //console.log("new width = " + width_block)
            }

            var a =  ((value * root_Item.width / (values_model[0] * -1)) / 2 )



            if(a > 0){

                a = a - width_block
            }
            else{

                if(a < 0){

                    a = a + width_block

                }

            }

            console.log("a = " + a)
            return  a

        }
        else{
            return 0
        }


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
                        width: parent.width
                        height: parent.height
                        //model: measure_model

                        Custom_Rectangle_Label {

                            id: measure_label
                            required property int index

                            required property string modelData

                           // width: parent.width / repeater.count //repeater.model.count

                            width: 15

                            height: parent.height
                            margin_text: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.horizontalCenterOffset: create_x(modelData, width)
                            //needBack: false
                            horizontal: Text.AlignHCenter
                            pixel_size:  ui.text_miniSize
                            text: modelData
                            color: "red"

                            function update_margin(){

                                measure_label.anchors.horizontalCenterOffset = create_x(index, modelData, width)

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
                            }

                        }

                    }

                    onWidthChanged: {

                       /* console.log("rrrrrrrrrrrrrrrrrr")
                        for(var i = 0; i < repeater.count; i++){

                            repeater.itemAt(i).update_margin()

                        } */
                    }
                }
             }
         }


    }

    Component.onCompleted: {

        create_model()

       // console.log(title + " " + count_val)
    }

}
