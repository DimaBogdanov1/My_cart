import QtQuick 2.0
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Column{
    id: root_Column
    width: parent.width
    height:  parent.height //ui.block_height //ui.height_Button +  ui.text_miniSize + ui.basic_spacing / 2
    spacing: ui.basic_spacing / 2

    property string title


    property Component delegate


    property var title_name_model

    property var title_size_model

    property bool noTitle: false

    property string color:  Style.background_Color

    property int currentIndex: list.currentIndex


    property var model

    property var sort_func

    signal clickedDelegate_Signal(index: int)

    readonly property var sourceTitle_Array: [
                                               "qrc:/my_components/Lists/ListTitles/Titles_With_Menu.qml",  // "qrc:/my_components/Lists/List_Row.qml",
                                               "qrc:/my_components/Lists/ListTitles/Titles_With_Sorts.qml"
                                            ]

    property int title_Type: 0


    enum Title_Types {
           Title_Basic,
           Title_Sort_All
       }

    function get_list(){

        return list
    }

    function listModelSort(listModel, compareFunction) {

        let indexes = [ ...Array(listModel.count).keys() ]

        indexes.sort( (a, b) => compareFunction( listModel.get(a), listModel.get(b) ) )
        let sorted = 0

      //  console.log("11111111111")

        while ( sorted < indexes.length && sorted === indexes[sorted] ) sorted++

        //console.log(listModel.get(0).code)

        if ( sorted === indexes.length ) return

        for ( let i = sorted; i < indexes.length; i++ ) {
            listModel.move( indexes[i], listModel.count - 1, 1 )
            listModel.insert( indexes[i], { } )
        }

        listModel.remove( sorted, indexes.length - sorted )

      //  console.log("wwwwwwwwwwwww")

    }

    Mini_Title{
        id: title_Block
        height: !noTitle ? ui.text_miniSize : 0
        text: root_Column.title
    }

    Rectangle{
        width: parent.width
        height: !noTitle ? parent.height - title_Block.height - ui.basic_spacing / 2 : parent.height
        color: root_Column.color
        radius: ui.radius
        clip: true


        Column{
            width: parent.width //- ui.big_spacing
            height:  parent.height - ui.basic_spacing / 2
            anchors.centerIn: parent
            spacing: ui.border_Size

            Loader{
                id: title_Loader
                width: parent.width
                height: ui.height_RowList

                Component.onCompleted: {

                    source =  sourceTitle_Array[root_Column.title_Type]

                    item.model = root_Column.title_name_model

                    item.sizes = root_Column.title_size_model

                }
            }

            Connections {
                   target: title_Loader.item
                   ignoreUnknownSignals: true

                   function onNewSort_Signal(index, isAscending) {

                       toast.show("index = " + index + " isAscending = " + isAscending, 3000, 1)

                       sort(index, isAscending)

                   }
               }

            /*Titles_With_Sorts{
                id: title_Row2
                model: root_Column.title_name_model
                sizes: root_Column.title_size_model

                onNewSort_Signal: {

                    toast.show("index = " + index + " isAscending = " + isAscending, 3000, 1)

                    sort(index, isAscending)

                }
            }*/

            /*List_Row{
                id: title_Row2
                model: root_Column.title_name_model
                sizes: root_Column.title_size_model
            }*/

            Custom_Border{}

            My_List{
               id: list
               width: parent.width
               height:  parent.height - title_Loader.height - ui.border_Size * 3
               model: root_Column.model

               delegate: root_Column.delegate

               signal clickedDelegate_Signal(index: int)

               onClickedDelegate_Signal: {

                   root_Column.clickedDelegate_Signal(index)
               }

               /*delegate: List_Row{
                   listview: list
                   width: list.width
                   model: [code, name]
                   sizes: title_size_model //title_Row.sizes
                   cur: list.currentIndex

               }*/
            }
        }

    }
}
