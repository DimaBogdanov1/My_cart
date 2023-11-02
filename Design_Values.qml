import QtQuick 2.0

Item {

    // Размеры
    readonly property int width_Navigation: 72 // Ширина Навигации

   // readonly property int radius_Button: 24 // Радиус

    readonly property int radius: 16 // Радиус Маленький

    readonly property int height_Button: 40 // Высота Кнопки

    readonly property int height_RowList: 35

    readonly property int height_Big: 72

    readonly property real border_Size: 1 // Размер Границы

    readonly property int toolBar_Size: 56 // Размер Тулбара

    readonly property real block_height:  ui.height_Button + ui.basic_spacing + 2 * ui.text_miniSize //ui.height_Button + ui.basic_spacing / 2 + ui.text_miniSize

    readonly property real mini_block_height:  block_height - ui.basic_spacing / 2 - ui.text_miniSize //     readonly property real block_height:  ui.height_Button + ui.basic_spacing / 2 + ui.text_miniSize


    readonly property real block_ratio: 1.8


    /////////////////

    // Текст
    readonly property int text_miniSize: 12 // Размер Супер Маленького Текста

    readonly property int text_SmallSize: 14 // Размер Маленького Текста

    readonly property int text_MiddleSize: 18 // Размер Среднего Текста

    readonly property int text_BigSize: 24 // Размер Большого Текста

    readonly property int font_weight_Smallsize: Font.Medium

    readonly property int font_weight_Bigsize: Font.Bold

    ////////////////////////

    //Иконки
    readonly property int iconBlock_Size: 34 // Размер Блока Иконки

    readonly property int icon_nav_size: 28 // Размер Иконок Навигации

    readonly property int iconBlock_topBar_Size: 34 // Размер Иконок Топ Бара

    ////////////////////////////

    //Отступы

    readonly property int big_spacing: 24 // Отступы Верхней Навигации

    readonly property int middle_spacing: 16 //

    readonly property int basic_spacing: 12 //


    // График
    readonly property int line_width: 2 // Ширина Линии Графика

    // Клавиатура
    readonly property real size_Keyboard_Russia: 96 //(parent.width - ui.width_Navigation - ui.basic_spacing  )/ 11//96 // Русская Буква

    readonly property real size_Keyboard_English: size_Keyboard_Russia * 11 / 10 // Английская Буква
}

