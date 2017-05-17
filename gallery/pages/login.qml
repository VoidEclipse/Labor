import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
//import QtQuick.Controls.Material 2.1
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
//import QtGraphicalEffects 1.0

ApplicationWindow {
    id: login
    title: qsTr("Вход")
    width: login.width
    height: login.height
    visible: true
    signal loginExit

     Rectangle {
         id: rectangle
         x: 0
         y: 0
         width: parent.width
         height: parent.height
         color: "#e8e0e0"

         Image {
             id: logo
             x: 16
             y: 0
             width: 390
             height: 300
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.centerIn: parent.width
             anchors.horizontalCenterOffset: 6
             anchors.top: parent.top
             anchors.topMargin: 0
             source: "qrc:/images/logo.png"
         }


     }

     Label{
         y: 287
         text: "Введите почту"
         anchors.left: emaiInput.right
         anchors.leftMargin: -200

     }

     TextInput {
         id: passwordInput
         x: -163
         y: 399
         width: 200
         height: 20
         text: qsTr("")
         anchors.horizontalCenterOffset: 0
         selectionColor: "#804d00"
         font.italic: false
         inputMask: ""
         anchors.horizontalCenter: parent.horizontalCenter
         font.pixelSize: 20
     }

     Label{
         y: 365
         text: "Введите пароль"
         anchors.left: passwordInput.right
         anchors.leftMargin: -200

     }

     TextInput {
         id: emaiInput
         x: -40
         y: 320
         width: 200
         height: 20
         text: qsTr("")
         anchors.horizontalCenter: parent.horizontalCenter
         inputMask: ""
         font.pixelSize: 20
     }

     Button {
         id: logIn
         x: -40
         y: 467
         width: 200
         height: 50
         anchors.bottom: label.bottom
         anchors.bottomMargin: -83


         Rectangle{

             id: rectangle1
             width: parent.width
             height: parent.height
             color: "#28b6f6"

         Text {
             id: name
             width: 51
             height: 21
             color: "white"
             text: qsTr("Вход")
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.verticalCenter: parent.verticalCenter
             font.pixelSize: 20
             font.bold: false
         }
         }
         anchors.horizontalCenterOffset: 0
         anchors.horizontalCenter: label.horizontalCenter

         Loader{
                id: loadLabor
                anchors.fill: parent

            }

         onClicked: {


             loadLabor.source = "qrc:/gallery.qml"
              // ApplicationWindow.show();
                login.close();

         }

     }

     Button {
         id: register
         x: -40
         y: 535
         width: 200
         height: 50
         anchors.bottom: logIn.bottom
         anchors.bottomMargin: -68
         Rectangle{
             id: rectangle2
             width: parent.width
             height: parent.height
             color: "#28b6f6"

         Text {
             id: name1
             color: "white"
             text: qsTr("Регистрация")
             font.pixelSize: 20
             font.bold: false
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.verticalCenter: parent.verticalCenter
            }
         }
         anchors.horizontalCenterOffset: 0
         anchors.horizontalCenter: logIn.horizontalCenter

         Loader{
             id: loadRegistration
             anchors.fill: parent

         }

         onClicked: {
         loadRegistration.source = "qrc:/pages/registration.qml"
            login.close();

         }
     }

     Label {
         id: label
         y: 414
         width: 200
         text: qsTr("_________________________________")
         font.weight: Font.Thin
         anchors.left: passwordInput.right
         anchors.leftMargin: -200
     }

     Label {
         id: label1
         y: 331
         text: qsTr("_________________________________")
         font.weight: Font.Thin
         anchors.left: emaiInput.right
         anchors.leftMargin: -200
     }




 }
