#ifndef CORE_H
#define CORE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>
#include <QNetworkReply>
#include <QDebug>

#define _ qDebug() <<

class UserInfo;
class LoginClass;
class RegistrationClass;

class CoreApp : public QObject
{
    Q_OBJECT
public:
    explicit CoreApp();
    ~CoreApp();
    void regUser(QString email, QString password, QString firstName, QString secondName, QString surName);

    UserInfo *getUserInfo() const;
    QNetworkAccessManager *getHttps() const;

signals:

public slots:
    void finished(QNetworkReply* reply);

private:
    QSettings *settings;
    QQmlApplicationEngine *engine;
    QQmlContext *context;
    QNetworkAccessManager *https;
    RegistrationClass *registration;
    LoginClass *login;
    UserInfo *userInfo;
};

#endif // CORE_H
