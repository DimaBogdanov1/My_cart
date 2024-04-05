#include "navigationmap_model.h"

NavigationMap_Model::NavigationMap_Model(QObject *parent) : QAbstractListModel(parent)
{

    //connect(this, &QAbstractListModel::dataChanged, this, &NavigationMap_Model::pathChanged);

}


QVariant NavigationMap_Model::data(const QModelIndex &index, int role) const {

    QVariant answer;

    switch (role) {

    case positionRole:

        answer = QVariant::fromValue(m_coordinates[index.row()]);

        break;
    }

    return answer;

}


QHash<int, QByteArray> NavigationMap_Model::roleNames() const {

    QHash<int, QByteArray> roles;

    roles[positionRole] = "position";

    return roles;
}

int NavigationMap_Model::rowCount(const QModelIndex &parent) const {

    Q_UNUSED(parent)
    return m_coordinates.count();
}

QVariantList NavigationMap_Model::path() const {

    return m_coordinates;
}


void NavigationMap_Model::addPosition(const QGeoCoordinate &coordinate) {

    beginInsertRows(QModelIndex(), rowCount(), rowCount());

    m_coordinates.append(QVariant::fromValue(coordinate));

    endInsertRows();
}
