#ifndef NAVIGATIONMAP_MODEL_H
#define NAVIGATIONMAP_MODEL_H


#include <QAbstractListModel>
#include <QGeoCoordinate>
#include <QGeoPath>

class NavigationMap_Model : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QVariantList path READ path NOTIFY pathChanged)

    Q_PROPERTY(QGeoCoordinate position MEMBER position NOTIFY positionChanged)

public:

    explicit NavigationMap_Model(QObject *parent = nullptr);

    enum MarkerRoles {
       positionRole = Qt::UserRole + 1

       };

    QVariant data(const QModelIndex &index, int role) const;

    QHash<int, QByteArray> roleNames() const;

    int rowCount(const QModelIndex &parent = QModelIndex()) const;



    Q_INVOKABLE void addPosition(const QGeoCoordinate &coordinate);

    QVariantList path() const;

    QGeoCoordinate position = {59.9386300, 30.3141300};

    //Q_INVOKABLE QGeoCoordinate get_Position() const;

private:

    QVariantList m_coordinates;

signals:
   void pathChanged();
   void positionChanged();

};

#endif // NAVIGATIONMAP_MODEL_H
