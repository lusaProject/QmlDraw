import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root
    title: qsTr("  ")

    function activateWindow()
    {
        root.requestActivate();
        root.raise();
    }

    width: 1200
    height: 800
    visible: true
    visibility: Window.Maximized

    MainWindow{
        id: mainWindow
        anchors.fill: parent
    }

    GlobalVar{
        id: global
    }
}

