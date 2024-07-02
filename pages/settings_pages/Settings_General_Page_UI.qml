import QtQuick 2.15

import my_components 1.0

Column {
    width: parent.width
    height: parent.height
    spacing: ui.middle_spacing


    Custom_Block_With_Title{
        id: theme_Block
        title: "Цветовое оформление"
        height: 200
        sourceComponent: Component{


            Column{
                width: theme_Block.width
                height: theme_Block.height

                Row{
                    width:  parent.width
                    height: parent.height
                    anchors.right: parent.right
                    spacing: ui.basic_spacing

                    Theme_Block{
                        id: light_Theme
                        width:  parent.width / 3 - parent.spacing * 2 / 3
                        height: parent.height
                        radius: theme_Block.radius_inside
                        pick: true
                        text: qsTr("Светлая")

                        onClicked_Signal: {

                            Style.change_theme(false)

                            update_pick(true)

                            dark_Theme.update_pick(false)

                            os_Theme.update_pick(false)

                        }
                    }

                    Theme_Block{
                        id: dark_Theme
                        width:  parent.width / 3 - parent.spacing * 2 / 3
                        height: parent.height
                        radius: theme_Block.radius_inside
                        text: qsTr("Тёмная")

                        onClicked_Signal: {

                            Style.change_theme(true)

                            update_pick(true)

                            light_Theme.update_pick(false)

                            os_Theme.update_pick(false)
                        }
                    }

                    Theme_Block{
                        id: os_Theme
                        width:  parent.width / 3 - parent.spacing * 2 / 3
                        height: parent.height
                        radius: theme_Block.radius_inside
                        text: qsTr("Автоматически")

                        onClicked_Signal: {

                            update_pick(true)

                            light_Theme.update_pick(false)

                            dark_Theme.update_pick(false)
                        }

                    }


            }

            }


        }
    }


    Custom_Row_ComboBox{
        width: parent.width
        //height: 96 //ui.block_height + ui.height_MiniTitle * 2 + ui.basic_spacing
        needIcon: false

        property var width_TrackModel: ["Действие 1", "Действие 2", "Действие 3"]

        model: [
            { title: "Программируемая кнопка", combo_model: width_TrackModel, picked_index: 0}
        ]


    }

    Custom_Row_ComboBox{
        width: parent.width
        //height: ui.block_height  //ui.block_height + ui.height_MiniTitle * 2 + ui.basic_spacing
        needIcon: false

        property var model_lang: ["Русский", "Английский"]

        model: [
            { title: "Язык", combo_model: model_lang, picked_index: 0}
        ]


    }


    /*Custom_Block_With_Title{
        id: prog_Button_Block
        title: "Программируемая кнопка"
        height: ui.block_height
        sourceComponent: Component{


            Column{
                width: prog_Button_Block.width
                height: prog_Button_Block.height

            }

        }


    } */


}
