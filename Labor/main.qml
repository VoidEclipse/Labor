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
    minimumHeight: 400
    minimumWidth: 400
    Connections
    {
        target: registrationCpp
        onActivateView: {stackView.pop(); stackView.push("qrc:/pages/registration.qml")}
    }
    Connections
    {
        target: loginCpp
        onActivateView: {stackView.pop(); stackView.push("qrc:/pages/login.qml")}
    }

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
                //                enabled: userInfoCpp.login() !== "" && userInfoCpp.password() !== "" && userInfoCpp.token() !== ""
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
                        text: "О приложении"
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

                onHeightChanged: height -= height % 2 == 0 ? 0 : 1
                Row
                {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 20
                    Image {
                        id: listIcon
                        anchors.verticalCenter: parent.verticalCenter
                        source: model.image

                    }

                    Text
                    {
                        text: model.title
                        anchors.verticalCenter: parent.verticalCenter
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
                ListElement { title: "Новости";       source: "qrc:/pages/news.qml";                image: "qrc:/images/newsicon.png"; }
                ListElement { title: "Профиль";       source: "qrc:/pages/profile.qml";             image: "qrc:/images/profileicon.png" }
                ListElement { title: "Цели";          source: "qrc:/pages/ComboBoxPage.qml";        image: "qrc:/images/tasksicon.png" }
                ListElement { title: "Акции";         source: "qrc:/pages/DialPage.qml";            image: "qrc:/images/salesicon.png" }
                ListElement { title: "Студенты";      source: "qrc:/pages/DialogPage.qml";          image: "qrc:/images/studentsicon.png" }
                ListElement { title: "Преподаватели"; source: "qrc:/pages/DelegatePage.qml";        image: "qrc:/images/teachersicon.png" }
                ListElement { title: "Расписание";    source: "qrc:/pages/schedule.qml";            image: "qrc:/images/scheduleicon.png" }
               }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        Component.onCompleted:
        {
            if (userInfoCpp.token() === "")
                stackView.push("qrc:/pages/login.qml")
        }


        initialItem: Pane {
                    id: pane

            Image {
                id: logo
                width: 390
                height: 300
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                fillMode: Image.PreserveAspectFit
                source: "images/logo.png"
            }

            Label {
                text: "Проект \"Labor\" помогает вам получать актуальное
                       расписание занятий, важные новости РКСИ и многое другое!"
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }
        }

                    Dialog {
                            id: aboutDialog
                            modal: true
                            focus: true
                            title: "О приложении"
                            x: (window.width - width) / 2
                            y: window.height / 6
                            width: Math.min(window.width, window.height) / 3 * 2
                            contentHeight: aboutColumn.height

                            Column {
                                id: aboutColumn
                                spacing: 20

                                Label {
                                    width: aboutDialog.availableWidth
                                    text: "Это приложение разработано для сайта (dipsite.vernicat.ru), в рамках стартапа \"Labor\"."
                                    wrapMode: Label.Wrap
                                    font.pixelSize: 12
                                }

                                Label {
                                    width: aboutDialog.availableWidth
                                    text: "Приложение полностью бесплатное и не требует никаких вложений, основываясь на свободной лицензии \"Freeware\"\n\n"
                                        + "Разработчики проекта:\n"
                                        + "Никита Куликов - мобильное приложение\n"
                                        + "Антон Карпович и Екатерина Вернигорова - веб-сайт\n\n"
                                        + "Все отзывы присылайте на почту: cutecats.team.rksi@gmail.com"
                                    wrapMode: Label.Wrap
                                    font.pixelSize: 12
                                }
                            }
                        }
    }
}
