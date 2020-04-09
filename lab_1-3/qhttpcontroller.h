#ifndef QHTTPCONTROLLER_H
#define QHTTPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>

class QHttpController : public QObject
{
    Q_OBJECT
public:
    explicit QHttpController(QObject *parent = nullptr);
    QNetworkAccessManager * nam;
public slots:
    void getSiteValue();
    signals:
        void toQML(QString reply);
};


#endif // QHTTPCONTROLLER_H
