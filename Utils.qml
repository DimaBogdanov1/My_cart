import QtQuick 2.15
import QtQuick.Dialogs 1.0
import QtQuick.Controls 2.1
Item {
    focus: true

    Keys.onPressed: {

        if (event.key === Qt.Key_T && event.modifiers === Qt.ControlModifier) {
            toast.show("Шорт кат", 3000, 1) // Показываем Тоcт
              event.accepted = true
            }

        switch(event.key){
            case Qt.Key_1:

                toast.show("Новый Пикет", 3000, 1) // Показываем Тоcт
            }



    }

    Shortcut {
          context: Qt.ApplicationShortcut
          sequence: "Ctrl+W"

           onActivated: toast.show("Новый Пикет", 3000, 1) // Показываем Тоcт


       }


    function openFileDialog(){

        fileDialog.open()
    }





    // Создаём Объект Для Показа Тостов
   ToastManager {
        id: toast
    }
}
