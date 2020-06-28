#ifndef QHTTPCONTROLLER_H
#define QHTTPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QFile>
#include "mailmodel.h"



class QHttpController : public QObject
{
    Q_OBJECT
public:
    explicit QHttpController(QObject *parent = nullptr);
    QNetworkAccessManager * nam;//класс http клиента - ответственен за открытие сокета/настройка сокета( в общем настройка сокета)
    //работа с заголовками ( с первой стартовой строкой) на ожидание по таймауту
    QString m_accessToken; // полученный access_token
    MailModel *mail_model; // наша модель
    QString session_secr; //получение секрета
    QString myHashMd5; // получение хеша

public slots:
    void getSiteValue();
    QString success(QString add);
    void restRequest();
    void hashMD5(QString add);
    void db_write();
    bool db_read();

signals:
    void toQML(QString reply,QString number);
    //
    void toQML1(QString reply);
    void toQML2(QString reply);
    void toQML3(QString str1, QString str2);
    void toQML4();
    void toQML9(int nature, int phone, int game, int car,int  avatar /*,int newalbum*/ );

protected:
    QObject *showHttp;

};


#endif // QHTTPCONTROLLER_H
