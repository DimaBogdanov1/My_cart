#include <QRandomGenerator>

#include "test_class.h"


//#include "mqtt/chart_points/correct_points.h"

Test_Class::Test_Class(QObject *parent) : QObject(parent)
{

}


void Test_Class::print_pdf(){


    Export_Lib::createPDF();


   // QList<QPointF> passport_Line = {QPointF{10, 0}, QPointF{10, 600},  QPointF{20, 1050},  QPointF{80, 1070} };

   // QList<QPointF> passport_Line = {QPointF{1520, 0}, QPointF{1520, 600},  QPointF{1530, 1070} };

    //Measure_Lines *a = new Measure_Lines(Name_Measures::Level_Measure, passport_Line);




    //Export_Microservice::print_PDF() ;

   /* qDebug() << "Отправляем команду на печать PDF";

    QByteArray data = "отправляем сообщение!";

    m_client->publish(QMqttTopicName("backend/export/1"), data, 0, false); */

}

void Test_Class::addNew_Km(){


    add_New_Km(38, "Октябрьская", 1, 700);

    add_New_Km(58, "Северная", 18, 700);

   /* General_Info *general_Info = new General_Info(1.0,
                                                 "2022-10-03",
                                                 "436/р",
                                                 "МДК: МДК-498",
                                                 "Анциферов И.Н.",
                                                 "2022-12-12",
                                                 "Прямой",
                                                 "Базовая",
                                                 "Рабочая",
                                                 "2023-04-12",
                                                 1);

    Km_Info *km_Info = new Km_Info(1,
                                  "Октябрьская",
                                  "Новосокльники направление",
                                  112233,
                                  1,
                                  "Главный",

                                  num_km,
                                  1070, //1730,

                                  0,
                                    {"Ромашково", "Васильково"},
                               //   0,
                                 // 0,0,0,0,0,"Пред: -КрдПЧ",
                                  "2024-01-07 12:30:30",
                                  "2024-01-07 00:00:00");

    Pch_Info *pch_Info = new Pch_Info(22, 43, 11, 2);

    QList<Sleepers> sleepers_List = {Sleepers(Type_Sleepers::Wood, 0, 300),
                                    Sleepers(Type_Sleepers::Reinforced_Concrete, 300, 500)
                                    };


    QList<Bridge> bridge_List = {
                                //  Bridge(300, 350),
                                 // Bridge(50, 100)
                                };

    QList<Arrow> arrow_List = { Arrow(Type_Arrows::Bottom_left, 120, 20, false, false, "12"),
                                Arrow(Type_Arrows::Bottom_right, 360, 50, false, true, "4"),

                                //Arrow(Type_Arrows::Double, 300, true, false),
                                //Arrow(Type_Arrows::Double, 500, true, true dd),

                               // Arrow(Type_Arrows::Double, 500, false, true),
                               // Arrow(Type_Arrows::Double, 550, true, true),

                              //  Arrow(Type_Arrows::Double, 500, true, false),
                                Arrow(Type_Arrows::Top_right, 600, 50, false, true, "33"),
                                Arrow(Type_Arrows::Top_left, 700, 0, false, true, "13"),

                                Arrow(Type_Arrows::Double, 900, 50, true, true, "88"),

                              };

    QList<Chart_Object> chart_Object_List = { //Chart_Object(Type_Object::Isolated_Junction, 100),
                                             // Chart_Object(Type_Object::Km_Pillar, 200),

                                              Chart_Object(Type_Object::Km_Pillar, 250),

                                               Chart_Object(Type_Object::Km_Mark, 400),

                                             // Chart_Object(Type_Object::End_Of_The_Road, 930),
                                             // Chart_Object(Type_Object::Path_Boundary, 300)
                                               //Chart_Object(Type_Object::Km_Mark, 280)



                                            };


    QList<Km_Help_Line>  help_Line_List = {Km_Help_Line(0, 400),
                                              Km_Help_Line(600, 800),

                                             // Km_Help_Line(1000, 1730)

                                             };

    QList<Km_Help_Line>  earth_Line_List = {Km_Help_Line(0, 200),
                                               Km_Help_Line(300, 1070),
                                             //  Km_Help_Line(1400, 1730),

                                              };

    QList<Km_Help_Line>  сompensation_Line_List = {Km_Help_Line(800, 812)

                                              };

    QList<Km_Help_Line>  railRoad_List = {Km_Help_Line(500, 510),
                                             Km_Help_Line(1045, 1055)

                                              };


    QList<Km_Help_Line> speed_PassTrain = {Km_Help_Line(0, 300, 80),
                                              Km_Help_Line(300, 500, 120)

                                             };

    QList<Km_Help_Line> speed_FreightTrain = {Km_Help_Line(0, 300, 40),
                                              Km_Help_Line(300, 500, 60)

                                             };

    Speed_Info *speed_Info = new Speed_Info(speed_PassTrain, speed_FreightTrain, {},{},{},{},{});

    Mark_Info *mark_Info = new Mark_Info(20, 2, 5, 15, 14, 7, "Пред: -КрдПЧ");





    QList<QPointF> passport_Level_Line = {QPointF{10, 0}, QPointF{10, 600}, QPointF{80, 1070} };

    QList<QPointF> passport_riht_Line = {QPointF{5, 0}, QPointF{3, 600}, QPointF{7, 1070} };

    QList<QPointF> passport_widthTrack_Line = {QPointF{1520, 0}, QPointF{1530, 600}, QPointF{1520, 1070} };



    QList<Measure_Lines> measure_Lines_List = {

        Measure_Lines(Name_Measures::Level_Measure, passport_Level_Line),
        Measure_Lines(Name_Measures::Riht_Left_Measure, passport_riht_Line),
        Measure_Lines(Name_Measures::Riht_Right_Measure, passport_riht_Line),
        Measure_Lines(Name_Measures::Riht_Left_Measure, passport_widthTrack_Line),

    };

  //  measure_Lines_List.append(Measure_Lines(Name_Measures::Level_Measure, passport_Line));

    Export_DB export_DB(Export_Lib::db_path);

    export_DB.addNew_My_Pdf_Info(My_Pdf_Info(
                                     //  general_Info,
                                       km_Info,
                                       pch_Info,
                                       speed_Info,
                                       sleepers_List,
                                       bridge_List,
                                       arrow_List,
                                       chart_Object_List,
                                       help_Line_List,
                                       earth_Line_List,
                                       сompensation_Line_List,
                                       railRoad_List,
                                       measure_Lines_List
                                       )
                                 );


    QList<Km_Help_Line> level_areas = {Km_Help_Line(100, 200, Type_Areas::Extent_2_Area),
                                       Km_Help_Line(300, 400, Type_Areas::Extent_3_Area),
                                       Km_Help_Line(500, 800, Type_Areas::Extent_4_Area),
                                      };

    QList<Km_Help_Line> riht_areas = {Km_Help_Line(100, 400, Type_Areas::Extent_3_Area)
                                      };

    export_DB.addNew_Areas(Name_Measures::Level_Measure, level_areas, num_km_id);

    export_DB.addNew_Areas(Name_Measures::Riht_Right_Measure, riht_areas, num_km_id);

    */
}

