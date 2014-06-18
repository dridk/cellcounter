import QtQuick 2.0

Item {
    property alias source :img.source
    property alias title : title.text
    width: 50
    height: 50
    opacity: enabled ? (area.pressed ? 0.4 : 1) : 0.4

    signal clicked()

    Image {
        id:img

        anchors.verticalCenterOffset: -5
        anchors.centerIn: parent

    }
    Text {
        id:title
        text:"open"
        anchors.bottomMargin: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }
    MouseArea {
        id:area
        anchors.fill: parent
        onClicked: parent.clicked()
    }



}
