import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.1

import "cellcounter.js" as JS
ApplicationWindow {
    id:root
    title: qsTr("Hello World")
    width: 500
    height: 600
    color : "white"
    minimumWidth: 400
    minimumHeight: 400

    FontLoader { id: latoFont; source: "fonts/Lato_Black.ttf" }
    FontLoader { id: franchiseFont; source: "fonts/Franchise_Bold.ttf"}

    property int maxCount : 200
    property int currentCount : 0
    property double concentration : 1.96
    property bool started : false

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

            if (!event.isAutoRepeat && root.started)
            {

                var lowerText = event.text.toLowerCase()

                if (  lowerText in JS.keymaps ){

                    var index = JS.keymaps[event.text.toLowerCase()]

                    model.get(index).activated = true

                    if (event.text === lowerText ) // alors c'est la minuscule
                        JS.increase(index)

                    else
                        JS.decrease(index)

                }


            }


        }

        Keys.onReleased : {


            for (var i=0; i<model.count; ++i)
            {
                model.get(i).activated = false


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

                IconText {
                    title: "github"
                    source: "icons/github.png"
                    url:"https://github.com/dridk/cellcounter"

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin : 20
                }

                IconText {
                    title: "twitter"
                    source: "icons/twitter.png"
                    url:"https://twitter.com/dridk"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
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
                        enabled: !root.started
                        onClicked: fileDialog.open()
                    }
                    IconButton{
                        source: "icons/down14.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title: "save"
                        enabled: !root.started
                    }
                    IconButton{
                        source: started ? "icons/square64.png" : "icons/play43.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title:started ?"Stop":"Start"
                        onClicked: JS.start()
                    }
                    IconButton{
                        source: "icons/two123.png"
                        anchors.verticalCenter: parent.verticalCenter
                        title:"reset"
                        onClicked: JS.reset()
                        enabled: !root.started

                    }


                }

                Item {
                    height: parent.height
                    anchors.right: parent.right
                    width: 180

                    Row {
                        enabled: !started
                        anchors.fill: parent
                        opacity: enabled  ? 1 : 0.4

                        Item {
                            width: parent.width / 2
                            height: parent.height

                            TextInput {
                                text: root.maxCount
                                anchors.centerIn: parent
                                font.family: latoFont.name
                                font.pixelSize: 30
                                color: "#2d3945"
                                onAccepted: {
                                    root.maxCount = text
                                    main.focus = true
                                }
                                onFocusChanged:  {
                                    root.maxCount = text
                                }


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

                                onAccepted: {
                                    root.concentration = text
                                    main.focus = true
                                }
                                onFocusChanged:  {
                                    root.concentration = text
                                }

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
                    width: (parent.width - 26) * (currentCount/maxCount)
                    height: 4
                    color: "#2d3945"

                    Behavior on width {
                        NumberAnimation {
                            easing.type: Easing.OutBack
                            duration : 100


                        }
                    }

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
            enabled: started
            z:-1
            opacity: enabled ? 1 : 0.4


            ListView {
                enabled: root.started
                clip: true
                model : model
                property string test : "saha"

                delegate: ItemDelegate {
                    title: ListView.view.model.get(index).name
                    mainColor : ListView.view.model.get(index).color
                    count:  ListView.view.model.get(index).count
                    key : ListView.view.model.get(index).shortcut
                    activate: ListView.view.model.get(index).activated

                    onPressed:  {

                        ListView.view.model.get(index).activated = true
                        if (event.button === Qt.LeftButton)
                            JS.increase(index)
                        if (event.button === Qt.RightButton)
                            JS.decrease(index)

                    }

                    onReleased: {
                        ListView.view.model.get(index).activated = false

                    }
                }
            }
        }

    }



    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 15
        color: "#2d3945"

        Text {
            anchors.centerIn: parent
            text:"labsquare - licence MIT"
            color: "white"
            font.family: latoFont.name
        }

    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        nameFilters: [ "Json file (*.json)" ]


        onAccepted: {
            JS.loadJson(fileDialog.fileUrls[0])
        }
        onRejected: {
            console.log("Canceled")
        }
    }



}
