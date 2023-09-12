import QtQuick 2.15
import QtGraphicalEffects 1.0

import Style 1.0
import my_components 1.0

RectangularGlow {
     property var target

     anchors.fill: target
     glowRadius: 8
     spread: 0 //0.02
     color: Style.accent_Color
     opacity: 0
     cornerRadius: target.radius + glowRadius


     function change_glow(value){

         if(value){

             opacity_Anim.open_anim()

         }
         else{

             opacity_Anim.close_anim()

         }
     }


     Opacity_Anim{
         id: opacity_Anim
         animation_target: parent
     }
 }
