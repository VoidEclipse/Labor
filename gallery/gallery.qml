import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    width: window.width
    height: window.height
    visible: true
    title: "Labor"

    Settings {
        id: settings
        property string style: "Material"
    }

    Shortcut {
        sequence: "Esc"
        enabled: stackView.depth > 1
        onActivated: {
            stackView.pop()
            listView.currentIndex = -1
        }
    }

    header: ToolBar {
        Material.foreground: "white"
        Material.background: "#28b6f6"


        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: stackView.depth > 1 ? "images/back.png" : "images/drawer.png"
                }
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
                        drawer.open()
                    }
                }
            }

            Label {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : "Labor"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "images/menu.png"
                }
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 4 * 3.3
        height: window.height
        dragMargin: stackView.depth > 1 ? 0 : undefined

       Rectangle{
            id: avatarBackground
            z:2
            color: "#28b6f6"
            height: 145
            width: parent.width


            Image {
                id: shadow1
                source: "qrc:/images/shadow_title.png"
                width: parent.width
                height: 8
                smooth: true
                anchors.top: avatarBackground.bottom
            }

            Image {
                id: avatar
                x: 15
                y: 12
                source: "qrc:/images/avatar.png"
                width: 77
                height: 77
                smooth: true
                antialiasing: true
            }

            Text {
                id: secondName
                x: 15
                y: 95
                text: qsTr("Куликов")
                color: "white"
                font.pointSize: 17
            }
            Text {
                id: userName
                x: 87
                y: 95
                text: qsTr("Никита")
                color: "white"
                font.pointSize: 17
            }

            Text {
                id: userGroup
                x: 15
                y: 120
                text: qsTr("ПОКС-41")
                color: "#dcd8d8"
                font.pointSize: 15
            }

        }





        ListView {
            id: listView
            focus: true
            currentIndex: -1
            width: parent.width
            height: parent.height - avatarBackground.height
            anchors.top: avatarBackground.bottom


            delegate: ItemDelegate {
                           height: 55
                           width: parent.width
                           text: model.title


                           Image {
                               id: listIcon
                               x: 10
                               anchors.verticalCenter: parent.verticalCenter
                               source: model.image

                           }


                           highlighted: ListView.isCurrentItem
                           onClicked: {
                               listView.currentIndex = index
                               stackView.push(model.source)
                               drawer.close()
                           }
                       }


            model: ListModel {
                ListElement { title: "          Новости";       source: "qrc:/pages/news.qml";                image: "qrc:/images/newsicon.png"; }
                ListElement { title: "          Профиль";       source: "qrc:/pages/profile.qml";             image: "qrc:/images/profileicon.png" }
                ListElement { title: "          Сообщения";     source: "qrc:/pages/messages.qml";            image: "qrc:/images/messagesicon.png" }
                ListElement { title: "          Цели";          source: "qrc:/pages/ComboBoxPage.qml";        image: "qrc:/images/tasksicon.png" }
                ListElement { title: "          Акции";         source: "qrc:/pages/DialPage.qml";            image: "qrc:/images/salesicon.png" }
                ListElement { title: "          Студенты";      source: "qrc:/pages/DialogPage.qml";          image: "qrc:/images/studentsicon.png" }
                ListElement { title: "          Преподаватели"; source: "qrc:/pages/DelegatePage.qml";        image: "qrc:/images/teachersicon.png" }
                ListElement { title: "          Расписание";    source: "qrc:/pages/schedule.qml";            image: "qrc:/images/scheduleicon.png" }
                ListElement { title: "          Настройки";     source: "qrc:/pages/settings.qml";            image: "qrc:/images/settingsicon.png" }
                ListElement { title: "          О приложении";  source: "qrc:/pages/GroupBoxPage.qml";        image: "qrc:/images/infoicon.png" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane


        }
    }
}
