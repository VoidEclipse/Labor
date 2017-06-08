#ifndef USERINFO_H
#define USERINFO_H

#include <QObject>

class UserInfo : public QObject
{
    Q_OBJECT
public:
    explicit UserInfo(QObject *parent = nullptr);

    Q_INVOKABLE QString login() const;
    Q_INVOKABLE void setLogin(const QString &value);

    Q_INVOKABLE QString password() const;
    Q_INVOKABLE void setPassword(const QString &value);

    Q_INVOKABLE QString token() const;
    Q_INVOKABLE void setToken(const QString &value);
    friend QDebug operator<< (QDebug d, const UserInfo &info);

    Q_INVOKABLE int id() const;
    Q_INVOKABLE void setId(int value);

signals:

public slots:

private:
    int p_id;
    QString p_login;
    QString p_password;
    QString p_token;
};

#endif // USERINFO_H
