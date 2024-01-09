import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Controls 2.15

import Style 1.0



/*

style : enumeration
This read-only property gives access to the style of the map type.

MapType.NoMap - No map.
MapType.StreetMap - A street map.
MapType.StreetMap - A map with day-time satellite imagery.
MapType.SatelliteMapNight - A map with night-time satellite imagery.
MapType.TerrainMap - A terrain map.
MapType.HybridMap - A map with satellite imagery and street information.
MapType.GrayStreetMap - A gray-shaded street map.
MapType.PedestrianMap - A street map suitable for pedestriants.
MapType.CarNavigationMap - A street map suitable for car navigation.
MapType.CycleMap - A street map suitable for cyclists.
MapType.CustomMap - A custom map type.
*/

Rectangle{
    id: root_Rectangle
     width: parent.width
     height:  parent.height
     radius: ui.radius
     color: Style.background_Color

     layer.enabled: true
     layer.effect: Mask_Rectangle{target: root_Rectangle; radius: root_Rectangle.radius}

     property real start_width

     property real start_height

     property int time_anim: 500

     property bool isCheck: false



     Map {
         id: map
         anchors.fill: parent
         copyrightsVisible: false
         zoomLevel: 16
        //  activeMapType:MapType.GrayStreetMap


         center: QtPositioning.coordinate(59.9386300, 30.3141300) //positionSource.position.coordinate

         plugin: Plugin {
            id: osmPlugin
            name: "osm"

         }


         MouseArea {
         anchors.fill: parent
          onClicked: {

             var latitude_point = map.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude // Считываем Широту Точки

             var longitude_point = map.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude // Считываем Долготу Точки

             console.log(latitude_point, " " + longitude_point)
         }
     }

         MapPolyline {
            id: line
            line.width: 3
            line.color:   Style.secondaryAccent_Color
            path: [
                { latitude:  59.93817932266637, longitude:  30.312217584972302 },

                   { latitude:   59.938635685072356 , longitude:  30.312498546368516 }

            ]

            Component.onCompleted: {

               // line.addCoordinate(QtPositioning.coordinate(map.center.latitude / 2, map.center.longitude / 15))

                line.addCoordinate(map.center)
            }
         }

         MapQuickItem{
             id: cart_Marker
             rotation: 0

             coordinate:  QtPositioning.coordinate(59.9386300, 30.3141300) //map.center // QtPositioning.coordinate(map.center., longitude)
             anchorPoint.x: cart_Marker.width / 2
             anchorPoint.y: cart_Marker.height / 2
             sourceItem: Image{
                 source: "qrc:/icons/light_theme/utils/send.svg"
                 sourceSize.width: 40
                 sourceSize.height: 40

             }



            CoordinateAnimation {
                id:anim_Coord
                target: cart_Marker
                property: "coordinate"
            }

            function start_anim(next_Position){

                anim_Coord.stop()
                anim_Coord.from = cart_Marker.coordinate
                anim_Coord.to = next_Position
                anim_Coord.duration = 10
                anim_Coord.start()
            }


         }

         Button{
             width: 30
             height: 30
             anchors.right: parent.right
             anchors.top: parent.top


            // text:  qsTr("Пауза для скрола") + mytrans.emptyStrin

             onClicked: {

                 if(!isCheck){

                     width_anim.to = root_Rectangle.parent.width

                     height_anim.to = root_Rectangle.parent.height

                     radius_anim.to = 0

                     marginLeft_anim.to = 0

                     marginBottom_anim.to = 0

                     isCheck = true

                 }
                 else{

                     width_anim.to = start_width

                     height_anim.to = start_height

                     radius_anim.to = ui.radius

                     marginLeft_anim.to = ui.big_spacing / 2

                     marginBottom_anim.to = ui.big_spacing / 2


                     //map.start_anim(cart_Marker.coordinate)

                     //map.center = cart_Marker.coordinate

                     isCheck = false

                 }

                 //anim.stop()

                 anim.start()


             }

         }

         SequentialAnimation{

             id: anim

             ParallelAnimation{

                 NumberAnimation {id: radius_anim; target: root_Rectangle;  property: "radius"; from: root_Rectangle.radius; to: 0; duration: 100}

                 NumberAnimation {id: marginLeft_anim; target: root_Rectangle;  property: "anchors.leftMargin"; from: root_Rectangle.anchors.leftMargin; to: 0; duration: 100}

                 NumberAnimation {id: marginBottom_anim; target: root_Rectangle;  property: "anchors.bottomMargin"; from: root_Rectangle.anchors.bottomMargin; to: 0; duration: 100}

             }

             ParallelAnimation{

                 NumberAnimation {id: width_anim; target: root_Rectangle;  property: "width"; from: root_Rectangle.width; to: parent.width; duration: root_Rectangle.time_anim}

                 NumberAnimation {id: height_anim; target: root_Rectangle;  property: "height"; from: root_Rectangle.height; to: parent.height; duration: root_Rectangle.time_anim}

             }
         }




      }


     Connections {
         target: Mqqt_Client


         function onNewGPS_signal(latitude, longitude, yaw) {

             cart_Marker.rotation = yaw

             cart_Marker.start_anim(QtPositioning.coordinate(latitude, longitude))

            // cart_Marker.coordinate =  QtPositioning.coordinate(latitude, longitude)

             line.addCoordinate(cart_Marker.coordinate)

             if(!isCheck){

                map.center = cart_Marker.coordinate

             }
         }

     }
}


