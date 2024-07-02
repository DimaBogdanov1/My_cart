import QtQuick 2.15
import QtQuick.Controls 2.12

import Type_Button 1.0
import Type_Content_Button 1.0

import my_components 1.0

Item {
    id: root_Item
    width: parent.width
    height: parent.height

    Custom_Picked_Block{
        id: picked_Block
        width: 500
        height: width + ui.height_Button
        color: Style.background_Color
        need_Border: true
        need_Glow: true

        anchors.centerIn: parent


        onClicked_Signal: {

            Qt.openUrlExternally("http://www.radioavionica.ru")

        }

        sourceComponent: Component{

            Item{
                width: picked_Block.width
                height: picked_Block.height

                Column {
                    width: parent.width - ui.big_spacing
                    height: parent.height - ui.big_spacing
                    anchors.centerIn: parent //smooth: false // Убираем Сглаживание

                    Item{
                        id: qr_Block
                        width: parent.width
                        height: parent.width

                        Item{
                            width: parent.width
                            height: width

                            Image {
                                width: parent.width //- ui.big_spacing
                                height: parent.height //- ui.big_spacing
                               source: "qrc:/my_components/images/company_qr_code_7.png"
                               fillMode: Image.PreserveAspectFit
                            }

                        }



                        /*Custom_Rectangle_Label{
                            width: parent.width - ui.big_spacing
                            height: parent.height - ui.big_spacing
                            anchors.centerIn: parent
                            needBack: true
                            needBorder: true
                            text: "Тут будет qr-код!"


                        }*/
                    }


                    Custom_Rectangle_Label{
                        width: parent.width
                        height: parent.height - qr_Block.height// - parent.spacing
                        pixel_size: ui.text_Values.text_MiddleSize
                        boldStyle: true

                        //color: "red"
                        //needBack: true
                        text: "АО Радиоавионика 🔥"
                    }

                }

            }


        }
    }
}
