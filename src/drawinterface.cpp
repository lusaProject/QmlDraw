#include "drawinterface.h"

#include <QDebug>
#include <QVariant>
#include <QDBusVariant>

DrawInterface::DrawInterface(QObject *parent): QObject(parent)
{

}

DrawInterface::~DrawInterface()
{

}

void DrawInterface::steQObject(QObject *o)
{
    window = o;
}

QObject *DrawInterface::getQObject()
{
    return window;
}

void DrawInterface::raise(const QDBusVariant &var)
{
    QVariant result = var.variant();
    QMetaObject::invokeMethod(window, "activateWindow");

//    objectName: "objNameL4"
//    QObject *textLabel = window->findChild<QObject *>("objNameL4");
//    if (textLabel) {
//        QMetaObject::invokeMethod(window, "setL4text");
//    }
}
