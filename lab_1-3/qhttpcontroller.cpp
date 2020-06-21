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
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlTableModel>




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
      int more = 0;
      int less = 0;
      int between = 0;
      for(int i = 0; i < document.count(); i++){

        QJsonObject znach = document.at(i).toObject();
//       // Название Альбома на латинице
         QString userid = znach.value("title").toString();
         qDebug() << userid;

//       // Описание
         QString textp = znach.value("description").toString();
        qDebug() << textp;

//       // Забираем значения id
         int commentscount = znach.value("size").toInt();
         qDebug() << commentscount;

//       // Забираем ссылку на  фото
         QUrl photo = znach.value("cover_url").toString(); //
         qDebug() << photo;
      if(commentscount != 0 ) more++;

      mail_model->addItem(MailObject (userid, textp, photo, commentscount ));
       qDebug()<<"yfi ger" << mail_model->Mailuserid;
       qDebug() << mail_model->Mailtextp;
       qDebug() << mail_model->MailPhoto;
       qDebug() << mail_model->Mailcommentscount;

   }
       emit toQML9(more);
       qDebug() << more<<"MORERE";
}

bool QHttpController::db_read(){ // функция для чтения получившейся БД


    if (mail_model->rowCount() > 0) {
        mail_model->clear();
    }

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("friends1234");
    db.setDatabaseName("C:/Qt/rut.db"); // название таблицы

    db.open();                            // используется для отображения в QML


    QSqlQuery query;

    if (query.exec("SELECT * FROM rut") == true ){
        query.exec("SELECT * FROM rut");
        while (query.next()) {
            int commentscount = query.value(0).toInt();
            QString userid = query.value(1).toString();
            QString textp = query.value(2).toString();
            QUrl photo = query.value(3).toUrl();

            qDebug() << commentscount << userid << textp  << photo;

            mail_model->addItem(MailObject(userid,textp,photo, commentscount));

          }
            db.close();

            qDebug() << "все норм";
            return 1;
    }
    else {
        QString errore = "В бд нет данных, нажми  обновить";
        qDebug() << errore;

        return 0;
    }

        return 0;

}

void QHttpController::db_write() {
    QEventLoop loop;
    nam = new QNetworkAccessManager();

    QObject::connect(nam, // связываем loop  с нашим менеджером
                     SIGNAL(finished(QNetworkReply*)),
                     &loop,
                     SLOT(quit()));

      qDebug() << "Наш токен REST: " << m_accessToken;//users.getInfo
       qDebug() << "Наш хеш REST" << myHashMd5;
    QNetworkReply *reply = nam->get(QNetworkRequest(QUrl( "http://www.appsmail.ru/platform/api?method=photos.getAlbums&app_id=772344&session_key="+m_accessToken+"&sig="+myHashMd5 )));



     // qDebug() << "Наша nam" << nam;
    loop.exec();
   // QString photo(reply->readAll());

   //  qDebug() << "Наша URL-ka" << reply;
   //  qDebug() << "*** Список друзей в формате json ***" << photo;

//    // вся строка JSON с сервера грузится в QJsonDocument
      QJsonArray document = QJsonDocument::fromJson(reply->readAll()).array();

      QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
           db.setHostName("friends1234");
           db.setDatabaseName("C:/Qt/rut.db"); // название таблицы

           db.open();

           QSqlQuery query;
           query.exec("DROP TABLE rut");
           query.exec("CREATE TABLE rut(" // создаем таблицу friends
                           "Mail_Size int,"
                           "MailTitle varchar(255),"
                           "MailComment varchar(255),"
                           "MailPhoto varchar(255))");

           if (mail_model->rowCount() > 0) {
               mail_model->clear();
           }

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

             query.prepare("INSERT INTO rut(Mail_Size, MailTitle, MailComment, MailPhoto)"
                                  "VALUES (:Mail_Size, :MailTitle, :MailComment, :MailPhoto)");

                    query.bindValue(":Mail_Size", commentscount);
                    query.bindValue(":MailTitle", userid);
                    query.bindValue(":MailComment", textp);
                    query.bindValue(":MailPhoto", photo);
                    query.exec();

                 }
                  QSqlDatabase::removeDatabase("QSQLITE");
                  db.close();

       }










