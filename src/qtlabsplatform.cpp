/*
* Copyright (C) 2020 ~ 2021 Uniontech Software Technology Co.,Ltd.
*
* Author:     tangpeng <tangpeng@uniontech.com>
*
* Maintainer: tangpeng <tangpeng@uniontech.com>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "qtlabsplatform.h"

#include <QFile>
#include <QStandardPaths>

QtLabsPlatform::QtLabsPlatform(QObject *parent) : QObject(parent)
{

}

QtLabsPlatform::~QtLabsPlatform()
{

}

QString QtLabsPlatform::musicLocation()
{
    return  QStandardPaths::writableLocation(QStandardPaths::MusicLocation);
}

void QtLabsPlatform::remove(QStringList paths)
{
    foreach (QString path, paths) {
        QString fileInfo = path.remove(QString("file://"), Qt::CaseInsensitive);
        QFile::remove(fileInfo);
    }
}
