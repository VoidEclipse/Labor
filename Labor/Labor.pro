TEMPLATE = app
TARGET = Labor
QT += quick quickcontrols2 xml

RESOURCES += \
    qml.qrc \
    images.qrc

HEADERS += \
    core.h \
    registrationclass.h \
    loginclass.h \
    userinfo.h \
    loginclass.h

SOURCES += \
    main.cpp \
    core.cpp \
    registrationclass.cpp \
    userinfo.cpp \
    loginclass.cpp
