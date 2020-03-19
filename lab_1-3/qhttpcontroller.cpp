#include "qhttpcontroller.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QEventLoop>

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
