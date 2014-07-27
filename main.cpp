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

    QQuickView * view = new QQuickView;

    Tools tools;

    view->setSource(QUrl(QStringLiteral("qrc:///cellcounter.qml")));

    view->engine()->rootContext()->setContextProperty("tools",&tools);

    view->show();



    return app.exec();
}