void Test_Class::addGeneral_Info(){

    Export_DB export_DB(Export_Lib::db_path);

    General_Info *general_Info = new General_Info(1.0,
                                                 "2022-10-03",
                                                 "436/р",
                                                 "МДК: МДК-498",
                                                 "Анциферов И.Н.",
                                                 "2022-12-12",
                                                 "Прямой",
                                                 "Базовая",
                                                 "Рабочая",
                                                 "2023-04-12",
                                                 1);

    export_DB.addNew_GeneralInfo(general_Info);

    for(int i = 0; i < QMetaEnum::fromType<Name_Measures::Measures>().keyCount(); i++){

        export_DB.addNew_Params(add_New_CheckMeasure(i));
    }


    Mark_Info *mark_Info = new Mark_Info(20, 2, 5, 15, 14, 7, "Пред: -КрдПЧ");

    export_DB.addNew_Mark_Info(mark_Info, num_km_id);
}

void Test_Class::test_slot_NewKm(){

    Export_Lib a;

    a.addNew_Km();

}



Params Test_Class::add_New_CheckMeasure(int index){

    QPair<float, float> borders = Correct_Points::get_Borders(index);

    qDebug() << "index = " + QString::number(borders.first);

    int offset = Correct_Points::get_Offset(index);

    int multi = Correct_Points::get_Multi(index);

    return Params(index, offset, multi, borders.first, borders.second, Correct_Points::get_null_Line_X(index));

}

