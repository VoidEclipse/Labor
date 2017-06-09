#ifndef REGISTRATIONCLASS_H
#define REGISTRATIONCLASS_H

#include <QObject>

class CoreApp;
class QNetworkReply;

class RegistrationClass : public QObject
{
    Q_OBJECT
public:
    explicit RegistrationClass(QObject *parent = nullptr, CoreApp *core = nullptr);

signals:
    void activateView();

public slots:
    void regUser(QString email, QString password, QString firstName, QString secondName, QString surName);
    void slotReadyRead();
private:
    CoreApp *p_core;
    QNetworkReply *reply;
    QString lastLogin;
    QString lastPassword;
};

#endif // REGISTRATIONCLASS_H
