import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
//import QtQuick.Controls.Material 2.1
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
//import QtGraphicalEffects 1.0

Page {
    id: profilePage

    default property alias content: pane.contentItem


    Flickable {
        id: flickable
        height: 705
        anchors.bottomMargin: -220
        anchors.fill: parent
        contentHeight: pane.implicitHeight
        flickableDirection: Flickable.VerticalFlick

        Pane {
            id: pane
            width: parent.width
        }



        Rectangle{
            id: rectangle

            height: 200
            width: parent.width

            Image {
                id: profileBackground
                source: "qrc:/images/rksi.png"
                height: parent.height
                width: parent.width
            }

            Image {
                id: avatar
                x: 260
                y: 40
                width: 130
                height: 130
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: parent.width
                source: "qrc:/images/avatar.png"

            }


        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 200
            width: parent.width
            height: 500
            color: "white"

            Label {
                id: label
                y: 19
                text: qsTr("Имя")
                anchors.left: parent.left
                anchors.leftMargin: 24
                font.weight: Font.Light
                font.pixelSize: 18
                fontSizeMode: Text.VerticalFit
            }

            Label {
                id: label1
                y: 51
                text: qsTr("Никита")
                anchors.left: parent.left
                anchors.leftMargin: 24
                font.pixelSize: 23
            }

            Label {
                id: label2
                y: 108
                text: qsTr("Фамилия")
                anchors.left: parent.left
                anchors.leftMargin: 24
                font.weight: Font.Light
                font.pixelSize: 18
            }

            Label {
                id: label3
                y: 140
                text: qsTr("Куликов")
                anchors.left: parent.left
                anchors.leftMargin: 24
                font.pixelSize: 23
            }

            Label {
                id: label4
                y: 193
                text: qsTr("Группа")
                anchors.left: parent.left
                anchors.leftMargin: 24
                font.weight: Font.Light
                font.pixelSize: 18
            }

            Label {
                id: label5
                y: 225
                text: qsTr("ПОКС-41")
                anchors.left: parent.left
                anchors.leftMargin: 24
                font.pixelSize: 23
            }

            Text {
                id: text1
                x: 24
                y: 87
                color: "#e0dbdb"
                text: qsTr("________________________________________________")
                font.weight: Font.Light
                font.pixelSize: 12
            }
            Text {
                id: text2
                x: 25
                y: 261
                color: "#e0dbdb"
                text: qsTr("________________________________________________")
                font.weight: Font.Light
                font.pixelSize: 12
            }
            Text {
                id: text3
                x: 25
                y: 171
                color: "#e0dbdb"
                text: qsTr("________________________________________________")
                font.weight: Font.Light
                font.pixelSize: 12
            }
        }

        RoundButton{
            id: uploadAvatar
            x: 564
            y: 166
            width: 65
            height: 65
            spacing: -4
            antialiasing: true
            anchors.right: parent.right
            anchors.rightMargin: 11

            Rectangle{
                x: 0
                y: 0
                width: 65
                height: 65
                color: "#28b6f6"
                radius: 33
                border.width: 0
                z: 0
            }

            Image {
                id: avatarUpload
                x: 15
                y: 15
                width: 35
                height: 35
                source: "qrc:/images/avatarupload.png"
            }

        }


        ScrollIndicator.vertical: ScrollIndicator { }

    }
}
