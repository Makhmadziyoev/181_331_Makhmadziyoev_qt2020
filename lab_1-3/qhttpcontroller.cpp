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
#include <QCryptographicHash>
#include <mailmodel.h>




QHttpController::QHttpController(QObject *QMLObject) : showHttp(QMLObject)
{

    nam = new QNetworkAccessManager(this); // создаем менеджер
    //  connect(nam, &QNetworkAccessManager::finished, this, &HttpController::SlotFinished);
    // connect(nam, &QNetworkAccessManager::finished, this, &QHttpController::getSiteValue);
   //  connect(nam, &QNetworkAccessManager::finished, this, &HttpController::noSuccess);
    mail_model = new MailModel();
}

void QHttpController::getSiteValue()
{
    QNetworkRequest request;
    request.setUrl(QUrl("https://calculator888.ru/skolko-dney-do-novogo-goda/"));     //http://www.rrrgggbbb.com/ http://www.rrrgggbbb.com//www.gismeteo.ru/weather-moscow-4368/
    qDebug() << request.url(); //<< request.rawHeaderList();
    QNetworkReply * reply;
    QEventLoop evtloop;
    connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit);
        if(connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit)){qDebug() << "QNetworkAccessManager::finished success";}
    reply=nam->get(request);
    evtloop.exec(); //execution of the loop


    QString replystr = reply->readAll();
    QString tmp = replystr.left(100); // задаем лимит на вывод строк сайта

    int j;
    QString usdnumber;
    j=replystr.indexOf("den_dan");
    j+=2;
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

QString QHttpController::success(QString add)
{
   qDebug() << "до   ";
    //QString m_accessToken; //token;
    if(add.contains("fail=") || add.contains("access_token="))
    {
        if (add.contains("access_token=")) // если все успешно
        {
            qDebug() << "цикл 1   ";
            m_accessToken = add.split("access_token=")[1].split("&")[0]; // записываем наш access_token в переменную
            emit toQML3(add, m_accessToken);
            qDebug() << "после условия   ";
         qDebug() << "Access Token: " << m_accessToken;
            return m_accessToken;

        }
        else{
            emit toQML4();
            qDebug() << "No token (((";
        }
    }
    QString str = " ";
    return str;
    qDebug() << "конец  ";
}

void QHttpController::hashMD5(QString add){ // 5 lab
    qDebug() <<"вывод "<< add;

    session_secr = "1a49cb75f0714f0b460b3a1a2ef5bec7";
            qDebug() << "Наш сикрет: " << session_secr;
            QString param = "7429961031030441625app_id=772344method=photos.getAlbumssession_key=" + m_accessToken + session_secr;
            qDebug() << "Наш параметр Али" << param;
            QByteArray array;
            array.append(param);
            qDebug() << "Наш массив Али" << array;
            myHashMd5 = QString(QCryptographicHash::hash((array),QCryptographicHash::Md5).toHex());
            qDebug() << "Наш хэш Али" << myHashMd5;

}

