import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    id: login

    Column
    {
        spacing: 10
        anchors.fill: parent
        Image {
            id: logo
            width: 390
            height: 300
            source: "qrc:/images/logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: emaiInput
            width: 200
            placeholderText: qsTr("Email")
            anchors.horizontalCenter: parent.horizontalCenter
            Material.accent: Material.LightBlue
            validator: RegExpValidator { regExp:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
                onTextChanged: {
                    textError.state ="hide";
                    textError.text = "";
                }
        }


        TextField {
            id: passwordInput
            width: 200
            placeholderText: qsTr("Пароль")
            anchors.horizontalCenter: parent.horizontalCenter
            Material.accent: Material.LightBlue
            echoMode: TextInput.Password
        }


        Button {
            Material.foreground: "white"
            Material.background: "#28b6f6"
            id: loginBtn
            width: 200
            height: 50
            text: qsTr("Вход")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (emaiInput.text.trim().length===0 || passwordInput.text.trim().length===0)
                    ToolTip.show("Не все поля заполнены!", 1000);

                else
                    loginCpp.loginUser(emaiInput.text.trim(), passwordInput.text.trim());    
                    //ToolTip.show("Успешно!", 1000)
            }

        }

        Button {
            Material.foreground: "white"
            Material.background: "#28b6f6"
            id: register
            width: 200
            height: 50
            text: qsTr("Регистрация")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                registrationCpp.activateView()
            }
        }
    }

}