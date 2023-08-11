#include <QPrinter>
#include <QTextDocument>
#include <QTextCharFormat>

#include <QApplication>
#include <QtCore>
#include <QPrinter>
#include <QPdfWriter>
#include <QPainter>

#include "my_pdf.h"

My_pdf::My_pdf(QObject *parent) : QObject(parent)
{

}

void My_pdf::print_pdf()
{

   // QPrinter printer;
    //printer.setOutputFileName("/Users/Shared/example.pdf");
    //printer.setOutputFormat(QPrinter::PdfFormat);

    QString html =
    "<div align=right>"
       "City, 11/11/2015"
    "</div>"
    "<div align=left>"
       "Sender Name<br>"
       "street 34/56A<br>"
       "121-43 city"
    "</div>"
    "<h1 align=center>DOCUMENT TITLE</h1>"
    "<p align=justify>"
       "document content document content document content document content document content document content document content document content document content document content "
       "document content document content document content document content document content document content document content document content document content document content "
    "</p>"
    "<div align=right>sincerly</div>";

    QTextDocument document;
    document.setHtml(html);

    QPrinter printer(QPrinter::PrinterResolution);
    printer.setOutputFormat(QPrinter::PdfFormat);
    printer.setPaperSize(QPrinter::A4);
    printer.setOutputFileName("/Users/Shared/example.pdf");
    printer.setPageMargins(QMarginsF(15, 15, 15, 15));

    document.print(&printer);

}
