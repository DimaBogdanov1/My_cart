import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2

import Style 1.0 // Импорт QML синглетона
import my_components 1.0

CheckBox {

    checked: false

   // text: "Check Box"
    style: CheckBoxStyle {
        indicator:

            Rectangle {
                implicitWidth: ui.icon_nav_size
                implicitHeight: implicitWidth
                radius: ui.radius
                //border.color:  Style.primaryDark_Color //control.activeFocus ? "darkblue" : "gray"
                //border.width: 1

                property bool isChecked: control.checked

                onIsCheckedChanged: {

                    if(isChecked){

                        opacity_Anim.open_anim()
                    }
                    else{

                        opacity_Anim.close_anim()

                    }
                }

                Rectangle {
                    id: bg_Rectangle
                    width: parent.width
                    height: parent.height
                    radius: ui.radius
                    layer.enabled: true
                    layer.effect: Mask_Rectangle{target: bg_Rectangle}

                    Main_Gradient{}

                    Custom_Rectangle_Label {
                        width: parent.width
                        height: parent.height
                        needBack: false
                        //text_color: Style.background_Color
                        text: "✓"

                    }

                    Component.onCompleted: {

                        if(control.checked){

                            bg_Rectangle.opacity = 1
                        }
                        else{

                            bg_Rectangle.opacity = 0

                        }
                    }
                }

                Opacity_Anim{
                  //  id: opacity_Anim
                    animation_target: bg_Rectangle

                }

                Highlight_Anim{
                    id: opacity_Anim
                    animation_target: bg_Rectangle
                }


        }


    }

}
