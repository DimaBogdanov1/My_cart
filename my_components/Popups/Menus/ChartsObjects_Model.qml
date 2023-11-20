import QtQuick 2.15

ListModel{

    ListElement{
        text: "Километр"
        source: "qrc:/icons/light_theme/top_bar/plus.svg"
        checked: false
        checkable: false

        pick: function(value){

            measure_Km.create_KmLine(5, "257", true, 1, false)

           // Chart_Work.create_KmLine()

            return null

        }


    }

    ListElement{
        text: "Тест"
        source: "qrc:/icons/light_theme/top_bar/plus.svg"
        checked: false
        checkable: false

        pick: function(value){

            measure_Km.create_KmLine(5, "258", true, 2, true)

         //   measure_Km.create_KmLine(5, 110)

          //  toast.show("Тест", 3000, 1)

         //   measure_Km.create_KmLine(50, 20, 50)

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
