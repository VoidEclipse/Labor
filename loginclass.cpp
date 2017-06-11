#include "core.h"
#include "userinfo.h"
#include "loginclass.h"

LoginClass::LoginClass(QObject *parent, CoreApp *core) : QObject(parent), p_core(core), reply(nullptr)
{

}

void LoginClass::loginUser(QString email, QString password)
{
    if(reply != nullptr)
        return;

    QNetworkRequest request;
    request.setUrl(QUrl("http://labor.vernicat.ru/api.php?method=user.login"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QByteArray params;
    params.append("email="+email+"&");
    params.append("password="+password+"&");
    _ params;
    reply = p_core->getHttps()->post(request, params);
    connect(reply, SIGNAL(readyRead()), this, SLOT(slotReadyRead()));
    lastEmail = email;
    lastPassword=password;
}

void LoginClass::slotReadyRead()
{
    if(reply == nullptr)
        return;

    QByteArray raw = reply->readAll();
    reply->disconnect();
    delete reply;
    QJsonDocument replyJson(QJsonDocument::fromJson(raw));
    _ replyJson;
    QJsonObject response(replyJson.object()["response"].toObject());

    if (response.contains("userId"))
    {
        //it's ok
        _ response.value("userId").toString().toInt();
        UserInfo *info = p_core->getUserInfo();
        info->setId(response.value("userId").toString().toInt());
        info->setToken("test");//TODO: Добавить токен
        info->setLogin(lastEmail);
        info->setPassword(lastPassword);
        _ *info;
        emit activateViewInit();
    }
    else
    {
        //bad
    }
}
