/****************************************************************************
** Meta object code from reading C++ file 'main_window.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/hero_interface/include/hero_interface/main_window.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'main_window.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_hero_interface__MainWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      17,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      28,   27,   27,   27, 0x0a,
      44,   27,   27,   27, 0x0a,
      72,   27,   27,   27, 0x0a,
     102,   27,   27,   27, 0x0a,
     132,   27,   27,   27, 0x0a,
     162,   27,   27,   27, 0x0a,
     194,   27,   27,   27, 0x0a,
     226,   27,   27,   27, 0x0a,
     258,   27,   27,   27, 0x0a,
     288,   27,   27,   27, 0x0a,
     320,   27,   27,   27, 0x0a,
     352,   27,   27,   27, 0x0a,
     384,   27,   27,   27, 0x0a,
     414,   27,   27,   27, 0x0a,
     446,   27,   27,   27, 0x0a,
     478,   27,   27,   27, 0x0a,
     510,   27,   27,   27, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_hero_interface__MainWindow[] = {
    "hero_interface::MainWindow\0\0timer_timeout()\0"
    "on_pushButtonKill_clicked()\0"
    "on_pushButtonRevive_clicked()\0"
    "on_pushButtonReload_clicked()\0"
    "on_pushButtonDisarm_clicked()\0"
    "on_pushButtonDisarm_4_clicked()\0"
    "on_pushButtonReload_4_clicked()\0"
    "on_pushButtonRevive_4_clicked()\0"
    "on_pushButtonKill_4_clicked()\0"
    "on_pushButtonDisarm_3_clicked()\0"
    "on_pushButtonReload_3_clicked()\0"
    "on_pushButtonRevive_3_clicked()\0"
    "on_pushButtonKill_3_clicked()\0"
    "on_pushButtonDisarm_1_clicked()\0"
    "on_pushButtonReload_1_clicked()\0"
    "on_pushButtonRevive_1_clicked()\0"
    "on_pushButtonKill_1_clicked()\0"
};

void hero_interface::MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MainWindow *_t = static_cast<MainWindow *>(_o);
        switch (_id) {
        case 0: _t->timer_timeout(); break;
        case 1: _t->on_pushButtonKill_clicked(); break;
        case 2: _t->on_pushButtonRevive_clicked(); break;
        case 3: _t->on_pushButtonReload_clicked(); break;
        case 4: _t->on_pushButtonDisarm_clicked(); break;
        case 5: _t->on_pushButtonDisarm_4_clicked(); break;
        case 6: _t->on_pushButtonReload_4_clicked(); break;
        case 7: _t->on_pushButtonRevive_4_clicked(); break;
        case 8: _t->on_pushButtonKill_4_clicked(); break;
        case 9: _t->on_pushButtonDisarm_3_clicked(); break;
        case 10: _t->on_pushButtonReload_3_clicked(); break;
        case 11: _t->on_pushButtonRevive_3_clicked(); break;
        case 12: _t->on_pushButtonKill_3_clicked(); break;
        case 13: _t->on_pushButtonDisarm_1_clicked(); break;
        case 14: _t->on_pushButtonReload_1_clicked(); break;
        case 15: _t->on_pushButtonRevive_1_clicked(); break;
        case 16: _t->on_pushButtonKill_1_clicked(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData hero_interface::MainWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject hero_interface::MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_hero_interface__MainWindow,
      qt_meta_data_hero_interface__MainWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &hero_interface::MainWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *hero_interface::MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *hero_interface::MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_hero_interface__MainWindow))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int hero_interface::MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
