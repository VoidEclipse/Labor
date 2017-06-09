#ifndef LOGINCLASS_H
#define LOGINCLASS_H

#include <QObject>

class CoreApp;
class QNetworkReply;

class LoginClass : public QObject
{
    Q_OBJECT
public:
    explicit LoginClass(QObject *parent = nullptr, CoreApp *core = nullptr);
    Q_INVOKABLE void loginUser(QString email, QString password);
signals:
    void activateView();

public slots:
    void slotReadyRead();

private:
    CoreApp *p_core;
    QNetworkReply *reply;
};

#endif // LOGINCLASS_H
