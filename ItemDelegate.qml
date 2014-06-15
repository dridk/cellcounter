import QtQuick 2.0

Rectangle {
    id:item
    width: parent.width
    height: 50
    property string color : area.pressed ? "white" : "#008647"
    property int count:0

    Rectangle {
        id:border
        height: parent.height
        width: 4
        color: item.color

    }

    Rectangle {
        anchors.left: parent.left
       width: area.pressed ? parent.width : 0
       height: parent.height
       color: "#008647"

       Behavior on width {
           NumberAnimation{
               easing.type: Easing.OutCirc
               duration : 50

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
            color: area.pressed ? "white": "#2d3945"
            radius: 4
            anchors.verticalCenter: parent.verticalCenter

            Text {
                anchors.centerIn: parent
                text:"A"
                color: !area.pressed ? "white": "#2d3945"
                font.family: latoFont.name

            }
        }


        Text {
            anchors.verticalCenter: parent.verticalCenter
            text:"LYMPHOCYTE"
            font.pixelSize: 15
            font.bold: true
            font.family: latoFont.name
            color: area.pressed ? "white": "#2d3945"
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
                    text:count
                    color: item.color
                    font.family: latoFont.name
                    font.pixelSize: 35

                    Behavior on color {
                        ColorAnimation {
                            duration: 200
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
                        text:"12 giga/L"
                        color: item.color
                        font.family: latoFont.name
                        font.pixelSize: 10
                        Behavior on color {
                            ColorAnimation {
                                easing.type: Easing.OutExpo
                                duration: 200

                            }
                        }
                    }

                    Text {
                        text: Math.floor(item.count / root.totalCount * 100) + "%"
                        color: item.color
                        font.family: latoFont.name
                        font.pixelSize: 10
                        Behavior on color {
                            ColorAnimation {
                                duration: 200
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

        onClicked: {
         if (mouse.button == Qt.LeftButton)
            item.count += 1
         if (mouse.button == Qt.RightButton)
            item.count -= 1
        }
    }


}
