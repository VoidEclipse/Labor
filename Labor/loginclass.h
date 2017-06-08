#ifndef LOGINCLASS_H
#define LOGINCLASS_H

#include <QObject>

class LoginClass : public QObject
{
    Q_OBJECT
public:
    explicit LoginClass(QObject *parent = nullptr);

signals:
    void activateView();

public slots:
};

#endif // LOGINCLASS_H
