CONFIG += qt

TARGET = qml-demo

SOURCES = src/main.cpp \
    src/buzzer.cpp
FORMS =
HEADERS = \
    src/buzzer.h

QT += declarative

MOC_DIR = moc

OTHER_FILES += \
    qml/main.qml \
    qml/Button.qml
