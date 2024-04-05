#ifndef NAVIGATIONMAP_MODEL_H
#define NAVIGATIONMAP_MODEL_H


#include <QAbstractListModel>
#include <QGeoCoordinate>
#include <QGeoPath>

class NavigationMap_Model : public QAbstractListModel
{
    Q_OBJECT

public:

    explicit NavigationMap_Model(QObject *parent = nullptr);

    enum MarkerRoles {
       positionRole = Qt::UserRole + 1

       };

    QVariant data(const QModelIndex &index, int role) const;

    QHash<int, QByteArray> roleNames() const;

    int rowCount(const QModelIndex &parent = QModelIndex()) const;



    void addPosition(const QGeoCoordinate &coordinate);

    QVariantList path() const;

private:

    QVariantList m_coordinates;

};

#endif // NAVIGATIONMAP_MODEL_H
