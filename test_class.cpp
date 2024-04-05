#include <QRandomGenerator>

#include "test_class.h"

#include "../Export_Lib/export_lib.h"
//#include "mqtt/chart_points/correct_points.h"

Test_Class::Test_Class(QObject *parent) : QObject(parent)
{

}


void Test_Class::print_pdf(){

    Export_Lib::createPDF();


    //Export_Microservice::print_PDF() ;

   /* qDebug() << "Отправляем команду на печать PDF";

    QByteArray data = "отправляем сообщение!";

    m_client->publish(QMqttTopicName("backend/export/1"), data, 0, false); */

}

void Test_Class::test_slot_NewKm(){

    Export_Lib a;

    Export_Lib::addNew_Km(Km_Info(0,
                                  "Октябрьская",
                                  "Новосокльники направление",
                                  112233,
                                  1,
                                  22,
                                  43,
                                  22,
                                  11,
                                  70,
                                  80,
                                  20,
                                  1730,
                                  0,
                                  0,0,0,0,0,"Пред: -КрдПЧ",
                                  "2024-01-07 12:30:30",
                                  "2024-01-07 00:00:00"));


   // Export_Microservice::add_NewKm();

}

void Test_Class::test_slot_NewParams() {


    for(int i = 0; i < QMetaEnum::fromType<Name_Measures::Measures>().keyCount(); i++){

        add_New_CheckMeasure(i);
    }
}

void Test_Class::add_New_CheckMeasure(int index){

    QPair<float, float> borders = Correct_Points::get_Borders(index);

    qDebug() << "index = " + QString::number(borders.first);

    int offset = Correct_Points::get_Offset(index);

    int multi = Correct_Points::get_Multi(index);

    Export_Lib::addNew_Params(Params(index, offset, multi, borders.first, borders.second));

}

void Test_Class::test_slot_NewGeneralInfo(){

    Export_Lib a;

    Export_Lib::addNew_GeneralInfo(General_Info(1.0,
                                                "2022-10-03",
                                                "436/р",
                                                "МДК: МДК-498",
                                                "Анциферов И.Н.",
                                                "2022-12-12",
                                                "Прямой",
                                                "Базовая",
                                                "Рабочая",
                                                "2023-04-12",
                                                1));

   // Export_Microservice::add_NewGeneralInfo();

}

void Test_Class::test_slot_CloseExportMicroservice(){

    Export_DB export_DB(Export_Lib::db_path);

    QRandomGenerator *rg = QRandomGenerator::global();

    for(int i = 0; i < 1730; i++){

        int paramValue = rg->bounded(-5, 5);


        int rihtValue = 0;

        if(50 < i && i < 100){

            rihtValue = -5;
        }


        if(1100 < i && i < 1500){

            rihtValue = -5;
        }


      if(150 < i && i < 1200){

         paramValue = 0;
      }

      if(600 < i && i < 1200){

         paramValue = 510; //-100; //510;

      }

      if(100 < i && i < 800){

          rihtValue = 400;
      }


      if(i <= 400 || 600 <= i){

        //  export_DB.insertPoint(Name_Measures::Level_Measure, paramValue , i);

      }

      export_DB.insertPoint(Name_Measures::Level_Measure, paramValue , i);


      if(i < 1500){

          export_DB.insertPoint(Name_Measures::Riht_Right_Measure, rihtValue , i);

          export_DB.insertPoint(Name_Measures::Riht_Left_Measure, rihtValue , i);

      }


    }

   /* for(int i = 200; i < 1730; i++){

        export_DB.insertPoint(Name_Measures::Riht_Right_Measure, 4 , i);

        export_DB.insertPoint(Name_Measures::Level_Measure, 0 , i);

    }*/


   // Export_Lib::addPoints_To_File(index, pair.second, Sensors_Values::odometer_value);

   // Export_Microservice::close_Microservice();

}

void Test_Class::test_slot_add_sleepers(){


    Export_Lib::addNew_Sleepers(Sleepers(Type_Sleepers::Wood, 0, 400, 38));
}

void Test_Class::test_slot_add_bridge(){

    Export_Lib::addNew_Bridge(Bridge(100, 150, 38));


}

void Test_Class::test_slot_add_arrow(){

    Export_Lib::addNew_Arrow(Arrow(Type_Arrows::Bottom_left,38, 120, true, false, 12));

}

void Test_Class::test_slot_add_object(){

    Export_Lib::addNew_Object(Chart_Object(Type_Object::Isolated_Junction, 38, 140));

}

void Test_Class::test_slot_helpLine() {

    Export_Lib::addNew_Line(Km_Help_Line(Type_Km_Help_Lines::Help_Line, 0, 400, 38));

    Export_Lib::addNew_Line(Km_Help_Line(Type_Km_Help_Lines::Earth_Line, 200, 800, 38));

    Export_Lib::addNew_Line(Km_Help_Line(Type_Km_Help_Lines::Compensation_Line, 400, 412, 38));

}
