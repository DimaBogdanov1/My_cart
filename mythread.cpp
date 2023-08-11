#include "mythread.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QStandardItem>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cctype>

MyThread::MyThread(QString s) : name(s)
{
}

// We overrides the QThread's run() method here
// run() will be called when a thread starts
// the code will be shared by all threads

using namespace std;

void MyThread::run()
{
    for(int i = 0; i <= 100; i++)
    {
        qDebug() << this->name << " " << i;
    }

}
