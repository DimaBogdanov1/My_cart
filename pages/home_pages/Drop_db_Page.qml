import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

import Style 1.0
import MyLang 1.0
import my_components 1.0

Rectangle {
    width: parent.width
    height: parent.height
    color: Style.primary_Color


    function open_database(path){

        var rep_path = path.replace(/^(file:\/{2})/,"")

        console.log("You chose: " + path)

        big_db.openDatabase(rep_path)

        index_swipe_Home = 1 // Переходим На Составление Задания
        //index_Page = 1
    }

    Rectangle{
         width: parent.width < 1000 ? parent.width * 0.6 : 600
         height: width / 2
         anchors.centerIn: parent
         radius: ui.radius
         color: "transparent"

         border{
             width: ui.border_Size
             color: Style.light_Color // Style.secondaryAccent_Color
         }


         DropArea {
             id: dropArea;
             anchors.fill: parent

             onEntered: {

                // drag.accept (Qt.LinkAction);
                checkfile()

             }
             onDropped: {

                 open_database(drop.urls.toString())

                 toast.show("drop", 3000, 1) // Показываем Тоcт
             }

             function checkfile(){

                 var validFile = false;

                 for(var i = 0; i < drag.urls.length; i++) {

                   if(validateFileExtension(drag.urls[i])) {
                     validFile = true;
                     break;
                   }
                 }

                 if(!validFile) {
                   drag.accepted = false;
                   return false;
                 }
             }

             function validateFileExtension(filePath) {
                 return filePath.split('.').pop() === "db"
             }


         }

         Hover_Anim{
             id: hover_Anim
             width: parent.width
             height: parent.height

             onClicked_Signal: {

                 fileDialog.open()

             }
         }

         Column{
             width: parent.width
             height:60
             anchors.centerIn: parent
             spacing: 16

             Image {
                sourceSize.width: ui.icon_nav_size //35// ui.icon_nav_size
                sourceSize.height:  ui.icon_nav_size //35 //ui.icon_nav_size
                source: "qrc:/icons/light_theme/home_page/arrow_top.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: false // Убираем Сглаживание
                fillMode: Image.TileVertically
             }

             Item{
                width: parent.width
                height: parent.height - ui.icon_nav_size - 16

                 Custom_Label{
                     horizontalAlignment: Text.AlignHCenter
                    // font.pixelSize:  ui.text_MiddleSize // Меняем Размер Шрифта
                     color: Style.light_Color // Меняем Цвет Текста
                     text: qsTr("Перетащите вашу базу данных") + mytrans.emptyString

                 }
             }


         }

         FileDialog {
             id: fileDialog
             title: qsTr("Выберите базу данных") + mytrans.emptyString
             folder: shortcuts.documents
             nameFilters: ["(*.db)"]; // Фильтр Для Расширений Файлов

             onAccepted: {

                //clear_list()

                 open_database(fileDialog.fileUrls.toString())

             }

             onRejected: {
                 console.log("Canceled")

             }

         }
    }
}
