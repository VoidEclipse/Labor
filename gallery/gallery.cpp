#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QUrl>

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("Labor");
    QGuiApplication::setOrganizationName("CuteCats");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    QGuiApplication app(argc, argv);

    QSettings settings;

        QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/pages/login.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
