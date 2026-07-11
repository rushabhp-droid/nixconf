import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: topBar

    // Anchor to the edges of the screen
    anchors {
        top: true
        left: true
        right: true
    }

    // Reserve space for Hyprland windows
    exclusiveZone: height
    height: 32
    color: "#1e1e2e" // Background color (e.g., Catppuccin Mocha Base)

    Text {
        anchors.centerIn: parent
        text: "Quickshell is running!"
        color: "#cdd6f4"
        font.pointSize: 12
        font.bold: true
    }
}
