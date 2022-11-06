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

    // 17 Элемент для изменения темы окна (light/dark)
    Image {
        id: themeType
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 7
        sourceSize.width: 32
        sourceSize.height: 32
        state: "light"

        z: 2

        MouseArea {
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton

            onClicked: themeType.state === "light" ? themeType.state = "dark" : themeType.state = "light"

        }

        states: [
            State {
                name: "light"
                PropertyChanges { target: themeType; source: "/images/moon.png" }
                PropertyChanges { target: rightRect; color: "#f9f6fd" }
                PropertyChanges { target: leftRect; color: "white" }
                PropertyChanges { target: mainText; color: "black" }
                PropertyChanges { target: logInText; color: "black" }
                PropertyChanges { target: logInInfoText; color: "grey" }
                PropertyChanges { target: emailText; color: "dimgrey" }
                PropertyChanges { target: passwordText; color: "dimgrey" }
                PropertyChanges { target: control; state: "hoverLeaveLight" }
                PropertyChanges { target: eyePassword; state: "hide" }
            },
            State {
                name: "dark"
                PropertyChanges { target: themeType; source: "/images/sun.png" }
                PropertyChanges { target: rightRect; color: "#1e1e1e" }
                PropertyChanges { target: leftRect; color: "#292929" }
                PropertyChanges { target: mainText; color: "white" }
                PropertyChanges { target: logInText; color: "white" }
                PropertyChanges { target: logInInfoText; color: "#979797" }
                PropertyChanges { target: emailText; color: "#979797" }
                PropertyChanges { target: passwordText; color: "#979797" }
                PropertyChanges { target: control; state: "hoverLeaveDark" }
                PropertyChanges { target: emailField; color: "#979797" }
                PropertyChanges { target: passField; color: "#979797" }
                PropertyChanges { target: eyePassword; state: "hideDark" }
            }
        ]
    }


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
                    id: logInText
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
                    id: logInInfoText
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
                    id: emailText
                    text: "Enter your email address"
                    font.pointSize: 10
                    color: "dimgrey"
                    font.bold: true
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                } // 6


                // 7
                TextField  {
                    id: emailField
                    placeholderText: "name@example.com"
                    color: "black"
                    focus: true
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true
                    selectByMouse: true // выделение содержимого
                    selectionColor: "grey"

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
                    id: passwordText
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
                        selectByMouse: true
                        selectionColor: "grey"
                        color: "black"

                        focus: true
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
                        sourceSize.width: 16
                        sourceSize.height: 16

                        MouseArea {
                            cursorShape: Qt.PointingHandCursor
                            anchors.fill: parent
                            onClicked: {
                                if (eyePassword.state === "show")
                                    eyePassword.state = "hide"
                                else if (eyePassword.state === "hide")
                                    eyePassword.state = "show"
                                else if (eyePassword.state === "showDark")
                                    eyePassword.state = "hideDark"
                                else
                                    eyePassword.state = "showDark"
                            }
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
                            },
                            State {
                                name: "showDark"
                                PropertyChanges { target: eyePassword; source: "/images/showDark.png" }
                                PropertyChanges { target: passField; echoMode: TextField.Normal }
                            },
                            State {
                                name: "hideDark"
                                PropertyChanges { target: eyePassword; source: "/images/hideDark.png" }
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

                    onHoveredChanged: () => {
                        if (control.state === "hoverLeaveLight")
                            control.state = "hoverEnterLight"
                        else if (control.state === "hoverEnterLight")
                            control.state = "hoverLeaveLight"
                        else if (control.state === "hoverLeaveDark")
                            control.state = "hoverEnterDark"
                        else
                            control.state = "hoverLeaveDark"
                    }


                    states: [
                        State {
                            name: "hoverEnterLight"
                            PropertyChanges { target: lbl; color: "#6c63fe" }
                            PropertyChanges { target: rectBg; color: "white" }
                            PropertyChanges { target: rectBg; border.color: "#6c63fe" }
                        },
                        State {
                            name: "hoverLeaveLight"
                            PropertyChanges { target: lbl; color: "white" }
                            PropertyChanges { target: rectBg; color: "#6c63fe" }
                        },
                        State {
                            name: "hoverEnterDark"
                            PropertyChanges { target: rectBg; color: "#292929" }
                            PropertyChanges { target: lbl; color: "#6c63fe" }
                        },
                        State {
                            name: "hoverLeaveDark"
                            PropertyChanges { target: rectBg; color: "#6c63fe" }
                            PropertyChanges { target: lbl; color: "#292929" }
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
                    id: mainText
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
