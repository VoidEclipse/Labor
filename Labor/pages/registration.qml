import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import Qt.labs.settings 1.0

Item {
    id: registration



    Column
    {
        anchors.fill: parent
        spacing: 10

        Label
        {
            Material.foreground: "#28b6f6"
            Material.background: "white"
            text: "Регистрация"
            font.pixelSize: 22
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 20
        }

        TextField {
            id: emaiInput
            width: 200
            placeholderText: qsTr("Email")
            anchors.horizontalCenter: parent.horizontalCenter
        }


        TextField {
            id: passwordInput
            width: 200
            placeholderText: qsTr("Пароль")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: passwordAgainInput
            width: 200
            placeholderText: qsTr("Повтор пароля")
            anchors.horizontalCenter: parent.horizontalCenter
        }


        TextField {
            id: firstNameInput
            width: 200
            placeholderText: qsTr("Имя")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: secondNameInput
            width: 200
            placeholderText: qsTr("Фамилия")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: surNameInput
            width: 200
            placeholderText: qsTr("Отчество")
            anchors.horizontalCenter: parent.horizontalCenter
        }


        Button {
            Material.foreground: "white"
            Material.background: "#28b6f6"
            id: registerBtn
            width: 200
            height: 50
            text: qsTr("Регистрация")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                registrationCpp.regUser(emaiInput.text, passwordInput.text, firstNameInput.text, secondNameInput.text, surNameInput.text)
            }

        }
        Button {
            Material.foreground: "white"
            Material.background: "#28b6f6"
            id: loginBtn
            width: 200
            height: 50
            text: qsTr("Авторизация")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                loginCpp.activateView()
            }

        }

    }
}

