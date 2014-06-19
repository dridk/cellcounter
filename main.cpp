#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QMessageBox>
#include <QDir>
#include "tools.h"
#include <QQuickView>
int main(int argc, char *argv[])
{
     QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Tools tools;

    engine.rootContext()->setContextProperty("tools",&tools);

    engine.load(QUrl(QStringLiteral("qrc:///cellcounter.qml")));




    return app.exec();
}
