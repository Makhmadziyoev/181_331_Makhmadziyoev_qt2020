#include "qhttpcontroller.h"
#include <QNetworkRequest>
#include <QSslSocket>
#include <QNetworkReply>
#include <QEventLoop>
#include <QNetworkAccessManager>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonArray>
#include <QtWidgets/QTableView>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlTableModel>
#include <QDesktopServices>
#include <QAuthenticator>
//#include <QOAuth2AuthorizationCodeFlow>
//#include <QOAuthHttpServerReplyHandler>
#include <QJsonObject>

QHttpController::QHttpController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager;
}

void QHttpController::getSiteValue()
{
    QNetworkRequest request;
    request.setUrl(QUrl("https://hajimexarnella.com/"));     //http://www.rrrgggbbb.com/ http://www.rrrgggbbb.com//www.gismeteo.ru/weather-moscow-4368/
    qDebug() << request.url(); //<< request.rawHeaderList();
    QNetworkReply * reply;
    QEventLoop evtloop;
    connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit);
    //    if(connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit)){qDebug() << "QNetworkAccessManager::finished success";}
    reply=nam->get(request);
    evtloop.exec(); //execution of the loop


    QString replystr = reply->readAll();
    QString tmp = replystr.left(100);

    int j;
    QString usdnumber;
    j=replystr.indexOf("собрали:");
    j+=96;
    for (int i = 0; i < 30; i++){
        if ((replystr[j+i]<="9" && replystr[j+i]>="0") || (replystr[j+i] == ",")){
            usdnumber[i] = replystr[j+i];
        }
    }

    emit toQML(QString(replystr),usdnumber);


    QString replyString = reply->readAll();

    qDebug() << "getNetworkValue()";
    qDebug() << reply->url()
             << reply->rawHeaderList();





}

void QHttpController::token(QString url)
{
    QString token;
    if(url.contains("email=") || url.contains("refresh_token="))
    {
        if (url.contains("refresh_token=")) // если все успешно
        {
            token = url.split("refresh_token=")[1].split("&")[0]; // записываем наш access_token в переменную
            emit toQML3(url, token);
            //qDebug() << "Access Token: " << token;
        }
        else{
            emit toQML4();
            //qDebug() << "No token (((";
        }
    }
}
