#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QStandardItem>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cctype>
#include <QtTest/QtTest>

#include <mythread.h>

#include "work_with_chart.h"


Work_with_chart::Work_with_chart(QObject *parent) : QObject(parent)
{

}

using namespace std;

int Work_with_chart::max(int a, int b)
{
    if(a > b)
        return a;
    return b;
}

float delete_space(string sk){

    string buffer;

    char chars[sk.length() + 1];

    sk.copy(chars, sk.length() + 1);

    for(int i=0; i < (sizeof(chars)/sizeof(*chars)); i++){

        if(i != 1 && i != 2){

            buffer += chars[i];
        }

    }

    cout << buffer << endl;

    return stoi( buffer );
}


void Work_with_chart::openCSV()
{

    //MyThread tread("A");

    //thread1.start();



    ifstream work_file("/Users/dimabogdanov/Documents/MyCart_res/railway.csv");

    string line;

    char delimiter = ';';

    //Читаем первую строку, чтобы отбросить ее, так как она является заголовком
    getline(work_file, line);

    //emit newPoint_Chart_signal(10 , count); // Отправляем Сигнал

   int count = 0;

   std::string a = "agaga";

     a.erase(std::remove(a.begin(), a.end(), 'a'), a.end());

     std::cout << a << '\n';

    // Прочитали все строчки
    while (getline(work_file, line))
    {
        if(count > 100){

            break;
        }
        stringstream stream(line); // Преобразование строки в поток

        string num_frame, sk;

        for(int i = 0; i < 10; i++){

            // Извлечение всех значений в этой строке
            getline(stream, num_frame, delimiter);
        }

        getline(stream, sk, delimiter);

       // cout << "==================" << endl;

       // sk_standart.erase(remove_if(sk_standart.begin(),sk_standart.end(),::isspace),sk_standart.end());

        sk.erase(remove(sk.begin(),sk.end(), '  '),sk.end());

      //  cout << sk << '\n';


        // 1520 - это эталон , на графике это 10

        emit newPoint_Chart_signal(delete_space(sk) - 1510 , tmp_y); // Отправляем Сигнал


        count++;
        tmp_y++;
    }
    work_file.close();



    // Тут нужно будет показывать процесс загрузки и блочить ui

}
