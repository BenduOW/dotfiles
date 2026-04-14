import Quickshell
import Quickshell.Wayland
import QtQuick
//import QtQuick.Wayland
//import Niri 0.1

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "#1a1b26"

    Text {
        anchors.centerIn: parent
        text: "Test"
        color: "#a9b1d6"
        font.pixelSize: 14
    }

}
