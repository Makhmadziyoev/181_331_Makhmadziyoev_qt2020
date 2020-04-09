#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QIcon>
#include "qhttpcontroller.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QHttpController qhttpcontroller;
    qhttpcontroller.getSiteValue();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("qhttpcontroller", &qhttpcontroller); // поместить с++ объект в область видимости движка qml


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject * mw = engine.rootObjects().first();
       QObject::connect (mw, SIGNAL(makeRequest()),
                         &qhttpcontroller, SLOT(getSiteValue()));

    return app.exec();
}
