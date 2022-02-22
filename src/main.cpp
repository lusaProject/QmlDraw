
#ifndef DUE_CAMERA_PRO
#include "config.h"
#else
#define VERSION "1.0.0.1"
#endif

#include "qtlabsplatform.h"
#include "drawinterface.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSurfaceFormat>
#include <QDebug>
#include <QScreen>
#include <QQuickView>
#include <QVariant>

#include <QDBusConnection>
#include <QDBusInterface>
#include <QDBusPendingCall>

#include <QVariant>
#include <QDBusVariant>

int main(int argc, char *argv[])
{
    qInfo() << "start dte music : " << VERSION;
    QSurfaceFormat format = QSurfaceFormat::defaultFormat();
    QSurfaceFormat::RenderableType module =  QSurfaceFormat::OpenGLES;
    format.setRenderableType(module);
    QSurfaceFormat::setDefaultFormat(format);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("something");

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("platform", new QtLabsPlatform());

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
    &app, [url](QObject * obj, const QUrl & objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    DrawInterface drawinterface;

    if (QDBusConnection::sessionBus().registerService("com.dte.draw")) {

        QDBusConnection::sessionBus().registerObject("/com/dte/draw", &drawinterface, QDBusConnection::ExportScriptableSignals |
                                                     QDBusConnection::ExportScriptableSlots);

        QObject *root = engine.rootObjects().first();
        drawinterface.steQObject(root);

    } else {

        qInfo() << "draw is running ... ";

        QDBusInterface iface("com.dte.draw", "/com/dte/draw", "com.dte.draw");

        QString appid = "raise";
        QVariant settingVariant;
        settingVariant.setValue(appid);

        QDBusVariant setting(settingVariant);

        if (iface.isValid()) {
            QList<QVariant> argumentList;
            argumentList << QVariant::fromValue(setting);
            iface.asyncCallWithArgumentList(QStringLiteral("raise"), argumentList);
        }

        app.quit();
        return 0;
    }

    return app.exec();
}
