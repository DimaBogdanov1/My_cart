pragma Singleton // Указываем, Что Этот QML Тип Является Синглтоном (Также Это Указывается В Файле qmldir)
import QtQuick 2.0
import QtQml 2.2

Item{

    property alias themes: themes

    function change_theme(dark_mode){

        if(!dark_mode){

            currentTheme = themes.light_theme // Включаем Светлую Тему
        }
        else{

            currentTheme = themes.test_dark_theme // Включаем Тёмную Тему

        }
    }

    readonly property string orange_Color: "#E05C60"//"#DF6C61"//"#E05C60"
    readonly property string orangeLight_Color: "#FAD5C7"
    readonly property string blue_Color: "#413B63"
    readonly property string dark_blue_Color: "#2C2348"
    readonly property string body_Color: "#FEF1EA"
    readonly property string white: "#FFFFFF"
    readonly property string yellow_Color: "#F69F22"



    readonly property string light_grey: "#121212" //#010219

    readonly property string light_blue: "#777DE8"


    QtObject{ // Создаём Объект С Темами
        id: themes

        readonly property var light_2: [
            "#6f6bf9", // Акцент Цвет
            "#a29fff",  // Лёгкий Акцент
            "#1d1956", // Цвет Текста Приложения
            "#aaa9e2", // Дополнительный Цвет Текста
            "#f2f2fc", // Цвет Фона Приложения #f8f9fb efedf7
            "#f2f2fc", // Цвет Фона Карточек // d4d3ee  f2f2fc
            "#ffffff", // Цвет Фона Контетна
            "#ceccfd",  // Цвет Фона Для Иконок // d4d3ee
            "#ffffff", // Основной Цвет Темы (Белый)
            "#efedf7", // Цвет Для Фона Карточек (Дополнительный)
            "#f2f2fc", // Цвет Для Графика
            "#f2f2fc", // Цвет Фона Настроек
            "#ceccfd", // Цвет Фона Прогресс Бара
            "#1d1956", // Цвет Затемнения
            "#f2f2fc", // Цвет Разделителя


        ] // Светлая Тема

        readonly property var dark: [
            "#a29fff", // Акцент Цвет
            "#ceccfd", // Лёгкий Акцент
            "#e6e6e6", // Цвет Текста Приложения
            "#d4d2dd", // Дополнительный Цвет Текста
            "#121212", // Цвет Фона Приложения
            "#121212", // Цвет Фона Карточек
            "#272727", // Цвет Фона Контетна // 121212 // 151418 // 1f1f1f // 1A1A27 // 282534 //  1b1827 // 272727
            "#a29fff",  // Цвет Фона Для Иконок
            "#121212", // Основной Цвет Темы (Чёрный)
            "#efedf7", // Цвет Для Фона Карточек (Дополнительный)
            "#d4d3ee", // Цвет Для Графика
            "#363636", // Цвет Фона Настроек
            "#f2f2fc", // Цвет Фона Прогресс Бара
            "#e6e6e6", // Цвет Затемнения
            "#e6e6e6", // Цвет Разделителя




        ]  // Тёмная Тема

        readonly property var light_theme: [
            orange_Color, // Акцент Цвет
            orangeLight_Color, // Лёгкий Акцент
            dark_blue_Color,  // Цвет Текста
            blue_Color,
            body_Color, // Лёгкий Цвет
            white, // Цвет Фонов
            yellow_Color, // Акцент Цвет 2

            dark_blue_Color

        ]  // Тестовая Тема

        readonly property var test_dark_theme: [
            "#FEC980", // Акцент Цвет
            "#0F0909", // Лёгкий Акцент
            light_grey,  // Цвет Текста
             "#FFF3E3",
            "#F7F6FB", // Лёгкий Цвет
            white, // Цвет Фонов
            "#6f6bf9", // Акцент Цвет 2


              light_grey,  // Цвет



        ]  // Тестовая Тема
    }

    property var currentTheme: themes.test_dark_theme // Переменная Для Хранения Текущей Темы Приложения



    property string theme: "light_theme"

    // #f794a4 → #fdd6bd
    // #ec6f66 → #f3a183 #ff5f6d → #ffc371 #2193b0 #6dd5ed    ( FE8373 FBE99D ) ("#ffafbd" , "#ffc3a0")
    readonly property string accent_Color: "#ffafbd" //currentTheme[0] // Акцент Цвет

    readonly property string secondaryAccent_Color: "#ffc3a0" // Акцент Цвет 2

    readonly property string accentLight_Color: currentTheme[1] // Лёгкий Акцент

    readonly property string primaryDark_Color: currentTheme[2] // Цвет Текста Приложения

    readonly property string primary_Color: currentTheme[3] // Основной Цвет

    readonly property string light_Color: currentTheme[4] // Лёгкий Цвет

    readonly property string background_Color: currentTheme[5] // Цвет Фонов

    readonly property string navigation_Color: currentTheme[7]





    readonly property string accountText_Color: "white" //"#afa56f" // Цвет Фона Для Предупредительного Действия

    readonly property string agreeBackground_Color: "#e3f8e6" //"#d8ffd7" // Цвет Фона Для Положительного Действия
    readonly property string agree_Color: "#1d8628" //"#7ae464" // Цвет Для Положительного Действия


    readonly property string warningBackground_Color: "#ffeecb" //"#fff6ca" // Цвет Фона Для Предупредительного Действия
    readonly property string warning_Color: "#9f7c44" //"#afa56f" // Цвет Фона Для Предупредительного Действия

    readonly property string errorBackground_Color:  "#ffd5df" // Цвет Фона Для Ошибочного Действия
    readonly property string error_Color: "#c7516b" // Цвет Для Ошибочного Действия

    readonly property string infoBackground_Color:  "#dfe7ff" // Цвет Фона Для Информационного Действия
    readonly property string info_Color: "#236ed1" // Цвет Для Информационного Действия


}
