import QtQuick 2.15

ListModel{

    ListElement{
        text: "Пикет"
        source: "qrc:/icons/light_theme/top_bar/plus.svg"
        checked: false
        checkable: false

        pick: function(value){
            Chart_Work.add_New_Picket()

            return null

        }


    }

    ListElement{
        text: "Объект 1"
        source: "qrc:/icons/light_theme/top_bar/plus.svg"
        checked: false
        checkable: false

        pick: function(value){

            toast.show("Объект 1", 3000, 1)

            return null


        }
    }

    ListElement{
        text: "Объект 2"
        source:  "qrc:/icons/light_theme/top_bar/plus.svg"
        checked: false
        checkable: false

        pick: function(value){

            toast.show("Объект 2", 3000, 1)

            return null


        }
    }

    ListElement{
        text: "Объект 3"
        source: "qrc:/icons/light_theme/top_bar/plus.svg"
        checked: false
        checkable: false

        pick: function(value){

            toast.show("Объект 3", 3000, 1)

            return null


        }

    }
}
