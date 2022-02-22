import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    title: qsTr("画板")

    function activateWindow()
    {
        root.requestActivate();
        root.raise();
    }

    width: screen.width
    height: screen.height
    visible: true

    MainWindow{
        id: mainWindow
    }

    StackView {
        id: stackView
        initialItem: mainWindow
        anchors.fill: parent
    }

    GlobalVar{
        id: global
    }
}






