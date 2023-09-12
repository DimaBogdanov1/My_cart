import QtQuick 2.0
import Qt.labs.settings 1.0
import MyLang 1.0

Settings { // Делаем Настройки Приложения

    property bool tablet_mode: true

    property bool dark_mode: false


    Component.onCompleted: {

        Style.change_theme(dark_mode)
    }
}
