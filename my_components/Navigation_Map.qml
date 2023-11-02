import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15

import Style 1.0
import MyLang 1.0


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

        coordinate: map.center // QtPositioning.coordinate(map.center., longitude)
        anchorPoint.x: cart_Marker.width / 2
        anchorPoint.y: cart_Marker.height / 2
        sourceItem: Image{
            source: "qrc:/icons/light_theme/utils/send.svg"
            sourceSize.width: 40
            sourceSize.height: 40

        }
    }

 }
