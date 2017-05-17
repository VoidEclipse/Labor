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
                x: 10
                height: 55
                width: parent.width - 10



                RowLayout{

                    anchors.verticalCenter: parent.verticalCenter
                    Image
                    {
                        id: image
                        anchors.verticalCenter: parent.verticalCenter
                        source: model.image

                    }
                    Text
                    {
                        id: name
                        text: model.title
                    }
                }

                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }



            model: ListModel {
                ListElement { title: "Новости";       source: "qrc:/pages/BusyIndicatorPage.qml";   image: "qrc:/images/008-folded-newspaper.png"; }
                ListElement { title: "Профиль";       source: "qrc:/pages/profile.qml";        image: "qrc:/images/007-social.png" }
                ListElement { title: "Сообщения";     source: "qrc:/pages/CheckBoxPage.qml";        image: "qrc:/images/009-web.png" }
                ListElement { title: "Цели";          source: "qrc:/pages/ComboBoxPage.qml";        image: "qrc:/images/006-target.png" }
                ListElement { title: "Акции";         source: "qrc:/pages/DialPage.qml";            image: "qrc:/images/005-gift.png" }
                ListElement { title: "Студенты";      source: "qrc:/pages/DialogPage.qml";          image: "qrc:/images/004-graduation-cap.png" }
                ListElement { title: "Преподаватели"; source: "qrc:/pages/DelegatePage.qml";        image: "qrc:/images/003-university-lecture.png" }
                ListElement { title: "Настройки";     source: "qrc:/pages/FramePage.qml";           image: "qrc:/images/002-settings.png" }
                ListElement { title: "О приложении";  source: "qrc:/pages/GroupBoxPage.qml";        image: "qrc:/images/001-round.png" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane



    Dialog {
        id: settingsDialog
        x: Math.round((window.width - width) / 2)
        y: Math.round(window.height / 6)
        width: Math.round(Math.min(window.width, window.height) / 3 * 2)
        modal: true
        focus: true
        title: "Settings"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            settings.style = styleBox.displayText
            settingsDialog.close()
        }
        onRejected: {
            styleBox.currentIndex = styleBox.styleIndex
            settingsDialog.close()
        }

        contentItem: ColumnLayout {
            id: settingsColumn
            spacing: 20

            RowLayout {
                spacing: 10

                Label {
                    text: "Style:"
                }

                ComboBox {
                    id: styleBox
                    property int styleIndex: -1
                    model: ["Default", "Material", "Universal"]
                    Component.onCompleted: {
                        styleIndex = find(settings.style, Qt.MatchFixedString)
                        if (styleIndex !== -1)
                            currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label {
                text: "Restart required"
                color: "#e41e25"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Dialog {
        id: aboutDialog
        modal: true
        focus: true
        title: "About"
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            spacing: 20

            Label {
                width: aboutDialog.availableWidth
                text: "The Qt Quick Controls 2 module delivers the next generation user interface controls based on Qt Quick."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

            Label {
                width: aboutDialog.availableWidth
                text: "In comparison to the desktop-oriented Qt Quick Controls 1, Qt Quick Controls 2 "
                      + "are an order of magnitude simpler, lighter and faster, and are primarily targeted "
                      + "towards embedded and mobile platforms."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }
}

}
}
