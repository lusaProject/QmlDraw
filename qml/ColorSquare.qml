import QtQuick 2.12

Rectangle {
    id: root

    property bool active: false
    signal clicked

    width: 35; height: 35
    color: "green"
    radius: 8

    border.color: active? "#666666" : "#f0f0f0"
    border.width: 2

    MouseArea {
        id: area
        anchors.fill: parent

        onClicked: {
            root.clicked()
        }
    }
}
