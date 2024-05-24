import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Material.impl 2.12 // Библиотека Для Эффекта Высоты
import QtQml.Models 2.2
import QtQml 2.2
 // Импорт QML синглетона



Rectangle {

    function show(text, duration, status) {

        message.text =  text  // Меняем Текст Тоста

        switch (status){

            case 1: // Положительный Статус

                root.color = Style.agreeBackground_Color // Меняем Фон Тоста

                message.color = Style.agree_Color // Меняем Цвет Текста


                break

            case 2: // Предупреждающий Статус

                root.color = Style.warningBackground_Color // Меняем Фон Тоста

                message.color = Style.warning_Color // Меняем Цвет Текста

                break

            case 3: // Опасный Статус

                root.color = Style.errorBackground_Color // Меняем Фон Тоста

                message.color = Style.error_Color // Меняем Цвет Текста

                break
        }

        animation.start(); // Запускаем Анимацию
    }

    property bool selfDestroying: false  // whether this Toast will self-destroy when it is finished

    id: root

    readonly property real defaultTime: 3000
    property real time: defaultTime
    readonly property real fadeTime: 250

    anchors {
        left: parent.left
        right: parent.right

    }

    height:  48 //ui.height_RowWithIcon
    radius:  16 //ui.radius_Card

    opacity: 0
    color: Style.agreeBackground_Color

    Row { // Создаём Строку С Тостом
        width: message.width
        height:  parent.height
        anchors.centerIn: parent

        Item { // Создаём Блок С Текстом
            width: parent.width
            height: parent.height

            Label {
                id: message
                font.weight: Font.Light
                font.family: custom_FontLoader.name
                font.pixelSize: 10 // Меняем Размер Шрифта
                color: Style.agree_Color
                wrapMode: Text.WordWrap
                anchors.centerIn: parent

            }

        }

    }





    SequentialAnimation on opacity {
        id: animation
        running: false


        NumberAnimation {
            to: 0.9
            duration: fadeTime
        }

        PauseAnimation {
            duration: time - 2 * fadeTime
        }

        NumberAnimation {
            to: 0
            duration: fadeTime
        }

        onRunningChanged: {
            if (!running && selfDestroying) {
                root.destroy();
            }
        }
    }
}
