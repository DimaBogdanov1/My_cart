import QtQuick 2.15

ListModel{

    readonly property string title: qsTr("Основные")

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

    ListElement{
        text: "Завершить проезд"
        source: "qrc:/icons/light_theme/top_bar/export.svg"
        checked: false
        checkable: false

        pick: function(value){
            toast.show("Завершить проезд", 3000, 1)

            return null

        }


    }

}
