import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    id : root

    property int radius: 5
    property int toolsType: 0
    property real lwidth: 4
    property string buttonColor: global.buttonColor

    signal clearscreen()
    signal clicked()

    onButtonColorChanged: {
        fillBackground.color = global.buttonColor
        global.fillColor = global.buttonColor
    }

    RowLayout {
          spacing: 30
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.top:parent.top

          Rectangle{
            id : colorRectangle

            width: 40; height: 40
            ToolButton {
              id : fillToolButton
              anchors.left: parent.left
              width: 40; height: 40

              background: Rectangle{
                  id : fillBackground
                  color: "#52FEF6"
                  radius: 8
              }

              onClicked: {
                root.toolsType = 1
                root.clicked()
              }
            }
          }

          Rectangle{
            width: 300; height: 40

            Slider {
               id : slider
               width: parent.width
               anchors.verticalCenter: parent.verticalCenter

               from: 1
               value: 4
               to: 200
               onValueChanged: {
                   lwidth = value
               }
           }
          }

          Rectangle{
            width: 45; height: 40

            ToolButton {
              id : clearScreenButton
              anchors.left: parent.left
              width: 45; height: 40

              text:  "clean"
              background: Rectangle{
                  id : clearScreenBackground
                  color : "#E3E3E3"
                  radius: 8
              }

              onPressed: {
                  clearScreenBackground.color = "#FFFFFF"
                  root.clearscreen()
              }

              onReleased: {
                  clearScreenBackground.color = "#E0E0E0"
              }
            }

          }
      }
}


