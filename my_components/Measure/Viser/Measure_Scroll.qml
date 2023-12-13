import QtQuick 2.15

import Style 1.0

import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    readonly property real opacity_val: 0.7

    property real anchors_value: -1 * (block_Item.width + ui.basic_spacing / 2)

    MouseArea{
        anchors.fill: parent
        property bool checkButton: true

        onDoubleClicked: {

            toast.show("Дабл клик", 3000, 1)

            if(!checkButton){

             //scrollButton_Anim.from = block_Item.acnvhor ui.basic_spacing / 2

             scrollButton_Anim.to = root_Item.anchors_value

             checkButton = true

            }
             else{

//               scrollButton_Anim.from = -1 * (block_Item.width + ui.basic_spacing / 2)


               scrollButton_Anim.to = ui.basic_spacing / 2

               checkButton = false

            }

         //   measure_Viser.show_hide_viser(!checkButton)

            viser_Line.show_hide_viserLine(!checkButton)

            scrollButton_Anim.stop()

            scrollButton_Anim.start()

            chart_anim.change_Pause(checkButton, y_0)

        }


        onPositionChanged: {

           // console.log("y mouse = " + mouse.y)

            // console.log(cp.y)


            if(!checkButton){

                var p = Qt.point(mouse.x, mouse.y);

                var cp = chartView.mapToValue(p, chartView.series("") );

                console.log("chartView.drop_value = " + chartView.drop_value)

                if(chartView.drop_value <= cp.y && cp.y <= y_0){

                    //var value = mouse.y * 100 / root_Item.height

                    viser_Line.update_ViserLine(cp.y    ) // (100 - value)

                    var result = level_MeasureBlock.convert_x(level_MeasureLines.get_x_viser(cp.y), false)

                    level_MeasureBlock.value = result.toFixed(3)

                    console.log("result = " + result)

                    //Chart_Work.get_points_line(value * 100)

                    //toast.show("Переставляем визер y = " + value, 3000, 1)

                }
                else{

                   toast.show("Тут нет значений!", 3000, 1)

                }


            }


        }
    }


    Item{
        id: block_Item
        width: ui.iconBlock_topBar_Size
        height: 2 * ui.iconBlock_topBar_Size + ui.basic_spacing


        anchors {
           verticalCenter: parent.verticalCenter
           right: parent.right
           rightMargin: root_Item.anchors_value
        }

        Column{
            width: parent.width
            height: parent.height
            spacing: ui.basic_spacing

            Custom_Icon_Button{
                isNeedRectangle: true
                color_rec: Style.light_Color
                rotation: -90
                opacity: root_Item.opacity_val
                icon_path: "qrc:/icons/" + Style.theme + "/utils/arrow_right.svg"

                onClicked_Signal: {

                    if(!chart_anim.checkScroll){

                        chart_anim.create_Scroll_on_Pause(chart_Rectangle.height / 10, true)

                    }
                    else{

                        toast.show("график не на паузе!!!", 3000, 1)
                    }
                }
            }

            Custom_Icon_Button{
                isNeedRectangle: true
                color_rec: Style.light_Color
                rotation: 90
                opacity: root_Item.opacity_val
                icon_path: "qrc:/icons/" + Style.theme + "/utils/arrow_right.svg"

                onClicked_Signal: {

                    if(!chart_anim.checkScroll){

                        chart_anim.create_Scroll_on_Pause(chart_Rectangle.height / 10, false)

                    }
                    else{

                        toast.show("график не на паузе!!!", 3000, 1)

                    }
                }
            }
        }

    }


    NumberAnimation {id: scrollButton_Anim; target: block_Item; property: "anchors.rightMargin"; from: block_Item.anchors.rightMargin; to: ui.basic_spacing / 2; duration: 250 }

}


