import QtQuick 2.15

Item {
id: root_Item
width: parent.width
height: parent.height
clip: true

property int tmp_Index: 0

property bool isNext

property int lastIndex

property var model: [
                                           "qrc:/my_components/Page_Components/test_Page/Page_1.qml",
                                           "qrc:/my_components/Page_Components/test_Page/Page_2.qml",
                                           "qrc:/my_components/Page_Components/test_Page/Page_3.qml"
                                        ]

function open_back(cur_index, index){

    isNext = false

    tmp_Index = index + 1

    if(tmp_Index != 0 && !animation.running){


        secondLoader.source = model[cur_index]

        tmp_Index--

        firstLoader.source = model[index]


        change_source(isNext, index)

    }

    return tmp_Index
}

function open_next(index){

    isNext = true

    tmp_Index = index - 1

    if(tmp_Index != model.length && !animation.running){

        firstLoader.source = model[tmp_Index]

        tmp_Index++

     secondLoader.source = model[tmp_Index]

       change_source(isNext, index)
    }

    return tmp_Index

}

function change_source(cur_index){


    if(isNext){

        // firstLoader.source = model[2]

        // secondLoader.source = model[2]

         animation.from = root_Item.width

         animation.to = 0


        // animation.running = true

        //console.log("next   lastIndex = " + lastIndex + " sub_index_HomePage = " + tmp_Index )

    }
    else{

        //  firstLoader.source = model[tmp_Index]

        //  secondLoader.source = model[lastIndex]

          animation.from = 0

          animation.to = root_Item.width

         // console.log("back   lastIndex = " + lastIndex + " sub_index_HomePage = " + tmp_Index )

    }

    /*if(tmp_Index > cur_index){

       // firstLoader.source = model[2]

       // secondLoader.source = model[2]

        animation.from = root_Item.width

        animation.to = 0


       // animation.running = true

       //console.log("next   lastIndex = " + lastIndex + " sub_index_HomePage = " + tmp_Index )

    }


    else{

        if(tmp_Index < cur_index){

          //  firstLoader.source = model[tmp_Index]

          //  secondLoader.source = model[lastIndex]

            animation.from = 0

            animation.to = root_Item.width

           // console.log("back   lastIndex = " + lastIndex + " sub_index_HomePage = " + tmp_Index )


        }

    }*/


    animation.stop()

    animation.start()



    lastIndex = tmp_Index
}


    Loader{
        id: firstLoader
        width: parent.width
        height: parent.height
    }

    Loader{
        id: secondLoader


        width: parent.width
        height: parent.height
        // source: model[tmp_Index]
        Component.onCompleted: source = model[tmp_Index]   // sub_index_HomePage =  1 //2//1 //source = model[index_Page]

     }

    NumberAnimation {
        id: animation
        target: secondLoader.item
        property: "x"
        from: root_Item.width
        to: 0
        duration: 700
        //easing.type: Easing.InQuint

        onRunningChanged: {

            if(!running){

                if(!isNext){

                    secondLoader.source = ""
                }
                else{

                    firstLoader.source = ""

                }
            }
        }

       // easing.type: Easing.InExpo
    }





}
