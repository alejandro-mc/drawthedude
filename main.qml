import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Draw the dude")

    Canvas{
        id:sheet
        anchors.fill: parent

        onPaint: {
            var ctx = getContext('2d')

            ctx.lineWidth = 4
            ctx.strokeStye = "blue"

            ctx.beginPath()
            ctx.moveTo(painting_brush.x0,painting_brush.y0)
            ctx.lineTo(painting_brush.x1,painting_brush.y1)
            ctx.stroke()
        }

        onPainted: {
            painting_brush.x0 = painting_brush.x1
            painting_brush.y0 = painting_brush.y1
        }

        MouseArea{
            id:painting_brush
            anchors.fill: parent

            property var x0
            property var y0
            property var x1
            property var y1

            onPressed: {
                //set the line's starting point
                x0 = mouseX
                y0 = mouseY
            }

            onPositionChanged: {
                x1 = mouseX
                y1 = mouseY
                sheet.requestPaint()
            }
        }
    }
}
