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
    params.append("email='"+email+"'&");
    params.append("password='"+password+"'&");
    _ params;
    reply = p_core->getHttps()->post(request, params);
    connect(reply, SIGNAL(readyRead()), this, SLOT(slotReadyRead()));
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
    return;
    QJsonObject response(replyJson.object()["response"].toObject());

    if (response.value("successRegistration").toInt()==1)
    {
        //Всё заебись
    }
}
