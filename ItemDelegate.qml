import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id:item
    width: parent.width
    height: 50
    property string mainColor
    property string color : mainColor
    property int count:0
    property alias title : title.text
    property alias key :keyText.text

    property bool activate : false




    signal pressed(var event)
    signal released(var event)



    Rectangle {
        id:border
        height: parent.height
        width: 4
        color: item.color

    }

    Rectangle {
        anchors.left: parent.left
       width: item.activate ? item.width : 0
       height: parent.height
       color: mainColor


       Behavior on width {
           NumberAnimation{
               easing.type: Easing.OutExpo
               duration : 500

           }
       }
    }

    Row {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 10
        spacing: 10


        Rectangle {
            id:keybox
            width: 25
            height: 25
            color: item.activate? "white": "#2d3945"
            radius: 4
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id:keyText
                anchors.centerIn: parent
                color: !item.activate? "white": "#2d3945"
                font.family: latoFont.name

            }
        }


        Text {
            id:title
            anchors.verticalCenter: parent.verticalCenter
            text:"LYMPHOCYTE"
            font.pixelSize: 15
            font.bold: true
            font.family: latoFont.name
            color: item.activate ? "white": "#2d3945"
        }

    }

    Item {
        id: rightBox
        anchors.right: parent.right
        height: parent.height
        width: 150

        Row {
            anchors.fill: parent

            Item {
                width: parent.width / 2
                height: parent.height

                Text{
                    anchors.centerIn:parent
                    text:item.count
                    color:item.activate ? "white": mainColor
                    font.family: latoFont.name
                    font.pixelSize: 35

                    Behavior on color {
                        ColorAnimation {
                            duration: 400
                            easing.type: Easing.InExpo

                        }
                    }



                }

            }



            Item {
                width: parent.width/2
                height: parent.height

                Column {

                    anchors.centerIn: parent
                    spacing: 5

                    Text {
                        text: Math.floor(item.count / root.maxCount * root.concentration*100)/100 + "g/L"
                        color: item.activate ? "white": mainColor
                        font.family: latoFont.name
                        font.pixelSize: 10
                        Behavior on color {
                            ColorAnimation {
                                easing.type: Easing.OutExpo
                                duration: 400

                            }
                        }
                    }

                    Text {
                        text: Math.floor(item.count / root.maxCount * 100) + "%"
                        color: item.activate ? "white": mainColor
                        font.family: latoFont.name
                        font.pixelSize: 10
                        Behavior on color {
                            ColorAnimation {
                                duration: 400
                                easing.type: Easing.OutExpo

                            }
                        }

                    }




                }

            }


        }


    }





    Rectangle {
        id:separator
        width: parent.width
        height: 1
        color: "#efefef"

    }

    MouseArea {
        id:area
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onPressed: item.pressed(mouse)
        onReleased: item.released(mouse)

    }




}
