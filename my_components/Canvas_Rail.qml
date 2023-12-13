import QtQuick 2.15

import Style 1.0

import my_components 1.0

Item{
    width: parent.width
    height: parent.height
    //color: "red"

    Canvas {
        id: canvas
        width: parent.width // - 80
        height: parent.height
        anchors.centerIn: parent
        contextType: "2d"

        property int width_bottom: 60

        Path {
            id: myPath
            startX: canvas.width / 2;
            startY: canvas.height - 10

            PathCurve {id: p1; x: canvas.width / 2 - canvas.width_bottom; y: canvas.height - 10}

            PathCurve {id: p2; x: canvas.width / 2 - 30; y: canvas.height - 30}

            PathCurve {id: p3; x: canvas.width / 2 - 30 ; y: canvas.height - 90}

            PathCurve {id: p4; x:  canvas.width / 2 - 60 ; y: canvas.height - 90 - 20}


            PathCurve {x: 10 + canvas.width / 2 - 60 ; y: canvas.height - 90 - 20 - 20}


            PathCurve {x: 50 + 50 + 10 + canvas.width / 2 - 60 ; y: canvas.height - 90 - 20 - 20}


            PathCurve {x: canvas.width / 2 + 60; y: canvas.height - 90 - 20 }


            PathCurve {x: canvas.width / 2 + 30; y: canvas.height - 90 }


            PathCurve {x: canvas.width / 2 + 30; y: canvas.height - 30 }


            PathCurve {x: canvas.width / 2 + canvas.width_bottom; y: canvas.height - 10 }


            PathCurve {x: myPath.startX; y: myPath.startY}


          //  PathCurve {x: 50 + 60 + canvas.width / 2 - canvas.width_bottom / 2 - canvas.width_bottom / 2 ; y: canvas.height - 90 }


           /// PathCurve {id: p6; x: p5.x + 50 + 60; y: p5.y }


//            PathCurve {id: p7; x: p6.x - 10 ; y: p4.y}



            //PathCurve {id: p7; x: p6.x + 50 ; y: p5.y }


         //   PathCurve {id: p8; x: p7.x + 10 ; y: p5.y }



            //PathCurve {id: p9; x: p7.x - canvas.width_bottom / 2 ; y: p4.y }





          //  PathCurve {id: p7; x: p4.x + 10 + canvas.width_bottom * 2 ; y: p3.y - 20}


            //PathCurve {id: p8; x: p7.x ; y: p3.y}



            //PathCurve {id: p8; x: p6.x + 50 ; y: p6.y }


          //  PathCurve { x: p6.x + canvas.width_bottom / 2; y: p6.y }

         //   PathCurve { x: p6.x + canvas.width_bottom / 2; y: p5.y }

          //  PathCurve { x: parent.width / 2; y: 30 }

//            PathCurve { x: parent.width / 2; y: 100 }

  //          PathCurve { x: parent.width; y: 119}
        }

        onPaint: {

            var ctx = getContext("2d")

            ctx.lineWidth = 2;

            context.save()

            context.strokeStyle = "red" //Style.listFocus_Color

            //context.moveTo(canvas.width / 2, canvas.height - 10);

            //context.lineTo(canvas.width / 2 - canvas.width_bottom, canvas.height - 10);

            //context.lineTo(canvas.width / 2 - canvas.width_bottom, canvas.height - 60);


            context.path = myPath;
            context.stroke();
        }

    }

}
