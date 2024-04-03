import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id : root
    width: 60
    height: 600

    property int currentPenType : 1

    function clearSelected(){
        pencilbackground.color = "#F0F0F0"
        eraserbackground.color = "#F0F0F0"
        rectbackground.color = "#F0F0F0"
        trianglebackground.color = "#F0F0F0"
        linebackground.color = "#F0F0F0"
        circlebackground.color = "#F0F0F0"
        ellipsebackground.color = "#F0F0F0"
    }

      ToolButton {
        id : pencil

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 120

        icon.source: "res/ddc_brush_tool_normal_48px.svg"
        icon.width: 40; icon.height: 40

        background: Rectangle{
            id : pencilbackground
            color : "#B0B0B0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 1
            pencilbackground.color = "#B0B0B0"
        }

      }

      ToolButton {
        id : eraser

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pencil.bottom
        anchors.topMargin: 10

        icon.source: "res/ddc_eraser_tool_normal_48px.svg"
        icon.width: 40; icon.height: 40

        background: Rectangle{
            id : eraserbackground
            color : "#F0F0F0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 2
            eraserbackground.color = "#B0B0B0"
        }

      }

      ToolButton {
        id : rect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: eraser.bottom
        anchors.topMargin: 10

        icon.source: "res/ddc_rectangle_tool_normal_48px.svg"
        icon.width: 40; icon.height: 40

        background: Rectangle{
            id : rectbackground
            color : "#F0F0F0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 3
            rectbackground.color = "#B0B0B0"
        }

      }

      ToolButton {
        id : triangle

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: rect.bottom
        anchors.topMargin: 10

        icon.source: "res/ddc_triangle_tool_normal_48px.svg"
        icon.width: 40; icon.height: 40

        background: Rectangle{
            id : trianglebackground
            color : "#F0F0F0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 4
            trianglebackground.color = "#B0B0B0"
        }
      }

      ToolButton {
        id : line

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: triangle.bottom
        anchors.topMargin: 10

        icon.source: "res/ddc_line_tool_normal_48px.svg"
        icon.width: 40; icon.height: 40

        background: Rectangle{
            id : linebackground
            color : "#F0F0F0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 5
            linebackground.color = "#B0B0B0"
        }
      }

      ToolButton {
        id : circle

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: line.bottom
        anchors.topMargin: 10

        icon.source: "res/ddc_round_tool_normal_48px.svg"
        icon.width: 40; icon.height: 40

        background: Rectangle{
            id : circlebackground
            color : "#F0F0F0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 6
            circlebackground.color = "#B0B0B0"
        }
      }

      ToolButton {
        id : ellipse

        icon.source: "res/ddc_ellipse_normal_36px.svg"
        icon.width: 40; icon.height: 40

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: circle.bottom
        anchors.topMargin: 10
        background: Rectangle{
            id : ellipsebackground
            color : "#F0F0F0"
            radius: 8
        }

        onClicked: {
            clearSelected()
            currentPenType = 7
            ellipsebackground.color = "#B0B0B0"
        }
      }
}
