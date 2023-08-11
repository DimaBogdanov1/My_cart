#include <QDebug>

#include "StartTask_Model.h"

StartTask_Model::StartTask_Model(QObject *parent) : QAbstractListModel(parent)
{

    Task_Item aa;

    aa.wayNum_Value = "ss";

    aa.code_Value = "wwww";

    m_data.append(aa);
}


int StartTask_Model::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant StartTask_Model::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {

        case Code_Role:
            return  m_data.at(index.row()).code_Value;

        case WayNum_Role:
            return m_data.at(index.row()).wayNum_Value;

        case WayName_Role:
            return m_data.at(index.row()).wayName_Value;

        case StartKm_Role:
            return m_data.at(index.row()).startKm_Value;

        case EndKm_Role:
            return m_data.at(index.row()).endKm_Value;

        default:
            return QVariant();
    }
}

QHash<int, QByteArray> StartTask_Model::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();

    roles[Code_Role] = "Code_Value";
    roles[WayNum_Role] = "WayNum_Value";
    roles[WayName_Role] = "WayName_Value";
    roles[StartKm_Role] = "StartKm_Value";
    roles[EndKm_Role] = "EndKm_Value";

    return roles;
}

QVariantMap StartTask_Model::get(int row) const
{
    Task_Item myItem = m_data.value(row);
    return {
        {"Code_Value", myItem.code_Value},
        {"WayNum_Value", myItem.wayNum_Value},
        {"WayName_Value", myItem.wayName_Value},
        {"StartKm_Value", myItem.startKm_Value},
        {"EndKm_Value", myItem.endKm_Value}
    };
}

void StartTask_Model::createModel(QString code_Value, QString wayNum_Value, QString wayName_Value, QString startKm_Value, QString endKm_Value)
{

    Task_Item item;

    item.code_Value = code_Value;
    item.wayNum_Value = wayNum_Value;

    item.wayName_Value = wayName_Value;
    item.startKm_Value = startKm_Value;

    item.endKm_Value = endKm_Value;

   // this->item.code_Value = code_Value;

    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());

    m_data.append(item);

    endInsertRows();

   // m_data[0] = QString("Size: %1").arg(m_data.size());
    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));

    emit dataChanged(index, index);


    //qDebug() << "cccccccccccccc";


}


void StartTask_Model::add()
{
    Task_Item aa;

    aa.wayNum_Value = "ss";

    aa.code_Value = "wwww";

    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(aa);
    endInsertRows();

   // m_data[0] = QString("Size: %1").arg(m_data.size());
    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);

    qDebug() << "cccccccccccccc";
}

