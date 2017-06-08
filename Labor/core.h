#ifndef CORE_H
#define CORE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QDebug>
#include "registrationclass.h"
#include "userinfo.h"
#include "loginclass.h"

#define _ qDebug() <<

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
