TEMPLATE = app

QT += qml quick widgets multimedia

SOURCES += main.cpp \
    tools.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += tools.h

OTHER_FILES += \
    winicon.rc


win32 {
RC_FILE = appicon.rc
}
