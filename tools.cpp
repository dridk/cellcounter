#include "tools.h"
#include <QDebug>
#include <QFileDialog>
#include <QJsonObject>
#include <QJsonArray>
#include <QApplication>
Tools::Tools(QObject *parent) :
    QObject(parent)
{


}

void Tools::saveJson(const QString &title,
                     int maxCount,
                     int concentration,
                     QAbstractListModel *model)
{





}

QString Tools::applicationPath()
{

        return QApplication::applicationDirPath();


}

QString Tools::version()
{
    return qApp->applicationVersion();
}

