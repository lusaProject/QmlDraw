import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle{
    id: root

    AttributeWidget{
         id : attributeWidget
         height: 40
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.top:parent.top

         onClicked: {
             colorWidget.visible = !colorWidget.visible
         }

         onClearscreen: {
              paintArea.clearScreen()
         }
    }

    CanvasWidget{
        id : paintArea
        fillStyles: global.fillColor
        strokeStyles: global.strokeColor
        globalAlphas: colorWidget.transparency
        lwidth: attributeWidget.lwidth
        pentype: painttool.currentPenType
        lineDashs: attributeWidget.lineDash
        radius: attributeWidget.radius

         anchors{
             left: root.left;
             right: root.right;
             top: attributeWidget.bottom;
             bottom: root.bottom;
             margins: 8
         }
    }

    PickerWidget{
        id : colorWidget
        visible: false
        anchors.top: attributeWidget.bottom
        anchors.topMargin: 5
        anchors.left: root.left
        anchors.leftMargin: 690
    }

    DrawTools{
       id : painttool

       anchors.verticalCenter: root.verticalCenter
       anchors.left: root.left
       anchors.leftMargin: 10
    }
}
