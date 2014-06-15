import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

ApplicationWindow {
    id:root
    title: qsTr("Hello World")
    width: 500
    height: 600

    FontLoader { id: latoFont; source: "fonts/Lato_Black.ttf" }
    FontLoader { id: franchiseFont; source: "fonts/Franchise_Bold.ttf"}

    property int totalCount : totalCount.text
    property int totalCells : totalCells.text

    Component.onCompleted: {

        var txtFile = Qt.resolvedUrl("standard.json")
        var req = new XMLHttpRequest();
        req.open("GET", txtFile, true);
        req.send(null);
        req.onreadystatechange = function()
        {
            if (req.readyState == 4)
            {
                var data = JSON.parse(req.responseText)

                console.debug(data["title"])
            }
        }


    }


    Rectangle{
        id:main
        anchors.fill: parent
        color: "white"

        focus: true
        Keys.onPressed: {


        }

        Column {
            id:header
            width: parent.width
            Rectangle {
                width: parent.width
                height: 50
                color: "#2d3945"

                Text {
                    anchors.centerIn: parent
                    text:"Cell Counter"
                    font.family: franchiseFont.name
                    color: "white"
                    font.pixelSize: 26
                }
            }

            Rectangle {
                width: parent.width
                height: 50
                color: "#f0f0f0"

                Row {
                    anchors.fill: parent
                    spacing: 5
                    IconButton{
                        source: "icons/up21.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title: "open"
                    }
                    IconButton{
                        source: "icons/down14.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title: "save"
                    }
                    IconButton{
                        source: "icons/play43.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title:"start"
                    }
                    IconButton{
                        source: "icons/two123.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title:"reset"
                    }


                }

                Item {
                    height: parent.height
                    anchors.right: parent.right
                    width: 180

                    Row {
                        anchors.fill: parent

                        Item {
                            width: parent.width / 2
                            height: parent.height

                            TextInput {
                                id: totalCount
                                text: "200"
                                anchors.centerIn: parent
                                font.family: latoFont.name
                                font.pixelSize: 30
                                color: "#2d3945"

                            }
                        }

                        Item {
                            width: parent.width/ 2
                            height: parent.height
                            TextInput {
                                id:totalCells
                                text: "1.65"
                                anchors.centerIn: parent
                                font.family: latoFont.name
                                font.pixelSize: 30
                                color: "#2d3945"

                            }
                        }


                    }




                }
            }
        }

        ScrollView {
            anchors.top : header.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            ListView {

                clip: true
                model : 100

                delegate: ItemDelegate {

                }
            }
        }





    }



}
