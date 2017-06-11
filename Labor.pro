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

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
