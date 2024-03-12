import QtQuick 2.15
import QtQuick.Controls 2.15

import Style 1.0
import my_components 1.0

Item{
    id: root_Item
    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width
        height: parent.height
        color: Style.background_Color

        Column{
          width: parent.width
          height: parent.height
          spacing: ui.basic_spacing

          Custom_Rectangle_Label{
              width: parent.width
              height: ui.toolBar_Size
              color: "red"
              needBack: true
              text: "Блок для топ бара тестовый так-то он будет с контейнера подтягиваться"

          }

          Custom_Rectangle_Label{
              width: parent.width
              height: 96
              color: "blue"
              needBack: true
              text: "Блок для сторисов"
          }

          Row{
              width: parent.width
              height: 300
              spacing: ui.basic_spacing

              Custom_Rectangle_Label{
                  id: test_Block1
                  width: 550
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Блок для послених марщрутов"
              }

              Custom_Rectangle_Label{
                  width: parent.width - test_Block1.width - parent.spacing
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Блок для диагностики"
              }
          }


          Row{
              width: test_Block1.width
              height: 40
              spacing: ui.basic_spacing

              Custom_Rectangle_Label{
                  width: parent.width / 2 - parent.spacing / 2
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Новый маршрут из БПД"
              }

              Custom_Rectangle_Label{
                  width: parent.width / 2 - parent.spacing / 2
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Новый пользовательский марщрут"
              }
          }

          Row{
              width: parent.width
              height: 200
              spacing: ui.basic_spacing

              Custom_Rectangle_Label{
                  id: map
                  width: 300
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Карта"
              }

              Custom_Rectangle_Label{
                  width: parent.width - map.width - help.width - parent.spacing * 2
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Блок для памяти"
              }

              Custom_Rectangle_Label{
                  id: help
                  width: 200
                  height: parent.height
                  color: "orange"
                  needBack: true
                  text: "Блок для быстрой помощи qr"
              }
          }







        }
    }

    Column{
        anchors.bottom: parent.bottom
      width: parent.width
      height: ui.height_Button * 9 + spacing * 8
      spacing: 10

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Последние маршруты"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Создадим маршрут из бд либо кастомный (как вариант можем предложить сразу ввести имя маршщрута)"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Переход в историю по виду обработки и по отчетному периоду"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Память Файлы проезда, файлы БПД, графические диаграммы (При клике будет возможность закинуть это всё на флешку как вариант)"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Диагностика"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Карта ??"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Подсказки (Если хочешь делать стильно запихни подсказки в сторисы)"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Быстрыйц хелп типо я пришел на станцию и я туплю мне нужно получить поддержку и сканирую qr-код и звоню в радиоавионику"
      }

      Custom_Rectangle_Label{
          height: ui.height_Button
          text: "Обновление приложения (но это можно и после сплэша)"
      }
    }


}

