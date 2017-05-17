TEMPLATE = app
TARGET = gallery
QT += quick quickcontrols2


SOURCES += \
    gallery.cpp \
    registration.cpp

RESOURCES += \
    gallery.qml \
    qtquickcontrols2.conf \
    $$files(images/*.png) \
    $$files(images/+material/*.png) \
    $$files(pages/*.qml) \

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols2/gallery
INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    registration.h
