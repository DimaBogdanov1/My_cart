#ifndef HISTORY_CHART_PAGE_H
#define HISTORY_CHART_PAGE_H

#include <QObject>
#include <QDebug>

#include <QDir>
#include <QFileInfo>

#include "../Export_Lib/chart/chart_block.h"
#include "../Export_Lib/models/file_model.h"
#include "../Export_Lib/file/export_db.h"

#include "../Design_Values_Lib/top_bars_and_menu/models/chart_top_bars_models.h"

class History_Chart_Page : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Chart_Block* chart_Block MEMBER chart_Block NOTIFY chart_Block_Changed)

    Q_PROPERTY(Chart_Top_Bars_Models* top_Bars_Models MEMBER top_Bars_Models NOTIFY top_Bars_Models_Changed)


public:

    inline explicit History_Chart_Page(QObject *parent = nullptr) : QObject(parent) {

        connect(chart_Block->get_Chart_Speed_Values(), &Chart_Speed_Values::new_SpeedLine_Signal, this, &History_Chart_Page::slot_Add_New_Speed);

        connect(chart_Block, &Chart_Block::new_Area_Signal, this, &History_Chart_Page::slot_Add_New_Area);

        connect(chart_Block->get_Chart_Km_Values(), &Chart_Km_Values::riht_Values_Changed, this, &History_Chart_Page::add_One_Riht_In_UI);

        connect(chart_Block, &Chart_Block::add_New_Km_Signal, this, &History_Chart_Page::slot_add_New_Km);

    }

    Q_INVOKABLE void open_file() {

        Export_DB export_DB(Export_Lib::db_path);

        //QList<My_Pdf_Info*> list = {export_DB.get_My_Pdf_Info()};

        chart_Block->add_New_Km_List(export_DB.get_My_Pdf_Info_List());

        //emit chart_Km_Values_Changed(chart_Block->get_Chart_Km_Values());

    }


    Q_INVOKABLE void search_file() {


        QDir dir("/Users/dimabogdanov/Documents/MyCart_res/routes/");

        for (const QFileInfo &file : dir.entryInfoList(QDir::Files)) {

            qDebug() << "File name " + file.baseName();

            qDebug() << "File completeSuffix " + file.completeSuffix();

        }
    }

private:

    inline static Chart_Block *chart_Block = new Chart_Block;

    inline static Chart_Top_Bars_Models *top_Bars_Models = new Chart_Top_Bars_Models;

    inline static File_Model *file_Model = new File_Model;

    void slot_Add_New_Speed(int index){emit new_SpeedLine_Signal(index);}

    void slot_Add_New_Area(int index){emit new_Area_Signal(index);}

    void add_One_Riht_In_UI(){ emit new_Riht_Signal(); }

    void slot_add_New_Km(){ emit chart_Km_Values_Changed(chart_Block->get_Chart_Km_Values());}

signals:

   void chart_Km_Values_Changed(const Chart_Km_Values *value);

   void chart_Block_Changed(const Chart_Block *value);

   void top_Bars_Models_Changed(const Chart_Top_Bars_Models *value);

   void new_Line_Signal(const int index, const int index_list, const int subType);

   void new_SpeedLine_Signal(const int type);

   void model_Changed(const File_Model *value);

   void new_Area_Signal(const int index);

   void new_Riht_Signal();

};

#endif // HISTORY_CHART_PAGE_H
