import QtQuick 2.15

import History_Chart_Page 1.0
import History_Page_Names 1.0
import my_components 1.0


Item {
    id: root_Item
    width: parent.width
    height: parent.height

    signal next_Page_Signal

    History_Chart_Page{
        id: history_Page
    }



         Flickable_Page{
             id: page
             width: parent.width
             height: parent.height
             needNotification: false
             needBack: false
             title: my_str.page_Names.history_Page
             mainModel: [history_Page.top_Bars_Models.chartMain_Model]

             onBack_Page_Signal: {

                // root_Item.back_Page_Signal()
             }

             sourceComponent: Component {

                 Custom_Rectangle_Label{
                      width: page.width
                      height:  page.height
                      needBack: true
                      needBorder: true
                      text: "Тут будет страница выбора файла истории!"


                      Custom_Button{
                          width: 400

                          anchors{

                              bottom: parent.bottom
                              bottomMargin: 100
                              horizontalCenter: parent.horizontalCenter
                          }

                          text: "На старницу открытия файла проезада"

                          onClicked_Signal: {

                              next_Page_Signal()

                          }
                      }
                 }
             }

         }






}
