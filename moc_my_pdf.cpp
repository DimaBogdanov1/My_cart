/****************************************************************************
** Meta object code from reading C++ file 'my_pdf.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "export/my_pdf.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'my_pdf.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_My_pdf_t {
    QByteArrayData data[11];
    char stringdata0[99];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_My_pdf_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_My_pdf_t qt_meta_stringdata_My_pdf = {
    {
QT_MOC_LITERAL(0, 0, 6), // "My_pdf"
QT_MOC_LITERAL(1, 7, 9), // "print_pdf"
QT_MOC_LITERAL(2, 17, 0), // ""
QT_MOC_LITERAL(3, 18, 11), // "create_json"
QT_MOC_LITERAL(4, 30, 9), // "insertApi"
QT_MOC_LITERAL(5, 40, 3), // "str"
QT_MOC_LITERAL(6, 44, 7), // "readAPI"
QT_MOC_LITERAL(7, 52, 4), // "init"
QT_MOC_LITERAL(8, 57, 7), // "newuser"
QT_MOC_LITERAL(9, 65, 18), // "on_stoping_clicked"
QT_MOC_LITERAL(10, 84, 14) // "slotReadClient"

    },
    "My_pdf\0print_pdf\0\0create_json\0insertApi\0"
    "str\0readAPI\0init\0newuser\0on_stoping_clicked\0"
    "slotReadClient"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_My_pdf[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   54,    2, 0x0a /* Public */,
       3,    0,   55,    2, 0x0a /* Public */,
       4,    1,   56,    2, 0x0a /* Public */,
       6,    0,   59,    2, 0x0a /* Public */,
       7,    0,   60,    2, 0x0a /* Public */,
       8,    0,   61,    2, 0x0a /* Public */,
       9,    0,   62,    2, 0x0a /* Public */,
      10,    0,   63,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    5,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void My_pdf::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<My_pdf *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->print_pdf(); break;
        case 1: _t->create_json(); break;
        case 2: _t->insertApi((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->readAPI(); break;
        case 4: _t->init(); break;
        case 5: _t->newuser(); break;
        case 6: _t->on_stoping_clicked(); break;
        case 7: _t->slotReadClient(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject My_pdf::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_My_pdf.data,
    qt_meta_data_My_pdf,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *My_pdf::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *My_pdf::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_My_pdf.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int My_pdf::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
QT_WARNING_POP
QT_END_MOC_NAMESPACE