void Test_Class::add_New_Km(int num_Km, QString name_SiteId, int site_Id, int distance){

    Km_Info *km_Info = new Km_Info(site_Id, //1,
                                  name_SiteId, //"Октябрьская",
                                  "Новосокльники направление",
                                  112233,
                                  1,
                                  "Главный",

                                  num_Km,
                                  distance, //1070, //1730,

                                  0,
                                    {"Ромашково", "Васильково"},
                               //   0,
                                 // 0,0,0,0,0,"Пред: -КрдПЧ",
                                  "2024-01-07 12:30:30",
                                  "2024-01-07 00:00:00");

    Pch_Info *pch_Info = new Pch_Info(22, 43, 11, 2);

    QList<Sleepers> sleepers_List = {Sleepers(Type_Sleepers::Wood, 0, 300),
                                    Sleepers(Type_Sleepers::Reinforced_Concrete, 300, 500)
                                    };


    QList<Bridge> bridge_List = {
                                //  Bridge(300, 350),
                                 // Bridge(50, 100)
                                };

    QList<Arrow> arrow_List = { Arrow(Type_Arrows::Bottom_left, 120, 20, false, false, "12"),
                                Arrow(Type_Arrows::Bottom_right, 360, 50, false, true, "4"),

                                /*Arrow(Type_Arrows::Double, 300, true, false),
                                Arrow(Type_Arrows::Double, 500, true, true dd), */

                               // Arrow(Type_Arrows::Double, 500, false, true),
                               // Arrow(Type_Arrows::Double, 550, true, true),

                              //  Arrow(Type_Arrows::Double, 500, true, false),
                                Arrow(Type_Arrows::Top_right, 600, 50, false, true, "33"),
                                Arrow(Type_Arrows::Top_left, 700, 0, false, true, "13"),

                                Arrow(Type_Arrows::Double, 900, 50, true, true, "88"),

                              };

    QList<Chart_Object> chart_Object_List = { Chart_Object(Type_Object::Isolated_Junction, 100),
                                             // Chart_Object(Type_Object::Km_Pillar, 200),

                                              Chart_Object(Type_Object::Km_Pillar, 250),

                                              Chart_Object(Type_Object::End_Of_The_Road, 930),
                                              Chart_Object(Type_Object::Path_Boundary, 300)
                                               //Chart_Object(Type_Object::Km_Mark, 280)



                                            };


    QList<Km_Help_Line>  help_Line_List = {Km_Help_Line(0, 400),
                                              Km_Help_Line(600, 800),

                                             // Km_Help_Line(1000, 1730)

                                             };

    QList<Km_Help_Line>  earth_Line_List = {Km_Help_Line(0, 200),
                                               Km_Help_Line(300, 1070),
                                             //  Km_Help_Line(1400, 1730),

                                              };

    QList<Km_Help_Line>  сompensation_Line_List = {Km_Help_Line(800, 812)

                                              };

    QList<Km_Help_Line>  railRoad_List = {Km_Help_Line(500, 510),
                                             Km_Help_Line(1045, 1055)

                                              };


    QList<Km_Help_Line> speed_PassTrain = {Km_Help_Line(0, 300, 80),
                                              Km_Help_Line(300, 500, 120)

                                             };

    QList<Km_Help_Line> speed_FreightTrain = {Km_Help_Line(0, 300, 40),
                                              Km_Help_Line(300, 500, 60)

                                             };

    Speed_Info *speed_Info = new Speed_Info(speed_PassTrain, speed_FreightTrain, {},{},{},{},{});

    Mark_Info *mark_Info = new Mark_Info(20, 2, 5, 15, 14, 7, "Пред: -КрдПЧ");





    QList<QPointF> passport_Level_Line = {QPointF{10, 0}, QPointF{10, 600}, QPointF{80, 1070} };

    QList<QPointF> passport_riht_Line = {QPointF{5, 0}, QPointF{3, 600}, QPointF{7, 1070} };

    QList<QPointF> passport_widthTrack_Line = {QPointF{1520, 0}, QPointF{1530, 600}, QPointF{1520, 1070} };


    //Measure_Lines *level_Measure_Lines = new Measure_Lines(Name_Measures::Level_Measure, passport_Line);

    QList<Measure_Lines> measure_Lines_List = {

        Measure_Lines(Name_Measures::Level_Measure, passport_Level_Line),
        Measure_Lines(Name_Measures::Riht_Left_Measure, passport_riht_Line),
        Measure_Lines(Name_Measures::Riht_Right_Measure, passport_riht_Line),
        Measure_Lines(Name_Measures::Riht_Left_Measure, passport_widthTrack_Line),

    };

    //  measure_Lines_List.append(Measure_Lines(Name_Measures::Level_Measure, passport_Line));

    Export_DB export_DB(Export_Lib::db_path);

    export_DB.addNew_My_Pdf_Info(My_Pdf_Info(
                                     //  general_Info,
                                       km_Info,
                                       pch_Info,
                                       speed_Info,
                                       sleepers_List,
                                       bridge_List,
                                       arrow_List,
                                       chart_Object_List,
                                       help_Line_List,
                                       earth_Line_List,
                                       сompensation_Line_List,
                                       railRoad_List,
                                       measure_Lines_List
                                       )
                                 );


    QList<Km_Help_Line> level_areas = {Km_Help_Line(100, 200, Type_Areas::Extent_2_Area),
                                       Km_Help_Line(300, 400, Type_Areas::Extent_3_Area),
                                       Km_Help_Line(500, 800, Type_Areas::Extent_4_Area),
                                      };

    QList<Km_Help_Line> riht_areas = {Km_Help_Line(100, 400, Type_Areas::Extent_3_Area)
                                      };

    export_DB.addNew_Areas(Name_Measures::Level_Measure, level_areas, num_km_id);

    export_DB.addNew_Areas(Name_Measures::Riht_Right_Measure, riht_areas, num_km_id);
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

          export_DB.insertPoint(Name_Measures::Level_Measure, paramValue , i);

      }

     // export_DB.insertPoint(Name_Measures::Level_Measure, paramValue , i);


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



