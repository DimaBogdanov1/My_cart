/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>

#include <measures/chart_work.h>
#include "qmlmqttclient.h"


QmlMqttClient::QmlMqttClient(QObject *parent): QMqttClient(parent) {

}

QmlMqttSubscription* QmlMqttClient::subscribe(const QString &topic)
{
    auto sub = QMqttClient::subscribe(topic, 0);

    auto result = new QmlMqttSubscription(sub, this);
    return result;
}

QmlMqttSubscription::QmlMqttSubscription(QMqttSubscription *s, QmlMqttClient *c) : sub(s), client(c) {

    connect(sub, &QMqttSubscription::messageReceived, this, &QmlMqttSubscription::handleMessage);

    m_topic = sub->topic();

}

QmlMqttSubscription::~QmlMqttSubscription(){

}


void QmlMqttSubscription::handleMessage(const QMqttMessage &qmsg)
{


    QString message = qmsg.payload();

   // qDebug().nospace() << "\n" <<"Пришло JSON сообщение ";


    //QJsonDocument doc(message);

    QJsonDocument doc = QJsonDocument::fromJson(message.toUtf8());

    QString formatted = doc.toJson(QJsonDocument::Indented);

  //  qWarning().noquote() << formatted;



   // QJsonDocument jsonResponse = QJsonDocument::fromJson(message.toUtf8());

    QJsonObject jsonObject = doc.object();

    QJsonObject bookHeavyInfo = jsonObject[title_JSON].toObject();

    for(int i = 0; i < 6; i++){

        float value_x = round( (bookHeavyInfo[titles_List.at(i)].toString()).toFloat()  * 10) / 10.0;

        emit messageReceived(i, value_x, 0);

    }


   /* QJsonObject bookHeavyInfo = jsonObject[title_JSON].toObject();

   // QString level =  bookHeavyInfo[level_Title].toString();

    float level = round( (bookHeavyInfo[level_Title].toString()).toFloat()  * 10) / 10.0;

    qDebug() << "level = " + QString::number(level);

    emit messageReceived(0, level, 0);

    */


}
