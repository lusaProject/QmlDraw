import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle{
    id: root

    width: 960
    height: 640

    property color fillStyles
    property color strokeStyles
    property real globalAlphas

    property int pentype
    property int radius
    property real lwidth
    property bool lineDashs

    property real lastX
    property real lastY

    property real startX
    property real startY

    property real endX
    property real endY

    function clearScreen(){
        canvas.ctx.clearRect(0, 0, canvas.width, canvas.height)
        draw.ctx.clearRect(0, 0, draw.width, draw.height)
        draw.requestPaint()
        canvas.requestPaint()
     }

    function canvasPainter(ctx)
    {
        ctx.lineJoin = "round"
        ctx.lineCap = "round"
        ctx.globalCompositeOperation = "copy"
        //ctx.setLineDash([2,8])
        ctx.setLineDash(lineDashs ? []: [2,8])

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
                ctx.lineWidth = 50

                ctx.beginPath()
                ctx.moveTo(lastX,lastY)
                lastX = area.mouseX
                lastY = area.mouseY
                ctx.lineTo(lastX,lastY)
                ctx.stroke()
            break;

            case 3:
                ctx.beginPath()
                ctx.roundedRect(startX, startY, area.mouseX - startX, area.mouseY - startY, radius, radius)
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
        border.color: "#000666"
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

            Image {
                id: img
                width: 48
                height: 48
                visible: false
            }

            onPressed: {
                colorWidget.visible = false

                lastX = mouseX
                lastY = mouseY

                startX = mouseX
                startY = mouseY

                switch (pentype)
                {
                    case 1:
                      img.visible = true
                      area.cursorShape = Qt.BlankCursor
                      img.source = "qrc:/res/ddc_brush tool_normal_48px.svg"
                    break;

                    case 2:
                        img.visible = true
                        area.cursorShape = Qt.BlankCursor
                        img.source  = "qrc:/res/ddc_eraser tool_normal_48px.svg"
                    break;

                    case 3:
                        img.visible = true
                        area.cursorShape = Qt.BlankCursor
                        img.source  = "qrc:/res/ddc_rectangle tool_normal_48px.svg"
                    break;

                    case 4:
                        img.visible = true
                        area.cursorShape = Qt.BlankCursor
                        img.source  = "qrc:/res/ddc_triangle tool_normal_48px.svg"
                    break;

                    case 5:
                        img.visible = true
                        area.cursorShape = Qt.BlankCursor
                        img.source  = "qrc:/res/ddc_line tool_normal_48px.svg"
                    break;

                    case 6:
                        img.visible = true
                        area.cursorShape = Qt.BlankCursor
                        img.source  = "qrc:/res/ddc_round tool_normal_48px.svg"
                    break;

                    case 7:
                        img.visible = true
                        area.cursorShape = Qt.BlankCursor
                        img.source  = "qrc:/res/ddc_ellipse_normal_36px.svg"
                    break;

                    default:
                        img.visible = false
                        area.cursorShape = Qt.ArrowCursor
                        console.warn("... type error....")
                }

            }

            onReleased: {
                //console.warn("mouseX :" + mouseX  + "mouseY :" + mouseY)
                endX = mouseX
                endY = mouseY

                 canvas.ctx.clearRect(0, 0, canvas.width, canvas.height)
                 canvas.requestPaint()
                 draw.requestPaint()

                img.visible = false
                area.cursorShape = Qt.ArrowCursor
            }

            onPositionChanged: {
                img.x = mouseX - (img.width * 0.5  )
                img.y = mouseY - (img.height * 0.5 )

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









