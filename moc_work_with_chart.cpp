/****************************************************************************
** Meta object code from reading C++ file 'work_with_chart.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "work_with_chart.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'work_with_chart.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Work_with_chart_t {
    QByteArrayData data[16];
    char stringdata0[162];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Work_with_chart_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Work_with_chart_t qt_meta_stringdata_Work_with_chart = {
    {
QT_MOC_LITERAL(0, 0, 15), // "Work_with_chart"
QT_MOC_LITERAL(1, 16, 21), // "newPoint_Chart_signal"
QT_MOC_LITERAL(2, 38, 0), // ""
QT_MOC_LITERAL(3, 39, 5), // "x_val"
QT_MOC_LITERAL(4, 45, 5), // "y_val"
QT_MOC_LITERAL(5, 51, 16), // "newPicket_signal"
QT_MOC_LITERAL(6, 68, 20), // "newViserValue_signal"
QT_MOC_LITERAL(7, 89, 5), // "value"
QT_MOC_LITERAL(8, 95, 7), // "openCSV"
QT_MOC_LITERAL(9, 103, 14), // "add_New_Picket"
QT_MOC_LITERAL(10, 118, 15), // "get_points_line"
QT_MOC_LITERAL(11, 134, 7), // "y_viser"
QT_MOC_LITERAL(12, 142, 11), // "clearPoints"
QT_MOC_LITERAL(13, 154, 3), // "max"
QT_MOC_LITERAL(14, 158, 1), // "a"
QT_MOC_LITERAL(15, 160, 1) // "b"

    },
    "Work_with_chart\0newPoint_Chart_signal\0"
    "\0x_val\0y_val\0newPicket_signal\0"
    "newViserValue_signal\0value\0openCSV\0"
    "add_New_Picket\0get_points_line\0y_viser\0"
    "clearPoints\0max\0a\0b"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Work_with_chart[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   54,    2, 0x06 /* Public */,
       5,    1,   59,    2, 0x06 /* Public */,
       6,    1,   62,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   65,    2, 0x0a /* Public */,
       9,    0,   66,    2, 0x0a /* Public */,
      10,    1,   67,    2, 0x0a /* Public */,
      12,    0,   70,    2, 0x0a /* Public */,
      13,    2,   71,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int,    3,    4,
    QMetaType::Void, QMetaType::Int,    4,
    QMetaType::Void, QMetaType::Float,    7,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Float,   11,
    QMetaType::Void,
    QMetaType::Int, QMetaType::Int, QMetaType::Int,   14,   15,

       0        // eod
};

void Work_with_chart::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Work_with_chart *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->newPoint_Chart_signal((*reinterpret_cast< const int(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2]))); break;
        case 1: _t->newPicket_signal((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 2: _t->newViserValue_signal((*reinterpret_cast< const float(*)>(_a[1]))); break;
        case 3: _t->openCSV(); break;
        case 4: _t->add_New_Picket(); break;
        case 5: _t->get_points_line((*reinterpret_cast< float(*)>(_a[1]))); break;
        case 6: _t->clearPoints(); break;
        case 7: { int _r = _t->max((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Work_with_chart::*)(const int & , const int & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Work_with_chart::newPoint_Chart_signal)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Work_with_chart::*)(const int & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Work_with_chart::newPicket_signal)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Work_with_chart::*)(const float & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Work_with_chart::newViserValue_signal)) {
                *result = 2;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Work_with_chart::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Work_with_chart.data,
    qt_meta_data_Work_with_chart,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Work_with_chart::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Work_with_chart::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Work_with_chart.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Work_with_chart::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void Work_with_chart::newPoint_Chart_signal(const int & _t1, const int & _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Work_with_chart::newPicket_signal(const int & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void Work_with_chart::newViserValue_signal(const float & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
