#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QAbstractListModel>

class Data
{
public:
    Data(const QString &title,const QString &data);

    QString title() const;
    QString data() const;

private:
    QString title_;
    QString data_;
};

class DataModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum DataRoles{
        TitleRole = Qt::UserRole + 1,
        ColorRole
    };

    explicit DataModel(QObject *parent = nullptr);
    ~DataModel();

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Add data:
    Q_INVOKABLE void insert(int index,const Data &data) ;

    // Remove data:
    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE void append(const QString &title,const QString &data);
    int count() const;
    Q_INVOKABLE QString data(int index);

protected: // interface QAbstractListModel
    virtual QHash<int, QByteArray> roleNames() const;

private:
    QList<Data> dataList_;
};

#endif // DATAMODEL_H
