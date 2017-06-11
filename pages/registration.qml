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

        TextField {
            id: passwordAgainInput
            width: 200
            placeholderText: qsTr("Повтор пароля")
            anchors.horizontalCenter: parent.horizontalCenter
            Material.accent: Material.LightBlue
            echoMode: TextInput.Password
        }


        TextField {
            id: firstNameInput
            width: 200
            placeholderText: qsTr("Имя")
            anchors.horizontalCenter: parent.horizontalCenter
            Material.accent: Material.LightBlue
            validator: RegExpValidator { regExp:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
                onTextChanged: {
                    textError.state ="hide";
                    textError.text = "";
                }
        }

        TextField {
            id: secondNameInput
            width: 200
            placeholderText: qsTr("Фамилия")
            anchors.horizontalCenter: parent.horizontalCenter
            Material.accent: Material.LightBlue
            validator: RegExpValidator { regExp:/\w+([-+.'@]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
                onTextChanged: {
                    textError.state ="hide";
                    textError.text = "";
                }
        }

        TextField {
            id: surNameInput
            width: 200
            placeholderText: qsTr("Отчество")
            anchors.horizontalCenter: parent.horizontalCenter
            Material.accent: Material.LightBlue
            validator: RegExpValidator { regExp:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
                onTextChanged: {
                    textError.state ="hide";
                    textError.text = "";
                }
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
                if(emaiInput.text.trim().length===0 || passwordInput.text.trim().length===0 ||
                passwordAgainInput.text.trim().length===0 || firstNameInput.text.trim().length===0 ||
                secondNameInput.text.trim().length===0 || surNameInput.text.trim().length===0)
                    ToolTip.show("Не все поля заполнены!", 1000)

                else if(passwordInput.text != passwordAgainInput.text)
                    ToolTip.show("Пароли не совпадают!", 1000)

                else if(passwordInput.length < 4)
                    ToolTip.show("Пароль слишком короткий!", 1000)

                else if(passwordInput.length > 55)
                    ToolTip.show("Пароль слишком длинный!", 1000)

                else if(firstNameInput.length, secondNameInput.length, surNameInput.length < 2)
                    ToolTip.show("ФИО не менее двух символов!", 1000)

                else
                registrationCpp.regUser(emaiInput.text, passwordInput.text, firstNameInput.text,
                                                        secondNameInput.text, surNameInput.text)
                ToolTip.show("Успешная регистрация!", 1000)
            }


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
                loginCpp.activateView()
            }

        }

    }
}

