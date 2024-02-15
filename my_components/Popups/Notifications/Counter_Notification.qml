import QtQuick 2.0

import Style 1.0

import my_components 1.0



Status_Indicator{
    id: label
    width: 16
    status: 1
    visible: needCounter
    y: -1 * height * 0.4
    x: parent.width - width * 2 / 3

    property int count: 12

    property bool needCounter

    onCountChanged: {

        if(count == 0 && needCounter){

            console.log("visible = " + label.visible)
            close()
        }
    }

    function open(){

        anim.from = 0

        anim.to = 1

        anim.start()

    }

    function close(){

        anim.from = 1

        anim.to = 0

        anim.start()
    }


    Custom_Label{
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize:  ui.text_miniSize
        text: count.toString()
        color: Style.background_Color

    }


    NumberAnimation {
        id: anim
        target: label
        property: "scale"
        from: 0
        to: 1
        duration: 200
    }
}

/*Custom_Rectangle_Label {
    id: label
    width: 16
    height: width

    property int count: 12


    onCountChanged: {

        if(count == 0){

            close()
        }
    }

    radius: height / 2
    y: -1 * height / 3
    x: parent.width - width * 2 / 3       //  height + height / 2
   // pixel_size: root_Item.big ? ui.text_SmallSize : 10
    //anchors.right: parent.right
    margin_text: 4
    pixel_size: 12
    text: count.toString()
    color: "#FFA300"  //"#FB4143" //Style.errorBackground_Color
    text_color: Style.background_Color

    function open(){

        anim.from = 0

        anim.to = 1

        anim.start()

    }

    function close(){

        anim.from = 1

        anim.to = 0

        anim.start()
    }


    NumberAnimation {
        id: anim
        target: label
        property: "scale"
        from: 0
        to: 1
        duration: 200
    }
}

*/
