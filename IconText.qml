import QtQuick 2.0

Item {
    width: 23
    height: 23
    property alias source : img.source
    property alias title : text.text
    property string url
    Text {
        id:text
        anchors.centerIn: parent
        font.family: latoFont.name
        color: "white"
        opacity: !area.containsMouse ? 0 : 1

        Behavior on opacity {
            NumberAnimation {
                easing.type: Easing.OutCubic
                duration : 200

            }
        }


    }

    Image {
        id: img
        anchors.fill: parent
        opacity: area.containsMouse ? 0 : 1

        Behavior on opacity {
            NumberAnimation {
                easing.type: Easing.OutCubic
                duration : 200

            }
        }

        MouseArea {
            id:area
            anchors.fill: parent
            hoverEnabled: true
            onClicked:Qt.openUrlExternally(url);


        }


    }

}
