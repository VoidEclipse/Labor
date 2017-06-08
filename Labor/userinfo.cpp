#include "userinfo.h"

#include <QDebug>

UserInfo::UserInfo(QObject *parent) : QObject(parent)
{

}

QString UserInfo::login() const
{
    return p_login;
}

void UserInfo::setLogin(const QString &value)
{
    p_login = value;
}

QString UserInfo::password() const
{
    return p_password;
}

void UserInfo::setPassword(const QString &value)
{
    p_password = value;
}

QString UserInfo::token() const
{
    return p_token;
}

void UserInfo::setToken(const QString &value)
{
    p_token = value;
}

int UserInfo::id() const
{
    return p_id;
}

void UserInfo::setId(int value)
{
    p_id = value;
}

QDebug operator<<(QDebug d, const UserInfo &info)
{
    d << "id" << info.id() << "Login" << info.login() << "Password" << info.password() << "Token" << info.token();
    return d;
}
