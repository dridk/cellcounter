import QtQuick 2.0

Item {
    property alias source :img.source
    width: 50
    height: 50
    opacity:area.pressed ? 0.4 : 1

    Image {
        id:img
        width: 20
        height: 20
        anchors.verticalCenterOffset: -5
        anchors.centerIn: parent

    }
    Text {
        text:"open"
        anchors.bottomMargin: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }
    MouseArea {
        id:area
        anchors.fill: parent
    }



}
