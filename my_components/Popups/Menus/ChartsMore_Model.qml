import QtQuick 2.15

ListModel{

    ListElement{
        text: "Экспорт"
        source: "qrc:/icons/light_theme/top_bar/export.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Экспорт", 3000, 1)

            return null

        }


    }

    ListElement{
        text: "Сетка"
        checked: true
        checkable: true

        pick: function(value){

            speed_MeasureLines.change_visible_borders(value)

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
        text: "Сохранять график километра"
        checked: true
        checkable: true

        pick: function(value){

            toast.show("Сохранять график", 3000, 1)

            return null

        }
    }

    ListElement{
        text: "Срез данных"
        checked: false
        checkable: true

        pick: function(value){

            if(value){

                Chart_Work.get_points_line(measure_Viser.value * 100)

            }

            measure_Viser.show_hide_viser(value)

            viser_Line.show_hide_viserLine(value)
            //viser_Signal(value)

            return null


        }
    }

    ListElement{
        text: "Фото"
        source: "qrc:/icons/light_theme/home_page/pencil.svg"
        checked: false
        checkable: false

        pick: function(value){

            charts_Item.grabToImage(function(result) {
                            result.saveToFile("/Users/Shared/example.png")
                        });

            return null

        }

    }
}
