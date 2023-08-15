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


    Rectangle{
         width: parent.width
         height:  parent.height
         radius: ui.radius_mini
         border.width: ui.border_Size
         border.color: Style.accentLight_Color
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
                     color: Style.accent_Color // Меняем Цвет Текста
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
                     color: Style.accentLight_Color
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
                                color: Style.primary_Color // Меняем Цвет Текста
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
    }

}
