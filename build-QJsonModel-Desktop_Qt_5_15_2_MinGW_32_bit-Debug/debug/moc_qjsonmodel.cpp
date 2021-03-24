/****************************************************************************
** Meta object code from reading C++ file 'qjsonmodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../QJsonModel/qjsonmodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qjsonmodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_QJsonModel_t {
    QByteArrayData data[22];
    char stringdata0[169];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_QJsonModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_QJsonModel_t qt_meta_stringdata_QJsonModel = {
    {
QT_MOC_LITERAL(0, 0, 10), // "QJsonModel"
QT_MOC_LITERAL(1, 11, 11), // "addChildren"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 11), // "QModelIndex"
QT_MOC_LITERAL(4, 36, 5), // "index"
QT_MOC_LITERAL(5, 42, 5), // "value"
QT_MOC_LITERAL(6, 48, 3), // "key"
QT_MOC_LITERAL(7, 52, 10), // "addSibling"
QT_MOC_LITERAL(8, 63, 4), // "load"
QT_MOC_LITERAL(9, 68, 8), // "fileName"
QT_MOC_LITERAL(10, 77, 4), // "json"
QT_MOC_LITERAL(11, 82, 5), // "clear"
QT_MOC_LITERAL(12, 88, 6), // "toJson"
QT_MOC_LITERAL(13, 95, 6), // "toCbor"
QT_MOC_LITERAL(14, 102, 11), // "toByteArray"
QT_MOC_LITERAL(15, 114, 6), // "isJson"
QT_MOC_LITERAL(16, 121, 7), // "Columns"
QT_MOC_LITERAL(17, 129, 8), // "ColBegin"
QT_MOC_LITERAL(18, 138, 6), // "ColKey"
QT_MOC_LITERAL(19, 145, 8), // "ColValue"
QT_MOC_LITERAL(20, 154, 7), // "ColType"
QT_MOC_LITERAL(21, 162, 6) // "ColEnd"

    },
    "QJsonModel\0addChildren\0\0QModelIndex\0"
    "index\0value\0key\0addSibling\0load\0"
    "fileName\0json\0clear\0toJson\0toCbor\0"
    "toByteArray\0isJson\0Columns\0ColBegin\0"
    "ColKey\0ColValue\0ColType\0ColEnd"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QJsonModel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       1,  116, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    3,   74,    2, 0x0a /* Public */,
       1,    2,   81,    2, 0x2a /* Public | MethodCloned */,
       1,    1,   86,    2, 0x2a /* Public | MethodCloned */,
       7,    3,   89,    2, 0x0a /* Public */,
       7,    2,   96,    2, 0x2a /* Public | MethodCloned */,
       7,    1,  101,    2, 0x2a /* Public | MethodCloned */,

 // methods: name, argc, parameters, tag, flags
       8,    1,  104,    2, 0x02 /* Public */,
       8,    1,  107,    2, 0x02 /* Public */,
      11,    0,  110,    2, 0x02 /* Public */,
      12,    0,  111,    2, 0x02 /* Public */,
      13,    0,  112,    2, 0x02 /* Public */,
      14,    1,  113,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Bool, 0x80000000 | 3, QMetaType::QVariant, QMetaType::QString,    4,    5,    6,
    QMetaType::Bool, 0x80000000 | 3, QMetaType::QVariant,    4,    5,
    QMetaType::Bool, 0x80000000 | 3,    4,
    QMetaType::Bool, 0x80000000 | 3, QMetaType::QVariant, QMetaType::QString,    4,    5,    6,
    QMetaType::Bool, 0x80000000 | 3, QMetaType::QVariant,    4,    5,
    QMetaType::Bool, 0x80000000 | 3,    4,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString,    9,
    QMetaType::Bool, QMetaType::QByteArray,   10,
    QMetaType::Void,
    QMetaType::QJsonValue,
    QMetaType::QCborValue,
    QMetaType::QByteArray, QMetaType::Bool,   15,

 // enums: name, alias, flags, count, data
      16,   16, 0x0,    5,  121,

 // enum data: key, value
      17, uint(QJsonModel::ColBegin),
      18, uint(QJsonModel::ColKey),
      19, uint(QJsonModel::ColValue),
      20, uint(QJsonModel::ColType),
      21, uint(QJsonModel::ColEnd),

       0        // eod
};

void QJsonModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<QJsonModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { bool _r = _t->addChildren((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< const QVariant(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: { bool _r = _t->addChildren((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< const QVariant(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->addChildren((*reinterpret_cast< const QModelIndex(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->addSibling((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< const QVariant(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->addSibling((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< const QVariant(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 5: { bool _r = _t->addSibling((*reinterpret_cast< const QModelIndex(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 6: { bool _r = _t->load((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 7: { bool _r = _t->load((*reinterpret_cast< const QByteArray(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 8: _t->clear(); break;
        case 9: { QJsonValue _r = _t->toJson();
            if (_a[0]) *reinterpret_cast< QJsonValue*>(_a[0]) = std::move(_r); }  break;
        case 10: { QCborValue _r = _t->toCbor();
            if (_a[0]) *reinterpret_cast< QCborValue*>(_a[0]) = std::move(_r); }  break;
        case 11: { QByteArray _r = _t->toByteArray((*reinterpret_cast< bool(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject QJsonModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractItemModel::staticMetaObject>(),
    qt_meta_stringdata_QJsonModel.data,
    qt_meta_data_QJsonModel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *QJsonModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QJsonModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_QJsonModel.stringdata0))
        return static_cast<void*>(this);
    return QAbstractItemModel::qt_metacast(_clname);
}

int QJsonModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractItemModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
