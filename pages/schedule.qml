import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import Qt.labs.settings 1.0
import Qt.labs.calendar 1.0
import QtGraphicalEffects 1.0

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
                height: 70

                Label {
                    id: label2
                    y: 24
                    text: qsTr("Группа")
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    font.pixelSize: 18
                }


                ComboBox {
                    x: 418
                    y: 11

                    currentIndex: 0
                    model: ListModel {
                        id: grouplist
                        ListElement { text: "..."; }
                        ListElement { text: "ИБ-21"; }
                        ListElement { text: "ИБ-11"; }
                        ListElement { text: "ПОКС-11"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }
                        ListElement { text: "ПОКС-21"; }

                    }
                    width: 190
                    height: 48
                    font.pixelSize: 16
                    anchors.right: parent.right
                    anchors.rightMargin: 8
                    onCurrentIndexChanged: changeImage();

                        function changeImage(){
                             if      (currentIndex == 1 ){
                                 scheduleImg1.source = "qrc:/images/schedule/IB_21.png"
                             }else if(currentIndex == 2){
                                scheduleImg1.source = "qrc:/images/schedule/IB_11.png"
                             }else if(currentIndex == 3){
                                scheduleImg1.source = "qrc:/images/schedule/IB_11.png"
                             }else if(currentIndex == 4){
                                scheduleImg1.source = "qrc:/images/schedule/IB_11.png"
                             }

                        }
                }
            }


            DropShadow{
                anchors.fill: time
                horizontalOffset: 0
                verticalOffset: 1
                radius: 7
                samples: 10
                color: "#80000000"
                source: time
            }

        }


        Pane{
            id: pane1
            width: parent.width
            y: 200

            Rectangle{
                id: scheduleImg
                width: parent.width
                height: 170

                Button{
                    width: parent.width
                    height: parent.height
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                    anchors.topMargin: 5

                Image {
                    id: scheduleImg1
                    width: parent.width
                    height: 170
                    anchors.fill: parent
                    //source:
                }
               onPressed: scheduleImg1.scale = 1.5, scheduleImg1.rotation = 90
               onPressedChanged: scheduleImg1.rotation = 0, scheduleImg1.scale = 1
}

}
            DropShadow{
                anchors.fill: scheduleImg
                horizontalOffset: 0
                verticalOffset: 1
                radius: 7
                samples: 10
                color: "#80000000"
                source: scheduleImg
            }

         }
    }
}
