import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import Qt.labs.settings 1.0
import Qt.labs.calendar 1.0
import QtGraphicalEffects 1.0


Item {

    Pane{

        id: new0
        width: parent.width
        height: 300

        Rectangle{
            id: rNew0
            width: parent.width
            height: parent.height
            antialiasing: true
            anchors.fill: parent

            Image {
                id: imgNew0
                x: 8
                y: 8
                width: 100
                height: 100
                antialiasing: true
                anchors.top: parent.TopLeft
                source: "qrc:/images/newicon.png"

            }

            Label {
                id: newTitle0
                y: 24
                height: 68
                text: qsTr("Добро пожаловать в раздел \"Новости\"!")
                anchors.rightMargin: 29
                anchors.leftMargin: 11
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: imgNew0.right
                anchors.right: parent.right
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
                font.pixelSize: 18
            }

            Text{
                id: txtNew0
                x: 8
                y: 114
                height: 154
                text: "Здесь вы сможете получать актуальные новости РКСИ!"
                anchors.leftMargin: 18
                anchors.margins: 20
                anchors.bottom: Text.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.pixelSize: 15
            }


        }

        DropShadow{
            id: dropShadow
            anchors.fill: rNew0
            horizontalOffset: 0
            verticalOffset: 1
            radius: 5
            samples: 10
            color: "#80000000"
            source: rNew0
        }
    }


}
