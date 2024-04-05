#ifndef MAP_VALUES_H
#define MAP_VALUES_H

#include <QObject>

#include "models/navigationmap_model.h"

class Map_Values : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float yaw_value MEMBER yaw_value WRITE setYaw NOTIFY floatChanged)

    Q_PROPERTY(float pitch_value MEMBER pitch_value WRITE setPitch NOTIFY floatChanged)

    Q_PROPERTY(QGeoCoordinate position MEMBER position WRITE setPosition NOTIFY positionChanged)

    Q_PROPERTY(NavigationMap_Model* navigationMap_Model MEMBER navigationMap_Model NOTIFY model_Changed)

    Q_PROPERTY(QVariantList path READ path NOTIFY pathChanged)

public:

    inline explicit Map_Values(QObject *parent = nullptr) : QObject(parent) {}


    Q_INVOKABLE void setYaw(float value) { yaw_value = value; emit floatChanged(value);}  //  emit floatChanged(value);

    Q_INVOKABLE void setPitch(float value) { pitch_value = value; emit floatChanged(value);}

    Q_INVOKABLE void setPosition(QGeoCoordinate value) { position = value;}

    Q_INVOKABLE void add_Coordinate(const QGeoCoordinate &coordinate){

        navigationMap_Model->addPosition(coordinate);
    }

    QVariantList path() const {

        return navigationMap_Model->path();
    }



    inline static float yaw_value = 0;

    inline static float pitch_value = 0;

private:


    inline static QGeoCoordinate position = {59.9386300, 30.3141300};

    inline static NavigationMap_Model *navigationMap_Model = new NavigationMap_Model;

signals:
    void pathChanged();

    void model_Changed(const NavigationMap_Model *value);

    void floatChanged(float);

    void positionChanged(QGeoCoordinate);

};

#endif // MAP_VALUES_H
