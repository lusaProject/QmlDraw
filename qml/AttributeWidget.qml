import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle{
    id : root

    property int radius: 5
    property int toolsType: 0
    property real lwidth: 2
    property bool lineDash: true
    property string buttonColor: global.buttonColor

    onButtonColorChanged: {
        if(toolsType === 1){
            fillBackground.color = global.buttonColor
            global.fillColor = global.buttonColor
        }else if(toolsType === 2){
            strokeBackground.color = global.buttonColor
            global.strokeColor = global.buttonColor
        }
    }

    signal clearscreen()
    signal clicked()

    RowLayout {
          spacing: 30
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.top:parent.top

          ComboBox {
              id : lineStyleComboBox
              textRole: "key"
              currentIndex: 0
              model: ListModel {
                  id: lineItme
                  ListElement { key: "画笔实线";  real : 1 }
                  ListElement { key: "画笔虚线";  real : 2 }
              }

              onCurrentIndexChanged: {
                  console.warn(lineItme.get(currentIndex).key + ", " + lineItme.get(currentIndex).real)

                  if (lineItme.get(currentIndex).real === 1){
                        lineDash = true
                  }else{
                        lineDash = false
                  }
              }
          }

          Rectangle{
            id : colorRectangle
            width: 155; height: 40
            ToolButton {
              id : fillToolButton
              anchors.left: parent.left
              width: 40; height: 40

              background: Rectangle{
                  id : fillBackground
                  color: "#F0F0F0"
                  radius: 8
              }

              onClicked: {
                root.toolsType = 1
                root.clicked()
              }
            }

            Label{
               id : fillLabel
               text: "填充"
               anchors.left: fillToolButton.right
               anchors.leftMargin: 5
               anchors.verticalCenter: fillToolButton.verticalCenter
            }

              ToolButton {
                id : strokeToolButton
                anchors.left: fillLabel.right
                anchors.leftMargin: 15
                width: 40; height: 40

                background: Rectangle{
                    id: strokeBackground
                    color: "#000000"
                    radius: 8
                }

                onClicked: {
                    root.toolsType = 2
                    root.clicked()
                }
              }

              Label{
                anchors.left: strokeToolButton.right
                anchors.leftMargin: 5
                anchors.verticalCenter: fillToolButton.verticalCenter
                text: "描边"
              }
          }

          ComboBox {
              id : pantwidth
              currentIndex: 1
              textRole: "key"
              model: ListModel {
                  id: cbItems
                  ListElement { key: "1px";  real : 1 }
                  ListElement { key: "2px";  real : 2 }
                  ListElement { key: "4px";  real : 4 }
                  ListElement { key: "8px";  real : 8 }
                  ListElement { key: "10px"; real : 10}
              }
              onCurrentIndexChanged: {
                  console.warn(cbItems.get(currentIndex).key + ", " + cbItems.get(currentIndex).real)
                  lwidth = cbItems.get(currentIndex).real
              }
          }

          Rectangle{
            width: 170; height: 40

            Label{
              id : radiusLabel
              anchors.verticalCenter: parent.verticalCenter
              anchors.left: parent.left
              text: "圆角"
            }

            SpinBox{
                id : radiusSpinBox
                anchors.verticalCenter: radiusLabel.verticalCenter
                anchors.left: radiusLabel.right
                anchors.leftMargin: 5
                value : 5
                onValueChanged: {
                    root.radius = radiusSpinBox.value
                }
            }

            ToolButton {
              id : clearScreenButton
              anchors.left: radiusSpinBox.right
              anchors.leftMargin: 15
              width: 40; height: 40

              text:  "清屏"
              background: Rectangle{
                  id : clearScreenBackground
                  color : "#E3E3E3"
                  radius: 8
              }

              onPressed: {
                  clearScreenBackground.color = "#B0B0B0"
                  root.clearscreen()
              }

              onReleased: {
                  clearScreenBackground.color = "#E3E3E3"
              }
            }

          }
      }
}


