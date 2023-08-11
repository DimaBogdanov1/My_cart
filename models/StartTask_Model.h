#include <QAbstractListModel>
#include <QStringList>

class StartTask_Model : public QAbstractListModel
{   
    Q_OBJECT

public:

    enum Roles {
        Code_Role , //= Qt::DisplayRole // Код пути
        WayNum_Role , // Номер Пути
        WayName_Role , // Название Пути
        StartKm_Role , // Стартовый Километр
        EndKm_Role // Стартовый Километр

    };

    StartTask_Model(QObject *parent = 0);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    QVariantMap get(int row) const;

    void add();

    void createModel(QString code_Value, QString wayNum_Value, QString wayName_Value, QString startKm_Value, QString endKm_Value);

private:

    struct Task_Item {
        QString code_Value;
        QString wayNum_Value;
        QString wayName_Value;
        QString startKm_Value;
        QString endKm_Value;
    };


    QList<Task_Item> m_data;

  //  QStringList m_data;
};

