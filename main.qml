import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

//Window {
//    width: 940
//    height: 680
//    visible: true
//    title: qsTr("MyApp")
//    minimumHeight: 500
//    minimumWidth: 600


//    Rectangle {
//        id: container
//        anchors.fill: parent

//        Rectangle {
//            id: leftRect
//            color: "white"
//            height: parent.height
//            width: parent.width * 0.4
//            anchors.left: parent.left

//           ColumnLayout {
//                id: lay
//                anchors.fill: parent

//                anchors {
//                    leftMargin: 40
//                    rightMargin: 40
//                    topMargin: 30
//                    bottomMargin: 20
//                }

//                Item {
//                    Layout.fillHeight: true
//                }

//                Text {
//                    text: "Log in."
//                    font.pointSize: 25
//                    color: "black"
//                    font.bold: true
//                    wrapMode: Text.NoWrap
//                    Layout.leftMargin: 18
//                    Layout.fillWidth: true

//                }

//                Item {
//                    height: 5
//                }

//                Text {
//                    text: "Log in with your data that your entered during your registration"
//                    font.pointSize: 10
//                    color: "grey"
//                    wrapMode: Text.WordWrap
//                    Layout.leftMargin: 20
//                    Layout.fillWidth: true
//                }

//                Item {
//                    height: 30
//                }


//                Text {
//                    text: "Enter your email address"
//                    font.pointSize: 10
//                    color: "dimgrey"
//                    font.bold: true
//                    wrapMode: Text.Text.NoWrap
//                    Layout.leftMargin: 20
//                    Layout.fillWidth: true
//                }



//                TextField  {
//                    Layout.fillWidth: true
//                    placeholderText: "name@example.com"
//                    placeholderTextColor: "grey"
//                    color: "black"
//                    Layout.leftMargin: 20
//                    Layout.rightMargin: 20
//                    focus: true
//                    Layout.maximumWidth: 200

//                    background: Rectangle {
//                        color: "transparent"
//                        radius: 3
//                        border.color: "grey"
//                        opacity: 0.2
//                    }
//                }

//                Item {
//                    height: 10
//                }

//                Text {
//                    text: "Enter your password"
//                    font.pointSize: 10
//                    color: "dimgrey"
//                    font.bold: true
//                    wrapMode: Text.Text.NoWrap
//                    Layout.leftMargin: 20
//                    Layout.fillWidth: true
//                }


//                RowLayout {
//                    Layout.fillWidth: true
//                    Layout.rightMargin: 20
//                    Layout.leftMargin: 20
//                    spacing: 13
//                    TextField  {
//                        id: passField

//                        Layout.fillWidth: true
//                        placeholderText: "atleast 8 characters"
//                        color: "grey"

//                        focus: true
//                        Layout.preferredWidth: 100
//                        Layout.maximumWidth: 200
//                        echoMode: TextField.Password
//                        validator: RegularExpressionValidator  {
//                            regularExpression: /[a-zA-Z0-9]{8,15}+/
//                        }


//                        background: Rectangle {
//                            color: "transparent"
//                            radius: 3
//                            border.color: "grey"
//                            opacity: 0.2
//                        }
//                    }

//                    Image {
//                        id: eyePassword
//                        source: "/images/hide.png"
//                        sourceSize.width: 16
//                        sourceSize.height: 16
//                        state: "hide"

//                        MouseArea {
//                            anchors.fill: parent
//                            onClicked: {eyePassword.state === "show" ? eyePassword.state = "hide" : eyePassword.state = "show"}
//                        }

//                        states: [
//                            State {
//                                name: "show"
//                                PropertyChanges { target: eyePassword; source: "/images/show.png" }
//                                PropertyChanges { target: passField; echoMode: TextField.Normal }
//                            },
//                            State {
//                                name: "hide"
//                                PropertyChanges { target: eyePassword; source: "/images/hide.png" }
//                                PropertyChanges { target: passField; echoMode: TextField.Password }
//                            }
//                        ]
//                    }


//                    Item {
//                        Layout.fillWidth: true
//                    }

//                }


//                Text {
//                    id: forgetPassText
//                    text: "Forget password?"
//                    font.pointSize: 10
//                    color: "#6c62ff"
//                    font.bold: true
//                    wrapMode: Text.NoWrap
//                    Layout.leftMargin: 20
//                    Layout.fillWidth: true

//                    state: "hoverLeave"

//                    MouseArea {
//                            cursorShape: Qt.PointingHandCursor
//                            anchors.fill: parent
//                            onClicked: console.log("query")
//                            hoverEnabled:  true
//                            onHoveredChanged: forgetPassText.state === "hoverLeave" ? forgetPassText.state = "hoverEnter" :  forgetPassText.state = "hoverLeave"
//                    }

