import QtQuick 2.0
import Style 1.0

import my_components 1.0
Item {
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


    function create_model(){

        for(var i = min; i < max + step; i+= step){

          measure_model.push(i.toString())
        }

        repeater.model = measure_model
    }

    function convert_x(x_value){

        var delta_value = max - min

        var delta_x = x_finish - x_start

        var percent = (x_value - min) * 100 / delta_value


        var answer = ((delta_x * percent) / 100) + x_start


        //console.log("answer = " , answer )

        return answer
    }

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

                  Row{
                    width: parent.width
                    height:  parent.height

                    Repeater{
                        id: repeater
                        width: parent.width
                        height: parent.height
                        //model: measure_model

                        Item{
                            width: parent.width / repeater.count //repeater.model.count
                            height:  parent.height
                            required property string modelData

                            Custom_Label{
                                horizontalAlignment: Text.AlignHCenter
                                font.pixelSize: ui.text_miniSize// ui.font_weight_Smallsize

                                text: modelData

                            }
                        }

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
