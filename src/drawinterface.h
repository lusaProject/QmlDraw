#ifndef ALBUMINTERFACE_H
#define ALBUMINTERFACE_H

#include <QObject>
#include <QVariant>
#include <QDBusVariant>

class DrawInterface : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("D-Bus Interface", "com.dte.draw")

public:
    DrawInterface(QObject *parent = nullptr);
    ~DrawInterface();

    void steQObject(QObject *o);
    QObject *getQObject();

signals:

public slots:
    Q_SCRIPTABLE void raise(const QDBusVariant &var);

private:
    QObject *window = nullptr;

};

#endif // ALBUMINTERFACE_H
