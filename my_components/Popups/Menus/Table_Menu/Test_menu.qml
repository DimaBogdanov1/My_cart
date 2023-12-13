import QtQuick 2.15

ListModel{

    id: model

    readonly property string title: qsTr("Сортировка")

    ListElement{
        text: "По возрастанию даты"
        source: "qrc:/icons/light_theme/utils/arrow_top_mini.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Дата по возрастанию ", 3000, 1)

            return null

        }


    }

    ListElement{
        text: "По убыванию даты"
        source: "qrc:/icons/light_theme/utils/arrow_bottom_mini.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Дата по убыванию ", 3000, 1)

            return null

        }


    }


    ListElement{
        text: "По возрастанию пути"
        source: "qrc:/icons/light_theme/utils/arrow_top_mini.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Дата по возрастанию ", 3000, 1)

            return null

        }


    }

    ListElement{
        text: "По убыванию пути"
        source: "qrc:/icons/light_theme/utils/arrow_bottom_mini.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Дата по убыванию ", 3000, 1)

            return null

        }


    }

}
