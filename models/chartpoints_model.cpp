#include <QDebug>

#include "chartpoints_model.h"

ChartPoints_Model::ChartPoints_Model(QObject *parent) : QAbstractTableModel(parent)
{
    QObject::connect(this, &ChartPoints_Model::newPointAdded, this, &ChartPoints_Model::addNewPoint, Qt::QueuedConnection);
}

void ChartPoints_Model::handleNewPoint(const QPointF &point)
{
    emit newPointAdded(point);

}

void ChartPoints_Model::addNewPoint(const QPointF& point) {

    beginInsertRows(QModelIndex(), rowCount(), rowCount());

    m_data.append(point);
   // m_data.push_back(point);

    value = point.x();

    emit valueChanged(value);

    endInsertRows();

    qDebug() << "111 Размер списка = " + QString::number(m_data.length());

    qDebug() << "point x = " + QString::number(point.x()) + " point y = " + QString::number(point.y());

}

void ChartPoints_Model::removeLastPoint() {

    if(m_data.length() != 0){

        beginRemoveRows(QModelIndex(), rowCount() - 1, rowCount());

        value = m_data.at(m_data.length() - 1).x();

        emit valueChanged(value);

        m_data.removeAt(m_data.length() - 1);

        endRemoveRows();
    }

}


int ChartPoints_Model::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_data.size();
}

int ChartPoints_Model::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return 2;
}

QVariant ChartPoints_Model::headerData(int section, Qt::Orientation orientation, int role) const
{
    Q_UNUSED(orientation)
    Q_UNUSED(role)

    if(section == 0)
        return "x";
    else
        return "y";
}

QVariant ChartPoints_Model::data(const QModelIndex &index, int role) const
{
    Q_UNUSED(role)

    if (index.column() == 0)
        return m_data[index.row()].x();
    else
        return m_data[index.row()].y();
}
