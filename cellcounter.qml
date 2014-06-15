import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import "cellcounter.js" as JS
ApplicationWindow {
    id:root
    title: qsTr("Hello World")
    width: 500
    height: 600

    FontLoader { id: latoFont; source: "fonts/Lato_Black.ttf" }
    FontLoader { id: franchiseFont; source: "fonts/Franchise_Bold.ttf"}

    property int maxCount : 200
    property int currentCount : 0
    property double concentration : 1.96


    ListModel {
        id:model
    }

    Component.onCompleted: {

        JS.loadJson("standard.json")


    }


    Item{
        id:main
        anchors.fill: parent
        z:1
        focus: true
        Keys.onPressed: {


            if (event.text in JS.keymaps)
            {
                // Peut etre que faut inversé le dictionnaire, car dangereux ...
                var index = JS.keymaps[event.text]
                var c = model.get(index).count

                if ( currentCount > maxCount || currentCount <0)
                    return;

                var add = 1

                model.set(index,{count:c + add})
                currentCount += add


            }



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
                                text: root.maxCount
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
                                text: root.concentration
                                anchors.centerIn: parent
                                font.family: latoFont.name
                                font.pixelSize: 30
                                color: "#2d3945"

                            }
                        }


                    }




                }
            }

            Rectangle {
                id:progressBase
                width: parent.width
                height: 4
                color: "#d3d7cf"

                Rectangle {
                    id:progress
                    width: parent.width * (currentCount/maxCount)
                    height: 4
                    color: "#2d3945"

                }
                Rectangle {
                    anchors.left: progress.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 26
                    height: 13
                    color: "#2d3945"
                    radius: 5

                    Text {
                        anchors.centerIn: parent
                        text:currentCount
                        font.family: latoFont.name
                        color: "white"
                        font.pixelSize: 10
                    }



                }
            }



        }

        ScrollView {
            anchors.top : header.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            z:-1
            ListView {

                clip: true
                model : model
                property string test : "saha"

                delegate: ItemDelegate {
                    title: ListView.view.model.get(index).name
                    mainColor : ListView.view.model.get(index).color
                    count:  ListView.view.model.get(index).count
                    key : ListView.view.model.get(index).shortcut

                    onClicked:  {

                        root.currentCount ++
                        var c = ListView.view.model.get(index).count + 1


                        ListView.view.model.setProperty(index,"count", c)

                    }
                }
            }
        }





    }



}
