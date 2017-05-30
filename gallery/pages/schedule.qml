import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
//import QtQuick.Controls.Material 2.1
//import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0
import Qt.labs.calendar 1.0
//import QtGraphicalEffects 1.0

Page {
    id: schedulePage

    default property alias content: pane.contentItem


    Flickable {
        id: flickable
        height: 705
        anchors.bottomMargin: -220
        anchors.fill: parent
        contentHeight: pane.implicitHeight
        flickableDirection: Flickable.AutoFlickIfNeeded

        Pane {
            id: pane
            width: parent.width

            Rectangle{
                id: time
                width: parent.width
                height: 90
/*
        Image {
            id: msgUserAvatar
            y: 12
            width: 66
            height: 66
            anchors.left: parent.left
            anchors.leftMargin: 16
            source: "../images/avatar.png"
        }

        Label {
            id: msgUserName
            x: 113
            y: 35
            text: qsTr("Никита")
            anchors.left: toolSeparator.right
            anchors.leftMargin: 16
            font.pixelSize: 17
        }

        Label {
            id: msgUserSurname
            y: 35
            text: qsTr("Куликов")
            anchors.left: msgUserName.right
            anchors.leftMargin: 11
            font.pixelSize: 17
        }

        Label {
            id: label
            y: 20
            width: 9
            height: 51
            color: "#b0a8a8"
            text: qsTr("|")
            font.pixelSize: 37
            font.italic: false
            anchors.left: msgUserAvatar.right
            anchors.leftMargin: 16
            font.weight: Font.ExtraLight
        }


            }


            DropShadow{
            anchors.fill: time
            horizontalOffset: 0
            verticalOffset: 1
            radius: 9
            samples: 10
            color: "#80000000"
            source: time
        }


*/
        }
    }
}
}
