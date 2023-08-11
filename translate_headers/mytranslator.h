#ifndef MYTRANSLATOR_H
#define MYTRANSLATOR_H

#include <QObject>
#include <QGuiApplication>
#include <QQuickView>
#include <QTranslator>
#include "mylang.h"
#include <iostream>

class MyTranslator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    MyTranslator(QGuiApplication* app) { mApp = app; }

    QString getEmptyString() { return ""; }

signals:
    void languageChanged();

public slots:
    void updateLanguage(int lang){

        switch(lang){

        case MyLang::ENG:

            mTranslator.load("England", ":/translator");
            mApp->installTranslator(&mTranslator);

            std::cout << "perevod"<< std::endl; // Выводим Полученную Строку В Консоль

            break;

        default:
            mApp->removeTranslator(&mTranslator);
            break;
        }
        emit languageChanged();
    }

private:
    QGuiApplication* mApp;
    QTranslator mTranslator;
};

#endif // MYTRANSLATOR_H
