import QtQuick 2.15

ListModel{

    readonly property string title: qsTr("Вид")

    ListElement{
        text: qsTr("Сетка графика")
        checked: true
        checkable: true

        pick: function(value){

            level_MeasureLines.change_visible_borders(value)

            riht_Left_MeasureLines.change_visible_borders(value)

            riht_Right_MeasureLines.change_visible_borders(value)

            sample_MeasureLines.change_visible_borders(value)

            down_Left_MeasureLines.change_visible_borders(value)

            down_Right_MeasureLines.change_visible_borders(value)

            return null

        }
    }


    ListElement{
        text: qsTr("Оценка километра")
        checked: false
        checkable: true

        pick: function(value){

            if(value){

                table_Anim_open.stop()

                table_Anim_open.start()

            }
            else{

                table_Anim_close.stop()

                table_Anim_close.start()

            }

            return null

        }
    }

    ListElement{
        text: "Дополнительные параметры"
        checked: false
        checkable: true

        pick: function(value){

            animMeasure.start()


            return null

        }
    }

}
