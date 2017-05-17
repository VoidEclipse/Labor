import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
//import QtQuick.Controls.Material 2.1
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
//import QtGraphicalEffects 1.0

ApplicationWindow {
    id: registration
    title: qsTr("Регистрация")
    width: registration.width
    height: registration.height
    visible: true




    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#e8e0e0"

        Label{
            x: -150
            y: 29
            width: 300
            text: "Введите почту"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: email.top
            anchors.bottomMargin: 11
        }

        TextInput {
            id: email
            x: 60
            y: 60
            width: 300
            height: 20
            text: qsTr("")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.italic: false
            inputMask: ""
            font.pixelSize: 20

            Label {
                id: label
                x: 0
                y: 8
                text: qsTr("________________________________________________")
                font.weight: Font.Thin
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
            }
        }

        Label{
            x: -150
            y: 86
            width: 300
            text: "Введите пароль"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: password.top
            anchors.bottomMargin: 14
        }

        TextInput {
            id: password
            y: 136
            width: 300
            height: 20
            text: qsTr("")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            inputMask: ""
            font.pixelSize: 20

            Label {
                id: label1
                x: 1
                y: 8
                text: qsTr("________________________________________________")
                font.weight: Font.Thin
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
            }
        }

        Label{
            x: -150
            y: 146
            width: 300
            text: "Подтвердите пароль"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: passwordAccept.top
            anchors.bottomMargin: 14

        }

        TextInput {
            id: passwordAccept
            x: 60
            y: 209
            width: 300
            height: 20
            text: qsTr("")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            inputMask: ""
            font.pixelSize: 20

            Label {
                id: label2
                x: 1
                y: 8
                text: qsTr("________________________________________________")
                font.weight: Font.Thin
                wrapMode: Text.NoWrap
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
            }
        }

        Label{
            x: -150
            y: 206
            width: 300
            text: "Введите имя"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: name.top
            anchors.bottomMargin: 14
        }

        TextInput {
            id: name
            x: 60
            y: 284
            width: 300
            height: 20
            text: qsTr("")
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            inputMask: ""
            font.pixelSize: 20

            Label {
                id: label3
                x: 0
                y: 8
                text: qsTr("________________________________________________")
                font.weight: Font.Thin
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
            }
        }

        Label{
            x: -150
            y: 266
            width: 299
            text: "Введите фамилию"
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: surname.top
            anchors.bottomMargin: 14
        }

        TextInput {
            id: surname
            x: 60
            y: 359
            width: 300
            height: 20
            text: qsTr("")
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            inputMask: ""
            font.pixelSize: 20

            Label {
                id: label4
                x: 1
                y: 8
                text: qsTr("________________________________________________")
                font.weight: Font.Thin
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
            }
        }

        Button {
            id: regButton
            x: -40
            y: 540
            width: 300
            height: 50
            Rectangle{
                id: rectangle2
                width: parent.width
                height: parent.height
                color: "#28b6f6"

                Text {
                    id: reg
                    color: "white"
                    text: qsTr("Зарегистрироваться")
                    font.pixelSize: 20
                    font.bold: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

