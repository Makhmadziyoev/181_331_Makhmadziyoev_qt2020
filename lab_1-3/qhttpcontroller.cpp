#include "qhttpcontroller.h"
#include <QNetworkRequest>
#include <QSslSocket>
#include <QNetworkReply>
#include <QEventLoop>

QHttpController::QHttpController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager;
//    connect(nam, &QNetworkAccessManager::finished,this, &HttpController::SlotFinished);
//    connect(nam, &QNetworkAccessManager::sslErrors,
//            this, [this](QNetworkReply *reply,
//                        const QList<QSslError> &errors)
//                {
//                    qDebug() << "***sslErrors()";
//                    for(auto err : errors)
//                    {
//                        qDebug() << err;
//                    }
//                });

}

//void HttpController::SlotFinished(QNetworkReply * reply){
//    qDebug() << "SlotFinished()";
//    qDebug() << reply->url()
//             << reply->rawHeaderList()
//             << reply->readAll();

//}

void QHttpController::getSiteValue()
{
//    qDebug() << "*** slot doServerRequest() started";
    QNetworkRequest request;
    request.setUrl(QUrl("http://club-nissan.ru/forums")); //http://club-nissan.ru/forums https://www.gismeteo.ru/weather-moscow-4368/

//    qDebug() << request.url() << request.rawHeaderList();

    QNetworkReply * reply;
//    qDebug() << "*** before get()";



    QEventLoop evtloop;
    connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit);
//    if(connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit)){qDebug() << "QNetworkAccessManager::finished success";}
    reply=nam->get(request);
    evtloop.exec(); //execution of the loop
    QByteArray replystr = reply->readAll();
    QByteArray tmp = replystr.left(100);
//    qDebug() << "tmpArray:\t" << QString(tmp);
//    qDebug() << "supportsSsl() = "
//    << QSslSocket::supportsSsl() << endl
//    << QSslSocket::sslLibraryBuildVersionString()
//    << endl
//    << QSslSocket::sslLibraryVersionString();
//    qDebug() << "Size:\t" << reply->size();
//    qDebug() << "Error:\t" << reply->error();
//    qDebug() << "URL:\t" << reply->url();
//    qDebug() << "Headers:\t" << reply->rawHeaderPairs();
//    qDebug() << "Body:\t" << replystr.left(500);
    emit toQML(QString(replystr));
//    qDebug() << "get() finished";
//    qDebug() << reply->url()
//             << reply->rawHeaderList()
//             << reply->readAll();
}


























//QHttpController::QHttpController(QObject *parent) : QObject(parent)
//{
//    nam = new QNetworkAccessManager();
//    connect (nam, &QNetworkAccessManager::finished,
//             this, &QHttpController::SlotFinished);
//}

//void QHttpController::SlotFinished(QNetworkReply *reply)
//{
//    qDebug() << "SlotFinished()"
//    qDebug() << reply -> url()
//             << reply ->rawHeaderList()
//             << reply ->readAll();
//}


//void QHttpController::GetNetworkValue()
//{
//   QNetworkRequest request;
//   request.setUrl(QUrl("https://cbr.ru/"));
//   qDebug() << request.url() << request.rawHeaderList();
//   QNetworkReply * reply;
//   qDebug() <<"*** before get()";
//   QEventLoop evtLoop;
//   connect (nam, &QNetworkAccessManager::finished,
//            &evtLoop, &QEventLoop::quit);
//   reply = nam->get(request);
//   evtLoop.exec(); //запуск цикла ожидания

//    qDebug() << reply -> url()
//             << reply -> rawHeaderList()
//             << reply -> readAll();
//}
