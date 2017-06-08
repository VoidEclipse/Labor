/****************************************************************************
** Meta object code from reading C++ file 'userinfo.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "userinfo.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'userinfo.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_UserInfo_t {
    QByteArrayData data[11];
    char stringdata0[76];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_UserInfo_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_UserInfo_t qt_meta_stringdata_UserInfo = {
    {
QT_MOC_LITERAL(0, 0, 8), // "UserInfo"
QT_MOC_LITERAL(1, 9, 5), // "login"
QT_MOC_LITERAL(2, 15, 0), // ""
QT_MOC_LITERAL(3, 16, 8), // "setLogin"
QT_MOC_LITERAL(4, 25, 5), // "value"
QT_MOC_LITERAL(5, 31, 8), // "password"
QT_MOC_LITERAL(6, 40, 11), // "setPassword"
QT_MOC_LITERAL(7, 52, 5), // "token"
QT_MOC_LITERAL(8, 58, 8), // "setToken"
QT_MOC_LITERAL(9, 67, 2), // "id"
QT_MOC_LITERAL(10, 70, 5) // "setId"

    },
    "UserInfo\0login\0\0setLogin\0value\0password\0"
    "setPassword\0token\0setToken\0id\0setId"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_UserInfo[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   54,    2, 0x02 /* Public */,
       3,    1,   55,    2, 0x02 /* Public */,
       5,    0,   58,    2, 0x02 /* Public */,
       6,    1,   59,    2, 0x02 /* Public */,
       7,    0,   62,    2, 0x02 /* Public */,
       8,    1,   63,    2, 0x02 /* Public */,
       9,    0,   66,    2, 0x02 /* Public */,
      10,    1,   67,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Int,
    QMetaType::Void, QMetaType::Int,    4,

       0        // eod
};

void UserInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        UserInfo *_t = static_cast<UserInfo *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->login();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 1: _t->setLogin((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: { QString _r = _t->password();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->setPassword((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: { QString _r = _t->token();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: _t->setToken((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: { int _r = _t->id();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 7: _t->setId((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject UserInfo::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_UserInfo.data,
      qt_meta_data_UserInfo,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *UserInfo::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *UserInfo::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_UserInfo.stringdata0))
        return static_cast<void*>(const_cast< UserInfo*>(this));
    return QObject::qt_metacast(_clname);
}

int UserInfo::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
