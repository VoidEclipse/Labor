#include "core.h"
#include "registrationclass.h"
#include "userinfo.h"
#include "loginclass.h"

CoreApp::CoreApp() : QObject()
{
    settings = new QSettings("CuteCats", "Labor");
    userInfo = new UserInfo(this->parent());

    userInfo->setLogin(settings->value("login").toString());
    userInfo->setPassword(settings->value("password").toString());
    userInfo->setToken(settings->value("token").toString());
    userInfo->setId(settings->value("id").toInt());

    _ *userInfo;

    https = new QNetworkAccessManager(this->parent());

    registration = new RegistrationClass(this->parent(), this);
    login = new LoginClass(this->parent(), this);

    engine = new QQmlApplicationEngine(this->parent());//Инициация ядра сцены qml
    context = engine->rootContext();//получение главного контекста

    context->setContextProperty("coreCpp", this);//пхаем в контект класс ядра
    context->setContextProperty("userInfoCpp", userInfo);
    context->setContextProperty("registrationCpp", registration);
    context->setContextProperty("loginCpp", login);

    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
    connect(https, SIGNAL(finished(QNetworkReply*)), this, SLOT(finished(QNetworkReply*)));

    if(userInfo->id() > 0)
    {
        QNetworkRequest request;
        request.setUrl(QUrl("http://labor.vernicat.ru/api.php?method=user.get&userId=" + QString::number(userInfo->id())));
        request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        https->get(request);
    }
}

CoreApp::~CoreApp()
{
    settings->setValue("login", userInfo->login());
    settings->setValue("password", userInfo->password());
    settings->setValue("token", userInfo->token());
    settings->setValue("id", userInfo->id());
    delete https;
    delete registration;
    delete login;
    delete userInfo;
    delete settings;
}

UserInfo *CoreApp::getUserInfo() const
{
    return userInfo;
}

QNetworkAccessManager *CoreApp::getHttps() const
{
    return https;
}

void CoreApp::finished(QNetworkReply *reply)
{
    QByteArray raw(reply->readAll());
    QJsonDocument replyJson(QJsonDocument::fromJson(raw));
    QJsonObject response(replyJson.object().value("response").toArray()[0].toObject());
    _ response;
    _ response.value("secondName").toString();
    _ response.value("firstName").toString();
    _ response.value("surName").toString();
}


