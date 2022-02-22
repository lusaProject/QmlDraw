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

#ifndef QTLABSPLATFORM_H
#define QTLABSPLATFORM_H

#include <QObject>
#include <QJsonObject>
#include <QDebug>

class QtLabsPlatform : public QObject
{
    Q_OBJECT
public:
    explicit QtLabsPlatform(QObject *parent = nullptr);
    ~QtLabsPlatform();

    Q_INVOKABLE QString musicLocation();
    Q_INVOKABLE void remove(QStringList paths);
};

#endif // QTLABSPLATFORM_H
