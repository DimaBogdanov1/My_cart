import QtQuick 2.15

ListModel{

    id: model

    ListElement{
        text: "Обычный масштаб"
        checked: true
        checkable: true
        onlyTrueCheck: true

        pick: function(value){

            y_ValueAxis.max = 100

            var arr = [1, 2]

            return update_check(value, arr, 0)

        }
    }


    ListElement{
        text: "Средний масштаб"
        checked: false
        checkable: true
        onlyTrueCheck: true

        pick: function(value){

            y_ValueAxis.max = 125

            var arr = [0, 2]

            return update_check(value, arr, 1)

        }
    }

    ListElement{
        text: "Большой масштаб"
        checked: false
        checkable: true
        onlyTrueCheck: true

        pick: function(value){

            y_ValueAxis.max = 150

            var arr = [0, 1]

            return update_check(value, arr, 2)

        }
    }

    function update_check(value, arr, index){

        if(value){

            model.set(index, {"checked": true})

            for(var i = 0; i < arr.length; i++){

                model.set(arr[i], {"checked": false})

            }

        }

        measure_Km.updatePointPosition()

        return arr

    }


}
