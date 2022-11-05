import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

// 1
Window {
    id: root
    width: 940
    height: 680
    visible: true
    title: qsTr("MyApp")
    minimumHeight: 600
    minimumWidth: 600

    // Дополнительный контейнер на всю область контента главного окна
    Rectangle {
        id: container
        anchors.fill: parent

        // 2
        Rectangle {
            id: leftRect
            color: "white"
            height: parent.height
            width: parent.width * 0.4
            anchors.left: parent.left

           ColumnLayout {
                id: lay
                anchors.fill: parent

                anchors {
                    leftMargin: 60
                    rightMargin: 40
                    topMargin: 30
                    bottomMargin: 20
                }

                Item {
                    Layout.fillHeight: true
                }

                // 4
                Text {
                    text: "Log in."
                    font.pointSize: 25
                    color: "black"
                    font.bold: true
                    wrapMode: Text.NoWrap
                    Layout.fillWidth: true

                } // 4

                Item {
                    height: 5
                }

                // 5
                Text {
                    text: "Log in with your data that your entered during your registration"
                    font.pointSize: 10
                    color: "grey"
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                } // 5

                Item {
                    height: 30
                }

                // 6
                Text {
                    text: "Enter your email address"
                    font.pointSize: 10
                    color: "dimgrey"
                    font.bold: true
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                } // 6


                // 7
                TextField  {
                    placeholderText: "name@example.com"
                    placeholderTextColor: "grey"
                    color: "black"
                    focus: true
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true

                    background: Rectangle {
                        color: "transparent"
                        radius: 3
                        border.color: "grey"
                        opacity: 0.2
                    }
                } // 7

                Item {
                    height: 10
                }

                // 8
                Text {
                    text: "Enter your password"
                    font.pointSize: 10
                    color: "dimgrey"
                    font.bold: true
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                } // 8


                RowLayout {
                    Layout.fillWidth: true
                    spacing: 13

                    // 9
                    TextField  {
                        id: passField

                        Layout.fillWidth: true
                        placeholderText: "atleast 8 characters"
                        color: "grey"

                        focus: true
                        // Layout.preferredWidth: 100
                        Layout.maximumWidth: 200
                        echoMode: TextField.Password
                        validator: RegularExpressionValidator  {
                            regularExpression: /[a-zA-Z0-9]{8,15}+/
                        }


                        background: Rectangle {
                            color: "transparent"
                            radius: 3
                            border.color: "grey"
                            opacity: 0.2
                        }
                    } // 9

                    // 10
                    Image {
                        id: eyePassword
                        source: "/images/hide.png"
                        sourceSize.width: 16
                        sourceSize.height: 16
                        state: "hide"

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {eyePassword.state === "show" ? eyePassword.state = "hide" : eyePassword.state = "show"}
                        }

                        states: [
                            State {
                                name: "show"
                                PropertyChanges { target: eyePassword; source: "/images/show.png" }
                                PropertyChanges { target: passField; echoMode: TextField.Normal }
                            },
                            State {
                                name: "hide"
                                PropertyChanges { target: eyePassword; source: "/images/hide.png" }
                                PropertyChanges { target: passField; echoMode: TextField.Password }
                            }
                        ]
                    } // 10


                    Item {
                        Layout.fillWidth: true
                    }

                }

                // 11
                Text {
                    id: forgetPassText
                    text: "Forget password?"
                    font.pointSize: 10
                    color: "#6c62ff"
                    font.bold: true
                    wrapMode: Text.NoWrap
                    Layout.fillWidth: true

                    state: "hoverLeave"

                    MouseArea {
                            cursorShape: Qt.PointingHandCursor
                            anchors.fill: parent
                            onClicked: console.log("query")
                            hoverEnabled:  true
                            onHoveredChanged: forgetPassText.state === "hoverLeave" ? forgetPassText.state = "hoverEnter" :  forgetPassText.state = "hoverLeave"
                    }

                    states: [
                        State {
                            name: "hoverEnter"
                            PropertyChanges { target: forgetPassText; font.underline: true }
                        },
                        State {
                            name: "hoverLeave"
                            PropertyChanges { target: forgetPassText; font.underline: false }
                        }
                    ]
                } // 11

                Item {
                   height: 20
                }

                // 12
                Button {
                    id: control
                    text: qsTr("Log in")
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true

                    state: "hoverLeave"

                    background: Rectangle {
                        id: rectBg
                        radius: 5
                        color: "#6c63fe"
                        border.color: "#6c63fe"

                        implicitWidth: 100
                        implicitHeight: 30
                    }

                    contentItem: Label {
                        id: lbl
                        text: control.text
                        color: "white"
                        horizontalAlignment: Qt.AlignHCenter
                    }

                    onHoveredChanged: control.state === "hoverLeave" ? control.state = "hoverEnter" : control.state = "hoverLeave"

                    states: [
                        State {
                            name: "hoverEnter"
                            PropertyChanges { target: lbl; color: "#6c63fe" }
                            PropertyChanges { target: rectBg; color: "white" }
                            PropertyChanges { target: rectBg; border.color: "#6c63fe" }
                        },
                        State {
                            name: "hoverLeave"
                            PropertyChanges { target: lbl; color: "white" }
                            PropertyChanges { target: rectBg; color: "#6c63fe" }
                        }
                    ]

                } // 12

                Item {
                    Layout.fillHeight: true
                }

                // 13
                Rectangle {
                    id: controlSignUp
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true
                    Layout.bottomMargin: 40
                    Layout.alignment: Qt.AlignBottom

                    color: "transparent"
                    border.color: "#6c63fe"
                    radius: 10
                    implicitHeight: 30

                    Text {
                        id: textSignUp
                        text: "Sign up now"
                        color: "#6c63fe"
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        acceptedButtons: Qt.LeftButton

                        onEntered: {
                            controlSignUp.color = "#6c63fe"
                            textSignUp.color = "white"
                        }

                        onExited: {
                            controlSignUp.color = "transparent"
                            textSignUp.color = "#6c63fe"
                        }
                    }

                } // 13

           }
        } // 2

        // 3
        Rectangle {
            id: rightRect
            color: "#f9f6fd"
            height:parent.height
            width: parent.width * 0.6
            anchors.right: parent.right

            ColumnLayout {
                id: rightLay
                anchors.fill: parent

                anchors {
                    topMargin: 70
                    bottomMargin: 20
                }


                Item {
                    Layout.fillHeight: true
                }

                // 14
                Text {
                    text: "Nice to see you again"
                    font.pointSize: 15
                    color: "black"
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                } // 14

                // 15
                Text {
                    text: "Welcome back"
                    font.pointSize: 40
                    color: "#6c63fe"
                    font.bold: true
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                } // 15

                // 16
                Image {
                    source: "/images/x8VHCNnO_VA_prev_ui.png"
                    Layout.preferredHeight: rightRect.height * 0.6
                    Layout.preferredWidth: rightRect.width * 0.6
                    fillMode: Image.PreserveAspectFit
                    Layout.alignment: Qt.AlignHCenter

                } // 16

                Item {
                    Layout.fillHeight: true
                }

            }

        } // 3
    }
} // 1
