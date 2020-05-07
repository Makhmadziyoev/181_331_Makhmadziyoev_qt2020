#ifndef QHTTPCONTROLLER_H
#define QHTTPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QFile>


class QHttpController : public QObject
{
    Q_OBJECT
public:
    explicit QHttpController(QObject *parent = nullptr);
    QNetworkAccessManager * nam;//класс http клиента - ответственен за открытие сокета/настройка сокета( в общем настройка сокета)
    //работа с заголовками ( с первой стартовой строкой) на ожидание по таймауту


public slots:
    void getSiteValue();
    void token(QString url);

signals:
        void toQML(QString reply,QString number);
//
        void toQML1(QString reply);
        void toQML2(QString reply);
        void toQML3(QString str1, QString str2);
        void toQML4();

};

#endif // QHTTPCONTROLLER_H
