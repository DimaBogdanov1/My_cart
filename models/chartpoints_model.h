#ifndef CHARTPOINTS_MODEL_H
#define CHARTPOINTS_MODEL_H

#include <QAbstractTableModel>
#include <QPoint>

class ChartPoints_Model : public QAbstractTableModel
{
    Q_OBJECT

    Q_PROPERTY(float value MEMBER value NOTIFY valueChanged)

public:

    explicit ChartPoints_Model(QObject *parent = nullptr);

    QVariant data(const QModelIndex &index) const;

    int rowCount(const QModelIndex &parent = QModelIndex()) const;

    int columnCount(const QModelIndex &parent = QModelIndex()) const;

    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    void handleNewPoint(const QPointF& point);

    Q_INVOKABLE void addNewPoint(const QPointF& point);

    Q_INVOKABLE void removeLastPoint();

    float value;

private:
    QList<QPointF> m_data;


signals:
    void newPointAdded(const QPointF& point);

    void valueChanged(float value);

};

#endif // CHARTPOINTS_MODEL_H