void QHttpController::restRequest(){

    QEventLoop loop;
    nam = new QNetworkAccessManager();

    QObject::connect(nam, // связываем loop  с нашим менеджером
                     SIGNAL(finished(QNetworkReply*)),
                     &loop,
                     SLOT(quit()));

      qDebug() << "Наш токен REST: " << m_accessToken;//users.getInfo
       qDebug() << "Наш хеш REST" << myHashMd5;
    QNetworkReply *reply = nam->get(QNetworkRequest(QUrl( "http://www.appsmail.ru/platform/api?method=photos.getAlbums&app_id=772344&session_key="+m_accessToken+"&sig="+myHashMd5 )));


                                                        /*"https://api.ok.ru/fb.do?application_key=CDGGDNJGDIHBABABA&format=json&method=photos.getPhotos"
                                                          "&sig="+ myHashMd5 +
                                                          "&access_token="+ m_accessToken  )));*/

     // qDebug() << "Наша nam" << nam;
    loop.exec();
   // QString photo(reply->readAll());

   //  qDebug() << "Наша URL-ka" << reply;
   //  qDebug() << "*** Список друзей в формате json ***" << photo;

//    // вся строка JSON с сервера грузится в QJsonDocument
      QJsonArray document = QJsonDocument::fromJson(reply->readAll()).array();

     qDebug() <<"Наш document"<< document;
      //QJsonObject root = document.object();
      //qDebug() <<"Наш root"<< root;
      //QJsonValue itog = root.value("country");
     //qDebug() <<"Photos"<< itog;
      //  QJsonObject itog1 = itog.toObject();
       //qDebug() << itog1;
     // QJsonValue itog2 = itog1.value("items");
       //qDebug() << itog2;
      //QJsonArray smth = itog.toArray();
      qDebug()<<"? что тут будет" << document;
     // Перебираем все элементы массива
       for(int i = 0; i < document.count(); i++){

        QJsonObject znach = document.at(i).toObject();
//       // Название Альбома на латинице
         QString userid = znach.value("title").toString();
         qDebug() << userid;

//       // Описание
         QString textp = znach.value("description").toString();
        qDebug() << textp;

//       // Забираем значения id
         int commentscount = znach.value("privacy").toInt();
         qDebug() << commentscount;

//       // Забираем ссылку на  фото
         QUrl photo = znach.value("cover_url").toString(); //
         qDebug() << photo;

      mail_model->addItem(MailObject (userid, textp, photo, commentscount ));
       qDebug()<<"yfi ger" << mail_model->Mailuserid;
        qDebug() << mail_model->Mailtextp;
       qDebug() << mail_model->MailPhoto;
       qDebug() << mail_model->Mailcommentscount;

   }
}


















































//void QHttpController::restRequest(){

//    QEventLoop loop;
//    nam = new QNetworkAccessManager();

//    QObject::connect(nam, // связываем loop  с нашим менеджером
//                     SIGNAL(finished(QNetworkReply*)),
//                     &loop,
//                     SLOT(quit()));

//       qDebug() << "Наш токен: " << m_accessToken;
//       qDebug() << "Наш хеш" << myHashMd5;
//    QNetworkReply *reply = nam->get(QNetworkRequest(QUrl( "https://api.ok.ru/fb.do?application_key=CDGGDNJGDIHBABABA&format=json&method=photos.getPhotos"
//                                                          "&sig="+ myHashMd5 +
//                                                          "&access_token="+ m_accessToken  )));

//     // qDebug() << "Наша nam" << nam;
//    loop.exec();
//   // QString photo(reply->readAll());

//   //  qDebug() << "Наша URL-ka" << reply;
//   //  qDebug() << "*** Список друзей в формате json ***" << photo;

////    // вся строка JSON с сервера грузится в QJsonDocument
//      QJsonDocument document = QJsonDocument::fromJson(reply->readAll());

//     // qDebug() <<"Наш document"<< document;
//      QJsonObject root = document.object();
//      qDebug() <<"Наш root"<< root;
//      QJsonValue itog = root.value("photos");
//     qDebug() <<"Photos"<< itog;
//      //  QJsonObject itog1 = itog.toObject();
//       //qDebug() << itog1;
//     // QJsonValue itog2 = itog1.value("items");
//       //qDebug() << itog2;
//      QJsonArray smth = itog.toArray();
//   //  qDebug()<<"хз что тут будет" << smth;
//     // Перебираем все элементы массива
//       for(int i = 0; i < smth.count(); i++){

//        QJsonObject znach = smth.at(i).toObject();
////       // Забираем значения свойств имени
//         QString userid = znach.value("user_id").toString();
//         qDebug() << userid;

////       // Забираем значения свойств фамилии
//         QString textp = znach.value("text").toString();
//        qDebug() << textp;

////       // Забираем значения id
//         int commentscount = znach.value("comments_count").toInt();
//         qDebug() << commentscount;

////       // Забираем ссылку на главное фото
//         QUrl photo = znach.value("pic50x50").toString();
//         qDebug() << photo;

//      mail_model->addItem(MailObject (userid, textp, photo, commentscount ));
//       qDebug()<<"yfi ger" << mail_model->Mailuserid;
//        qDebug() << mail_model->Mailtextp;
//       qDebug() << mail_model->MailPhoto;
//       qDebug() << mail_model->Mailcommentscount;

//   }
//}
