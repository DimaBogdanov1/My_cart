import QtQuick 2.15

ListModel{

    readonly property string title: qsTr("Основные")


    ListElement{
        text: qsTr("Сохранить маршрут")
        source: "qrc:/icons/light_theme/utils/saved.svg"
        checked: false
        checkable: false

        pick: function(value){

            toast.show("Сохранить маршрут", 3000, 1)

            return null

        }

    }

    ListElement{
        text: qsTr("Загрузить маршрут")
        source: "qrc:/icons/light_theme/utils/download.svg"
        checked: false
        checkable: false

        pick: function(value){

            toast.show("Сохранить маршрут", 3000, 1)

            return null

        }

    }

    ListElement{
        text: qsTr("Удалить маршрут")
        source: "qrc:/icons/light_theme/utils/trash.svg"
        checked: false
        checkable: false
        isNegative: true

        pick: function(value){

            toast.show("Удалить маршрут", 3000, 1)

            return null

        }


    }

}
