#include "filesmodel.h"
#include <qdebug.h>

Data::Data(const QString &title, const QString &data)
    :title_(title)
    ,data_(data)
{

}

QString Data::title() const
{
    return title_;
}

QString Data::data() const
{
    return data_;
}

DataModel::DataModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

DataModel::~DataModel()
{
}

int DataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return dataList_.count();
}

QVariant DataModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if(row < 0 || row >= dataList_.count()) {
        return QVariant();
    }

    const Data &data = dataList_[row];
    switch (role) {
    case TitleRole:
        return data.title();
        break;
    case ColorRole:
        return data.data();
        break;
    }

    return QVariant();
}


//dm : data model
QHash<int, QByteArray> DataModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TitleRole] = "dmTitle";
    roles[ColorRole] = "dmColor";
    return roles;
    //    emit countChanged(m_data.count());
}

void DataModel::insert(int index, const Data &data)
{
    if(index < 0 || index > dataList_.count()) {
        return;
    }

    emit beginInsertRows(QModelIndex(), index, index);
    dataList_.insert(index, data);
    emit endInsertRows();
//    emit countChanged(m_data.count());
}

void DataModel::remove(int index)
{
    if(index < 0 || index >= dataList_.count()) {
        return;
    }

    beginRemoveRows(QModelIndex(), index, index);
    dataList_.removeAt(index);
    endRemoveRows();
}


void DataModel::append(const QString &title,const QString &data)
{
    qDebug() << "title=" << title;
    qDebug() << "data=" << data;
    insert(count(), Data(title,data));
}

Q_INVOKABLE QString DataModel::data(int index)
{
     return dataList_[index].data();
}


int DataModel::count() const
{
    return rowCount(QModelIndex());
}
