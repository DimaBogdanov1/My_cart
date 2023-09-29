import QtQuick 2.15

ListModel{

    ListElement{
        text: "Экспорт"
        source: "qrc:/icons/light_theme/top_bar/export.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Экспорт", 3000, 1)
        }


    }

    ListElement{
        text: "Сетка"
        source: ""
        checked: true
        checkable: true

        pick: function(value){

            visibleBorders_Signal(value)

        }
    }

    ListElement{
        text: "Сохранять график километра"
        source: ""
        checked: true
        checkable: true

        pick: function(value){

            toast.show("Сохранять график", 3000, 1)

        }
    }

    ListElement{
        text: "Фото"
        source: "qrc:/icons/light_theme/home_page/pencil.svg"
        checked: false
        checkable: false

        pick: function(value){

            grab_Signal()

        }

    }
}