//                    states: [
//                        State {
//                            name: "hoverEnter"
//                            PropertyChanges { target: forgetPassText; font.underline: true }
//                        },
//                        State {
//                            name: "hoverLeave"
//                            PropertyChanges { target: forgetPassText; font.underline: false }
//                        }
//                    ]
//                }

//                Item {
//                   height: 20
//                }

//                Button {
//                    id: control
//                    text: qsTr("Log in")
//                    Layout.maximumWidth: 200
//                    Layout.fillWidth: true
//                    Layout.leftMargin: 20

//                    state: "hoverLeave"

//                    background: Rectangle {
//                        radius: 5
//                        color: "#6c63fe"

//                        implicitWidth: 100
//                        implicitHeight: 30


//                    }

//                    contentItem: Label {
//                        id: lbl
//                        text: control.text
//                        color: "white"
//                        horizontalAlignment: Qt.AlignHCenter
//                    }

//                    onHoveredChanged: control.state === "hoverLeave" ? control.state = "hoverEnter" : control.state = "hoverLeave"

//                    states: [
//                        State {
//                            name: "hoverEnter"
//                            PropertyChanges { target: lbl; color: "#6c63fe" }
//                        },
//                        State {
//                            name: "hoverLeave"
//                            PropertyChanges { target: lbl; color: "white" }
//                        }
//                    ]

//                }

//                Item {
//                    Layout.fillHeight: true
//                }

//                // MyButton
//                Rectangle {
//                    id: controlSignUp
//                    Layout.maximumWidth: 200
//                    Layout.fillWidth: true
//                    Layout.leftMargin: 20
//                    Layout.bottomMargin: 40
//                    Layout.alignment: Qt.AlignBottom

//                    color: "transparent"
//                    border.color: "#6c63fe"
//                    radius: 10
//                    implicitHeight: 30

//                    Text {
//                        id: textSignUp
//                        text: "Sign up now"
//                        color: "#6c63fe"
//                        anchors.centerIn: parent
//                    }

//                    MouseArea {
//                        anchors.fill: parent
//                        hoverEnabled: true
//                        acceptedButtons: Qt.LeftButton

//                        onEntered: {
//                            controlSignUp.color = "#6c63fe"
//                            textSignUp.color = "white"
//                        }

//                        onExited: {
//                            controlSignUp.color = "transparent"
//                            textSignUp.color = "#6c63fe"
//                        }
//                    }

//                }

//           }
//        }

//        Rectangle {
//            id: rightRect
//            color: "#f9f6fd"
//            height:parent.height
//            width: parent.width * 0.6
//            anchors.right: parent.right
//            ColumnLayout {
//                id: rightLay
//                anchors.fill: parent

//                anchors {
//                    topMargin: 70
//                    bottomMargin: 20
//                }


//                Item {
//                    Layout.fillHeight: true
//                }


//                Text {
//                    text: "Nice to see you again"
//                    font.pointSize: 15
//                    color: "black"
//                    wrapMode: Text.WordWrap
//                    Layout.fillWidth: true
//                    horizontalAlignment: Text.AlignHCenter
//                }


//                Text {
//                    text: "Welcome back"
//                    font.pointSize: 40
//                    color: "#6c63fe"
//                    font.bold: true
//                    wrapMode: Text.WordWrap
//                    Layout.fillWidth: true
//                    horizontalAlignment: Text.AlignHCenter
//                }


//                Image {
//                    source: "/images/x8VHCNnO_VA_prev_ui.png"
//                    Layout.preferredHeight: rightRect.height * 0.4
//                    Layout.preferredWidth: rightRect.width * 0.4
//                    fillMode: Image.PreserveAspectFit
//                    Layout.fillWidth: true
//                    Layout.alignment: Qt.AlignHCenter

//                }

//                Item {
//                    Layout.fillHeight: true
//                }

//            }

//        }
//    }


//    Rectangle {
//        color: "red"
//        border.color: "blue"
//        border.width: 2
//        height: 50
//        width: 100
//        radius: 3
//    }


//}


Window {
    width: 940
    height: 680
    visible: true
    title: qsTr("MyApp")
    minimumHeight: 500
    minimumWidth: 600


    Rectangle {
        id: container
        anchors.fill: parent

        Rectangle {
            id: leftRect
            color: "white"
            height: parent.height
            width: parent.width * 0.4
            anchors.left: parent.left
        }


        Rectangle {
            id: rightRect
            color: "#f9f6fd"
            height:parent.height
            width: parent.width * 0.6
            anchors.right: parent.right
       }

    }
}