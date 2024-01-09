#ifndef EXPORT_MICROSERVICE_H
#define EXPORT_MICROSERVICE_H

#include <QString>

class Export_Microservice
{
public:
    Export_Microservice();

    static void print_PDF();

private:

    inline static QString export_topic = "backend/export/1";

};

#endif // EXPORT_MICROSERVICE_H
