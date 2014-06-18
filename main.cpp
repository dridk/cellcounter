#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include "tools.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Tools tools;

    engine.rootContext()->setContextProperty("tools",&tools);

    engine.load(QUrl(QStringLiteral("qrc:///cellcounter.qml")));




    return app.exec();
}
