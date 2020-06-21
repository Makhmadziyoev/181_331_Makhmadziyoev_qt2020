#include <QtWidgets/QApplication>
#include <QQmlApplicationEngine>
//#include <QIcon>
#include "qhttpcontroller.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "mailmodel.h"
#include "cryptocontroller.h"
#include <QtCharts/QChartView>
#include <QtCharts/QBarSet>
#include <QtCharts/QLegend>
QT_CHARTS_USE_NAMESPACE

int main(int argc, char *argv[])
{
    CryptoController test;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QHttpController qhttpcontroller;
    qhttpcontroller.getSiteValue();

    QQmlApplicationEngine engine;

    test.setPath(app.applicationDirPath());

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("qhttpcontroller", &qhttpcontroller); // поместить с++ объект в область видимости движка qml


    context->setContextProperty("mail_model", qhttpcontroller.mail_model); //Перемещаемая модель, которой присваиваем имя
    context->setContextProperty("qhttpcontroller", &qhttpcontroller);
    context->setContextProperty("test", &test);
    qhttpcontroller.db_read();
    //преобразование пути стартовой страницы из char в Qurl

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject::connect(engine.rootObjects().first(), SIGNAL(restRequest()),
    &qhttpcontroller, SLOT(restRequest()));

    QObject::connect(engine.rootObjects().first(), SIGNAL(hashMD5(QString)),
    &qhttpcontroller, SLOT(hashMD5(QString)));

    QObject::connect(engine.rootObjects().first(), SIGNAL(success(QString)),
        &qhttpcontroller, SLOT(success(QString)));

    QObject::connect(engine.rootObjects().first(), SIGNAL(db_read()),
        &qhttpcontroller, SLOT(db_read()));

        QObject::connect(engine.rootObjects().first(), SIGNAL(db_write()),
        &qhttpcontroller, SLOT(db_write()));

    QObject * mw = engine.rootObjects().first();
    QObject::connect (mw, SIGNAL(makeRequest()),
                      &qhttpcontroller, SLOT(getSiteValue()));




    return app.exec();
}




