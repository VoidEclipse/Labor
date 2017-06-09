#include "registrationclass.h"

#include "core.h"
#include "userinfo.h"
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>

RegistrationClass::RegistrationClass(QObject *parent, CoreApp *core) : QObject(parent), p_core(core)
{

}

void RegistrationClass::regUser(QString email, QString password, QString firstName, QString secondName, QString surName)
{
    QNetworkRequest request;
    request.setUrl(QUrl("http://labor.vernicat.ru/api.php?method=user.registration"));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QByteArray params;
    params.append("email='"+email+"'&");
    params.append("password='"+password+"'&");
    params.append("passwordConfirm='"+password+"'&");
    params.append("firstName='"+firstName+"'&");
    params.append("secondName='"+secondName+"'&");
    params.append("surName='"+surName+"'&");

    reply = p_core->getHttps()->post(request, params);
    connect(reply, SIGNAL(readyRead()), this, SLOT(slotReadyRead()));
    lastLogin=email;
    lastPassword=password;
}

void RegistrationClass::slotReadyRead()
{
    QByteArray raw = reply->readAll();
    reply->disconnect();
    delete reply;
    _ raw;
    QJsonDocument replyJson(QJsonDocument::fromJson(raw));
    _ replyJson;
    QJsonObject response(replyJson.object()["response"].toObject());

    if (response.value("successRegistration").toInt()==1)
    {
        //Всё заебись
        p_core->getUserInfo()->setLogin(lastLogin);
        p_core->getUserInfo()->setPassword(lastPassword);
        p_core->getUserInfo()->setId(response.value("userId").toInt());
    }

}
