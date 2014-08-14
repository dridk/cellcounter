#ifndef TOOLS_H
#define TOOLS_H

#include <QObject>
#include <QJsonDocument>
#include <QAbstractListModel>
class Tools : public QObject
{
    Q_OBJECT
public:
    explicit Tools(QObject *parent = 0);

    Q_INVOKABLE void saveJson(const QString& title,
                              int maxCount,
                              int concentration,
                              QAbstractListModel * model);

    Q_INVOKABLE QString applicationPath();

    Q_INVOKABLE QString version();


};

#endif // TOOLS_H
