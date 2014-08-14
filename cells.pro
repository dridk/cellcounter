TEMPLATE = app

QT += qml quick widgets multimedia

SOURCES += main.cpp \
    tools.cpp

RESOURCES += qml.qrc



HEADERS += tools.h

OTHER_FILES += \
    winicon.rc


win32 {
RC_FILE = appicon.rc
}
