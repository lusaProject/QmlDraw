import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id: root

    property color fillStyles
    property color strokeStyles
    property real globalAlphas

    property int pentype
    property real lwidth

    property real startX
    property real startY

    property real lastX
    property real lastY

    property real endX
    property real endY

    function clearScreen(){
        draw.ctx.clearRect(0, 0, draw.width, draw.height)
        canvas.ctx.clearRect(0, 0, canvas.width, canvas.height)
        draw.requestPaint()
        canvas.requestPaint()
     }

    function canvasPainter(ctx)
    {
        ctx.lineJoin = "round"
        ctx.lineCap = "round"
        ctx.globalCompositeOperation = "copy"

        ctx.fillStyle = fillStyles
        ctx.strokeStyle = strokeStyles
        ctx.globalAlpha = globalAlphas
        ctx.lineWidth = lwidth

        switch (pentype)
        {
            case 1:
                ctx.beginPath()
                ctx.moveTo(lastX,lastY)
                lastX = area.mouseX
                lastY = area.mouseY
                ctx.lineTo(lastX,lastY)
                ctx.stroke()
            break;

            case 2:
                ctx.fillStyle = "transparent"
                ctx.strokeStyle = "transparent"
                ctx.globalAlpha = "transparent"

                ctx.beginPath()
                ctx.moveTo(lastX,lastY)
                lastX = area.mouseX
                lastY = area.mouseY
                ctx.lineTo(lastX,lastY)
                ctx.stroke()
            break;

            case 3:
                ctx.beginPath()
                ctx.roundedRect(startX, startY, area.mouseX - startX, area.mouseY - startY, 0, 0)
                ctx.stroke()
                ctx.fill()
            break;

            case 4:
                ctx.beginPath()
                var pointX = ((area.mouseX - startX) / 2) +  startX
                ctx.moveTo(pointX, startY)
                ctx.lineTo(area.mouseX, area.mouseY)
                ctx.lineTo(startX, area.mouseY)
                ctx.lineTo(pointX, startY)
                ctx.stroke()
                ctx.fill()
            break;

            case 5:
                ctx.beginPath()
                ctx.moveTo(startX,startY)
                lastX = area.mouseX
                lastY = area.mouseY
                ctx.lineTo(lastX,lastY)
                ctx.stroke()
                ctx.fill()
            break;

            case 6:
                ctx.beginPath()
                var r = Math.abs(area.mouseX - startX) + Math.abs(area.mouseY - startY)
                ctx.arc(startX, startY, r * 0.3, 0, 2*Math.PI)
                ctx.stroke()
                ctx.fill()
            break;

            case 7:
                ctx.beginPath()
                ctx.ellipse(startX, startY, area.mouseX - startX, area.mouseY - startY)
                ctx.stroke()
                ctx.fill()
            break;

            case 8:
                ctx.beginPath()
            break;

            case 9:
                ctx.beginPath()
            break;

            default:
                console.warn("....pant type error....")
        }
    }

    Rectangle{
        anchors.fill: draw
        border.color: "#F0F0F0"
        border.width: 2;
    }

    Canvas{
        id:draw
        property var ctx
        anchors.fill: root
        onPaint: {
            ctx = getContext("2d")
            canvasPainter(ctx)
        }
    }

    Canvas{
        id:canvas
        property var ctx
        anchors.fill: draw

        onPaint: {
            ctx = getContext("2d")
            canvasPainter(ctx)
        }

        MouseArea{
            id:area;
            anchors.fill: parent;

            onPressed: {
                colorWidget.visible = false

                lastX = mouseX
                lastY = mouseY

                startX = mouseX
                startY = mouseY
            }

            onReleased: {
                endX = mouseX
                endY = mouseY

                canvas.ctx.clearRect(0, 0, canvas.width, canvas.height)
                canvas.requestPaint()
                draw.requestPaint()
            }

            onPositionChanged: {
                if(pentype > 2){
                    canvas.ctx.clearRect(0, 0, canvas.width, canvas.height)
                    canvas.requestPaint()
                }else{
                    draw.requestPaint()
                }
            }
        }
    }
}









