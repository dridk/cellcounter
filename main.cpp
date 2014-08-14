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
    app.setApplicationVersion("v0.1");

    QQuickView * view = new QQuickView;

    Tools tools;

    view->setSource(QUrl(QStringLiteral("qrc:///cellcounter.qml")));

    view->engine()->rootContext()->setContextProperty("tools",&tools);

    view->setMinimumWidth(500);
    view->setMaximumWidth(500);
    view->setHeight(600);
    view->show();



    return app.exec();
}
