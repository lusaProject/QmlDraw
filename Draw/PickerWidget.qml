import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
        id : root

        property color paintColor: "#33b5e5"
        property alias transparency: transparentSlider.value

        width: colorLayout.width + 20
        height: colorLayout.height + 20
        radius: 8
        color: "#F8F8F8"

        ColumnLayout {
           id : colorLayout
           anchors.centerIn: parent
           spacing: 4

           Grid{
               id: colorGrid
               columns: 8
               spacing: 4;

               Repeater{
                   anchors.fill: parent
                   model: [
                       "transparent","#ff0c0c" ,"#eb6100", "#fcfd0e" ,"#45FD14","#52FEF6","#2E00FF",
                       "#F600FF","#FF7087", "#FE3C3B", "#EC6941","#FF9E0E" ,"#FFFD83" ,"#8FC31F","#6BC989",
                       "#4EC918", "#0292EA","#49B2F6" ,"#72C8FF" ,"#85CCC8", "#89ABDA" ,"#958EF9",
                       "#8A47FB", "#6B1AEE",  "#E3E3E3", "#C9C9C9","#ADADAD","#6F6F6F",
                       "#404040" ,"#1B1B1B","#000000", "#FFFFFF"
                   ]

                   ColorSquare{
                       id: gridred;
                       color: modelData;
                       active: root.paintColor === color
                       onClicked: {
                           root.paintColor = color
                           global.buttonColor = color
                       }                       
                   }
               }
           }

           RowLayout {
              spacing: 4
              Layout.preferredWidth: 300

              Label{
                text: "Alpha"
              }

              Slider {
                  id : transparentSlider
                   from: 0.1
                   value: 1
                   to: 1
                   Layout.fillWidth: true
                   onValueChanged: {
                       // console.warn("value" + value)
                   }
               }

              Label{
                 text: Math.floor(transparentSlider.value * 100) + "%"
              }
           }

           RowLayout {
               spacing: 4

               Label{
                   text: "Color   #"
               }

               TextInput{
                id: textinput
                text: "FFFFFF"
                verticalAlignment: TextInput.AlignHCenter
                Layout.fillWidth: true
               }

               ToolButton{
                id: picker
                text: "choose"
                background: Rectangle{
                    id : pickerBG
                    color : "#F0F0F0"
                    radius: 5
                }

                onClicked: {
                    global.buttonColor = "#" + textinput.text
                }
              }
           }
        }
}


