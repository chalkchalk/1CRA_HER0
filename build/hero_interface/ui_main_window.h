/********************************************************************************
** Form generated from reading UI file 'main_window.ui'
**
** Created by: Qt User Interface Compiler version 4.8.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAIN_WINDOW_H
#define UI_MAIN_WINDOW_H

#include <QtCore/QLocale>
#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QMainWindow>
#include <QtGui/QMenuBar>
#include <QtGui/QProgressBar>
#include <QtGui/QPushButton>
#include <QtGui/QStatusBar>
#include <QtGui/QTabWidget>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindowDesign
{
public:
    QAction *action_Quit;
    QAction *action_Preferences;
    QAction *actionAbout;
    QAction *actionAbout_Qt;
    QWidget *centralwidget;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout_4;
    QTabWidget *tabWidget;
    QWidget *tab;
    QGroupBox *groupBoxBlue1;
    QPushButton *pushButtonKill;
    QPushButton *pushButtonRevive;
    QProgressBar *progressBarHealth;
    QProgressBar *progressBarHeat;
    QLabel *labelHealth;
    QLabel *labelHeat;
    QLabel *labelAmmo;
    QProgressBar *progressBarAmmo;
    QPushButton *pushButtonReload;
    QPushButton *pushButtonDisarm;
    QGroupBox *groupBoxBlue1_2;
    QPushButton *pushButtonKill_1;
    QPushButton *pushButtonRevive_1;
    QProgressBar *progressBarHealth_1;
    QProgressBar *progressBarHeat_1;
    QLabel *labelHealth_3;
    QLabel *labelHeat_3;
    QLabel *labelAmmo_3;
    QProgressBar *progressBarAmmo_1;
    QPushButton *pushButtonReload_1;
    QPushButton *pushButtonDisarm_1;
    QGroupBox *groupBoxRed1;
    QPushButton *pushButtonKill_3;
    QPushButton *pushButtonRevive_3;
    QProgressBar *progressBarHealth_3;
    QProgressBar *progressBarHeat_3;
    QLabel *labelHealth_4;
    QLabel *labelHeat_4;
    QLabel *labelAmmo_4;
    QProgressBar *progressBarAmmo_3;
    QPushButton *pushButtonReload_3;
    QPushButton *pushButtonDisarm_3;
    QGroupBox *groupBoxRed2;
    QPushButton *pushButtonKill_4;
    QPushButton *pushButtonRevive_4;
    QProgressBar *progressBarHealth_4;
    QProgressBar *progressBarHeat_4;
    QLabel *labelHealth_5;
    QLabel *labelHeat_5;
    QLabel *labelAmmo_5;
    QProgressBar *progressBarAmmo_4;
    QPushButton *pushButtonReload_4;
    QPushButton *pushButtonDisarm_4;
    QWidget *tab_2;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindowDesign)
    {
        if (MainWindowDesign->objectName().isEmpty())
            MainWindowDesign->setObjectName(QString::fromUtf8("MainWindowDesign"));
        MainWindowDesign->resize(1000, 900);
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(MainWindowDesign->sizePolicy().hasHeightForWidth());
        MainWindowDesign->setSizePolicy(sizePolicy);
        MainWindowDesign->setMinimumSize(QSize(1000, 900));
        MainWindowDesign->setMaximumSize(QSize(1000, 900));
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/images/icon.png"), QSize(), QIcon::Normal, QIcon::Off);
        MainWindowDesign->setWindowIcon(icon);
        MainWindowDesign->setLocale(QLocale(QLocale::English, QLocale::Australia));
        action_Quit = new QAction(MainWindowDesign);
        action_Quit->setObjectName(QString::fromUtf8("action_Quit"));
        action_Quit->setShortcutContext(Qt::ApplicationShortcut);
        action_Preferences = new QAction(MainWindowDesign);
        action_Preferences->setObjectName(QString::fromUtf8("action_Preferences"));
        actionAbout = new QAction(MainWindowDesign);
        actionAbout->setObjectName(QString::fromUtf8("actionAbout"));
        actionAbout_Qt = new QAction(MainWindowDesign);
        actionAbout_Qt->setObjectName(QString::fromUtf8("actionAbout_Qt"));
        centralwidget = new QWidget(MainWindowDesign);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        horizontalLayoutWidget = new QWidget(centralwidget);
        horizontalLayoutWidget->setObjectName(QString::fromUtf8("horizontalLayoutWidget"));
        horizontalLayoutWidget->setGeometry(QRect(0, 10, 541, 831));
        horizontalLayout_4 = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        horizontalLayout_4->setContentsMargins(0, 0, 0, 0);
        tabWidget = new QTabWidget(centralwidget);
        tabWidget->setObjectName(QString::fromUtf8("tabWidget"));
        tabWidget->setGeometry(QRect(560, 0, 431, 841));
        tab = new QWidget();
        tab->setObjectName(QString::fromUtf8("tab"));
        groupBoxBlue1 = new QGroupBox(tab);
        groupBoxBlue1->setObjectName(QString::fromUtf8("groupBoxBlue1"));
        groupBoxBlue1->setGeometry(QRect(20, 196, 391, 141));
        groupBoxBlue1->setStyleSheet(QString::fromUtf8("background-color: rgb(238, 238, 236);"));
        groupBoxBlue1->setFlat(false);
        pushButtonKill = new QPushButton(groupBoxBlue1);
        pushButtonKill->setObjectName(QString::fromUtf8("pushButtonKill"));
        pushButtonKill->setGeometry(QRect(296, 22, 71, 25));
        pushButtonRevive = new QPushButton(groupBoxBlue1);
        pushButtonRevive->setObjectName(QString::fromUtf8("pushButtonRevive"));
        pushButtonRevive->setGeometry(QRect(296, 50, 71, 25));
        progressBarHealth = new QProgressBar(groupBoxBlue1);
        progressBarHealth->setObjectName(QString::fromUtf8("progressBarHealth"));
        progressBarHealth->setGeometry(QRect(70, 26, 201, 23));
        progressBarHealth->setLayoutDirection(Qt::LeftToRight);
        progressBarHealth->setStyleSheet(QString::fromUtf8(""));
        progressBarHealth->setMaximum(2000);
        progressBarHealth->setValue(1000);
        progressBarHeat = new QProgressBar(groupBoxBlue1);
        progressBarHeat->setObjectName(QString::fromUtf8("progressBarHeat"));
        progressBarHeat->setGeometry(QRect(69, 66, 201, 23));
        progressBarHeat->setLayoutDirection(Qt::LeftToRight);
        progressBarHeat->setStyleSheet(QString::fromUtf8(""));
        progressBarHeat->setMaximum(2000);
        progressBarHeat->setValue(1000);
        labelHealth = new QLabel(groupBoxBlue1);
        labelHealth->setObjectName(QString::fromUtf8("labelHealth"));
        labelHealth->setGeometry(QRect(13, 28, 51, 17));
        labelHeat = new QLabel(groupBoxBlue1);
        labelHeat->setObjectName(QString::fromUtf8("labelHeat"));
        labelHeat->setGeometry(QRect(13, 68, 41, 17));
        labelAmmo = new QLabel(groupBoxBlue1);
        labelAmmo->setObjectName(QString::fromUtf8("labelAmmo"));
        labelAmmo->setGeometry(QRect(14, 103, 51, 17));
        progressBarAmmo = new QProgressBar(groupBoxBlue1);
        progressBarAmmo->setObjectName(QString::fromUtf8("progressBarAmmo"));
        progressBarAmmo->setGeometry(QRect(70, 103, 201, 23));
        progressBarAmmo->setMaximum(400);
        progressBarAmmo->setValue(100);
        pushButtonReload = new QPushButton(groupBoxBlue1);
        pushButtonReload->setObjectName(QString::fromUtf8("pushButtonReload"));
        pushButtonReload->setGeometry(QRect(296, 78, 71, 25));
        pushButtonDisarm = new QPushButton(groupBoxBlue1);
        pushButtonDisarm->setObjectName(QString::fromUtf8("pushButtonDisarm"));
        pushButtonDisarm->setGeometry(QRect(296, 107, 71, 25));
        groupBoxBlue1_2 = new QGroupBox(tab);
        groupBoxBlue1_2->setObjectName(QString::fromUtf8("groupBoxBlue1_2"));
        groupBoxBlue1_2->setGeometry(QRect(20, 350, 391, 141));
        groupBoxBlue1_2->setStyleSheet(QString::fromUtf8("background-color: rgb(238, 238, 236);"));
        groupBoxBlue1_2->setFlat(false);
        pushButtonKill_1 = new QPushButton(groupBoxBlue1_2);
        pushButtonKill_1->setObjectName(QString::fromUtf8("pushButtonKill_1"));
        pushButtonKill_1->setGeometry(QRect(296, 22, 71, 25));
        pushButtonRevive_1 = new QPushButton(groupBoxBlue1_2);
        pushButtonRevive_1->setObjectName(QString::fromUtf8("pushButtonRevive_1"));
        pushButtonRevive_1->setGeometry(QRect(296, 50, 71, 25));
        progressBarHealth_1 = new QProgressBar(groupBoxBlue1_2);
        progressBarHealth_1->setObjectName(QString::fromUtf8("progressBarHealth_1"));
        progressBarHealth_1->setGeometry(QRect(70, 26, 201, 23));
        progressBarHealth_1->setLayoutDirection(Qt::LeftToRight);
        progressBarHealth_1->setStyleSheet(QString::fromUtf8(""));
        progressBarHealth_1->setMaximum(2000);
        progressBarHealth_1->setValue(1000);
        progressBarHeat_1 = new QProgressBar(groupBoxBlue1_2);
        progressBarHeat_1->setObjectName(QString::fromUtf8("progressBarHeat_1"));
        progressBarHeat_1->setGeometry(QRect(69, 66, 201, 23));
        progressBarHeat_1->setLayoutDirection(Qt::LeftToRight);
        progressBarHeat_1->setStyleSheet(QString::fromUtf8(""));
        progressBarHeat_1->setMaximum(2000);
        progressBarHeat_1->setValue(1000);
        labelHealth_3 = new QLabel(groupBoxBlue1_2);
        labelHealth_3->setObjectName(QString::fromUtf8("labelHealth_3"));
        labelHealth_3->setGeometry(QRect(13, 28, 51, 17));
        labelHeat_3 = new QLabel(groupBoxBlue1_2);
        labelHeat_3->setObjectName(QString::fromUtf8("labelHeat_3"));
        labelHeat_3->setGeometry(QRect(13, 68, 41, 17));
        labelAmmo_3 = new QLabel(groupBoxBlue1_2);
        labelAmmo_3->setObjectName(QString::fromUtf8("labelAmmo_3"));
        labelAmmo_3->setGeometry(QRect(14, 103, 51, 17));
        progressBarAmmo_1 = new QProgressBar(groupBoxBlue1_2);
        progressBarAmmo_1->setObjectName(QString::fromUtf8("progressBarAmmo_1"));
        progressBarAmmo_1->setGeometry(QRect(70, 103, 201, 23));
        progressBarAmmo_1->setMaximum(400);
        progressBarAmmo_1->setValue(100);
        pushButtonReload_1 = new QPushButton(groupBoxBlue1_2);
        pushButtonReload_1->setObjectName(QString::fromUtf8("pushButtonReload_1"));
        pushButtonReload_1->setGeometry(QRect(296, 78, 71, 25));
        pushButtonDisarm_1 = new QPushButton(groupBoxBlue1_2);
        pushButtonDisarm_1->setObjectName(QString::fromUtf8("pushButtonDisarm_1"));
        pushButtonDisarm_1->setGeometry(QRect(296, 107, 71, 25));
        groupBoxRed1 = new QGroupBox(tab);
        groupBoxRed1->setObjectName(QString::fromUtf8("groupBoxRed1"));
        groupBoxRed1->setGeometry(QRect(20, 500, 391, 141));
        groupBoxRed1->setStyleSheet(QString::fromUtf8("background-color: rgb(238, 238, 236);"));
        groupBoxRed1->setFlat(false);
        pushButtonKill_3 = new QPushButton(groupBoxRed1);
        pushButtonKill_3->setObjectName(QString::fromUtf8("pushButtonKill_3"));
        pushButtonKill_3->setGeometry(QRect(296, 22, 71, 25));
        pushButtonRevive_3 = new QPushButton(groupBoxRed1);
        pushButtonRevive_3->setObjectName(QString::fromUtf8("pushButtonRevive_3"));
        pushButtonRevive_3->setGeometry(QRect(296, 50, 71, 25));
        progressBarHealth_3 = new QProgressBar(groupBoxRed1);
        progressBarHealth_3->setObjectName(QString::fromUtf8("progressBarHealth_3"));
        progressBarHealth_3->setGeometry(QRect(70, 26, 201, 23));
        progressBarHealth_3->setLayoutDirection(Qt::LeftToRight);
        progressBarHealth_3->setStyleSheet(QString::fromUtf8(""));
        progressBarHealth_3->setMaximum(2000);
        progressBarHealth_3->setValue(1000);
        progressBarHeat_3 = new QProgressBar(groupBoxRed1);
        progressBarHeat_3->setObjectName(QString::fromUtf8("progressBarHeat_3"));
        progressBarHeat_3->setGeometry(QRect(69, 66, 201, 23));
        progressBarHeat_3->setLayoutDirection(Qt::LeftToRight);
        progressBarHeat_3->setStyleSheet(QString::fromUtf8(""));
        progressBarHeat_3->setMaximum(2000);
        progressBarHeat_3->setValue(1000);
        labelHealth_4 = new QLabel(groupBoxRed1);
        labelHealth_4->setObjectName(QString::fromUtf8("labelHealth_4"));
        labelHealth_4->setGeometry(QRect(13, 28, 51, 17));
        labelHeat_4 = new QLabel(groupBoxRed1);
        labelHeat_4->setObjectName(QString::fromUtf8("labelHeat_4"));
        labelHeat_4->setGeometry(QRect(13, 68, 41, 17));
        labelAmmo_4 = new QLabel(groupBoxRed1);
        labelAmmo_4->setObjectName(QString::fromUtf8("labelAmmo_4"));
        labelAmmo_4->setGeometry(QRect(14, 103, 51, 17));
        progressBarAmmo_3 = new QProgressBar(groupBoxRed1);
        progressBarAmmo_3->setObjectName(QString::fromUtf8("progressBarAmmo_3"));
        progressBarAmmo_3->setGeometry(QRect(70, 103, 201, 23));
        progressBarAmmo_3->setMaximum(400);
        progressBarAmmo_3->setValue(100);
        pushButtonReload_3 = new QPushButton(groupBoxRed1);
        pushButtonReload_3->setObjectName(QString::fromUtf8("pushButtonReload_3"));
        pushButtonReload_3->setGeometry(QRect(296, 78, 71, 25));
        pushButtonDisarm_3 = new QPushButton(groupBoxRed1);
        pushButtonDisarm_3->setObjectName(QString::fromUtf8("pushButtonDisarm_3"));
        pushButtonDisarm_3->setGeometry(QRect(296, 107, 71, 25));
        groupBoxRed2 = new QGroupBox(tab);
        groupBoxRed2->setObjectName(QString::fromUtf8("groupBoxRed2"));
        groupBoxRed2->setGeometry(QRect(20, 650, 391, 141));
        groupBoxRed2->setStyleSheet(QString::fromUtf8("background-color: rgb(238, 238, 236);"));
        groupBoxRed2->setFlat(false);
        pushButtonKill_4 = new QPushButton(groupBoxRed2);
        pushButtonKill_4->setObjectName(QString::fromUtf8("pushButtonKill_4"));
        pushButtonKill_4->setGeometry(QRect(296, 22, 71, 25));
        pushButtonRevive_4 = new QPushButton(groupBoxRed2);
        pushButtonRevive_4->setObjectName(QString::fromUtf8("pushButtonRevive_4"));
        pushButtonRevive_4->setGeometry(QRect(296, 50, 71, 25));
        progressBarHealth_4 = new QProgressBar(groupBoxRed2);
        progressBarHealth_4->setObjectName(QString::fromUtf8("progressBarHealth_4"));
        progressBarHealth_4->setGeometry(QRect(70, 26, 201, 23));
        progressBarHealth_4->setLayoutDirection(Qt::LeftToRight);
        progressBarHealth_4->setStyleSheet(QString::fromUtf8(""));
        progressBarHealth_4->setMaximum(2000);
        progressBarHealth_4->setValue(1000);
        progressBarHeat_4 = new QProgressBar(groupBoxRed2);
        progressBarHeat_4->setObjectName(QString::fromUtf8("progressBarHeat_4"));
        progressBarHeat_4->setGeometry(QRect(69, 66, 201, 23));
        progressBarHeat_4->setLayoutDirection(Qt::LeftToRight);
        progressBarHeat_4->setStyleSheet(QString::fromUtf8(""));
        progressBarHeat_4->setMaximum(2000);
        progressBarHeat_4->setValue(1000);
        labelHealth_5 = new QLabel(groupBoxRed2);
        labelHealth_5->setObjectName(QString::fromUtf8("labelHealth_5"));
        labelHealth_5->setGeometry(QRect(13, 28, 51, 17));
        labelHeat_5 = new QLabel(groupBoxRed2);
        labelHeat_5->setObjectName(QString::fromUtf8("labelHeat_5"));
        labelHeat_5->setGeometry(QRect(13, 68, 41, 17));
        labelAmmo_5 = new QLabel(groupBoxRed2);
        labelAmmo_5->setObjectName(QString::fromUtf8("labelAmmo_5"));
        labelAmmo_5->setGeometry(QRect(14, 103, 51, 17));
        progressBarAmmo_4 = new QProgressBar(groupBoxRed2);
        progressBarAmmo_4->setObjectName(QString::fromUtf8("progressBarAmmo_4"));
        progressBarAmmo_4->setGeometry(QRect(70, 103, 201, 23));
        progressBarAmmo_4->setMaximum(400);
        progressBarAmmo_4->setValue(100);
        pushButtonReload_4 = new QPushButton(groupBoxRed2);
        pushButtonReload_4->setObjectName(QString::fromUtf8("pushButtonReload_4"));
        pushButtonReload_4->setGeometry(QRect(296, 78, 71, 25));
        pushButtonDisarm_4 = new QPushButton(groupBoxRed2);
        pushButtonDisarm_4->setObjectName(QString::fromUtf8("pushButtonDisarm_4"));
        pushButtonDisarm_4->setGeometry(QRect(296, 107, 71, 25));
        tabWidget->addTab(tab, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QString::fromUtf8("tab_2"));
        tabWidget->addTab(tab_2, QString());
        MainWindowDesign->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindowDesign);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 1000, 28));
        MainWindowDesign->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindowDesign);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindowDesign->setStatusBar(statusbar);

        retranslateUi(MainWindowDesign);
        QObject::connect(action_Quit, SIGNAL(triggered()), MainWindowDesign, SLOT(close()));

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindowDesign);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindowDesign)
    {
        MainWindowDesign->setWindowTitle(QApplication::translate("MainWindowDesign", "QRosApp", 0, QApplication::UnicodeUTF8));
        action_Quit->setText(QApplication::translate("MainWindowDesign", "&Quit", 0, QApplication::UnicodeUTF8));
        action_Quit->setShortcut(QApplication::translate("MainWindowDesign", "Ctrl+Q", 0, QApplication::UnicodeUTF8));
        action_Preferences->setText(QApplication::translate("MainWindowDesign", "&Preferences", 0, QApplication::UnicodeUTF8));
        actionAbout->setText(QApplication::translate("MainWindowDesign", "&About", 0, QApplication::UnicodeUTF8));
        actionAbout_Qt->setText(QApplication::translate("MainWindowDesign", "About &Qt", 0, QApplication::UnicodeUTF8));
        groupBoxBlue1->setTitle(QApplication::translate("MainWindowDesign", "Blue 1", 0, QApplication::UnicodeUTF8));
        pushButtonKill->setText(QApplication::translate("MainWindowDesign", "Kill", 0, QApplication::UnicodeUTF8));
        pushButtonRevive->setText(QApplication::translate("MainWindowDesign", "Revive", 0, QApplication::UnicodeUTF8));
        progressBarHealth->setFormat(QApplication::translate("MainWindowDesign", "%v/2000", 0, QApplication::UnicodeUTF8));
        progressBarHeat->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        labelHealth->setText(QApplication::translate("MainWindowDesign", "Health", 0, QApplication::UnicodeUTF8));
        labelHeat->setText(QApplication::translate("MainWindowDesign", "Heat", 0, QApplication::UnicodeUTF8));
        labelAmmo->setText(QApplication::translate("MainWindowDesign", "Ammo", 0, QApplication::UnicodeUTF8));
        progressBarAmmo->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        pushButtonReload->setText(QApplication::translate("MainWindowDesign", "Reload", 0, QApplication::UnicodeUTF8));
        pushButtonDisarm->setText(QApplication::translate("MainWindowDesign", "Disarm", 0, QApplication::UnicodeUTF8));
        groupBoxBlue1_2->setTitle(QApplication::translate("MainWindowDesign", "Blue 2", 0, QApplication::UnicodeUTF8));
        pushButtonKill_1->setText(QApplication::translate("MainWindowDesign", "Kill", 0, QApplication::UnicodeUTF8));
        pushButtonRevive_1->setText(QApplication::translate("MainWindowDesign", "Revive", 0, QApplication::UnicodeUTF8));
        progressBarHealth_1->setFormat(QApplication::translate("MainWindowDesign", "%v/2000", 0, QApplication::UnicodeUTF8));
        progressBarHeat_1->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        labelHealth_3->setText(QApplication::translate("MainWindowDesign", "Health", 0, QApplication::UnicodeUTF8));
        labelHeat_3->setText(QApplication::translate("MainWindowDesign", "Heat", 0, QApplication::UnicodeUTF8));
        labelAmmo_3->setText(QApplication::translate("MainWindowDesign", "Ammo", 0, QApplication::UnicodeUTF8));
        progressBarAmmo_1->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        pushButtonReload_1->setText(QApplication::translate("MainWindowDesign", "Reload", 0, QApplication::UnicodeUTF8));
        pushButtonDisarm_1->setText(QApplication::translate("MainWindowDesign", "Disarm", 0, QApplication::UnicodeUTF8));
        groupBoxRed1->setTitle(QApplication::translate("MainWindowDesign", "Red 1", 0, QApplication::UnicodeUTF8));
        pushButtonKill_3->setText(QApplication::translate("MainWindowDesign", "Kill", 0, QApplication::UnicodeUTF8));
        pushButtonRevive_3->setText(QApplication::translate("MainWindowDesign", "Revive", 0, QApplication::UnicodeUTF8));
        progressBarHealth_3->setFormat(QApplication::translate("MainWindowDesign", "%v/2000", 0, QApplication::UnicodeUTF8));
        progressBarHeat_3->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        labelHealth_4->setText(QApplication::translate("MainWindowDesign", "Health", 0, QApplication::UnicodeUTF8));
        labelHeat_4->setText(QApplication::translate("MainWindowDesign", "Heat", 0, QApplication::UnicodeUTF8));
        labelAmmo_4->setText(QApplication::translate("MainWindowDesign", "Ammo", 0, QApplication::UnicodeUTF8));
        progressBarAmmo_3->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        pushButtonReload_3->setText(QApplication::translate("MainWindowDesign", "Reload", 0, QApplication::UnicodeUTF8));
        pushButtonDisarm_3->setText(QApplication::translate("MainWindowDesign", "Disarm", 0, QApplication::UnicodeUTF8));
        groupBoxRed2->setTitle(QApplication::translate("MainWindowDesign", "Red 2", 0, QApplication::UnicodeUTF8));
        pushButtonKill_4->setText(QApplication::translate("MainWindowDesign", "Kill", 0, QApplication::UnicodeUTF8));
        pushButtonRevive_4->setText(QApplication::translate("MainWindowDesign", "Revive", 0, QApplication::UnicodeUTF8));
        progressBarHealth_4->setFormat(QApplication::translate("MainWindowDesign", "%v/2000", 0, QApplication::UnicodeUTF8));
        progressBarHeat_4->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        labelHealth_5->setText(QApplication::translate("MainWindowDesign", "Health", 0, QApplication::UnicodeUTF8));
        labelHeat_5->setText(QApplication::translate("MainWindowDesign", "Heat", 0, QApplication::UnicodeUTF8));
        labelAmmo_5->setText(QApplication::translate("MainWindowDesign", "Ammo", 0, QApplication::UnicodeUTF8));
        progressBarAmmo_4->setFormat(QApplication::translate("MainWindowDesign", "%v", 0, QApplication::UnicodeUTF8));
        pushButtonReload_4->setText(QApplication::translate("MainWindowDesign", "Reload", 0, QApplication::UnicodeUTF8));
        pushButtonDisarm_4->setText(QApplication::translate("MainWindowDesign", "Disarm", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("MainWindowDesign", "\350\243\201\345\210\244\347\263\273\347\273\237", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("MainWindowDesign", "\347\211\251\347\220\206\345\274\225\346\223\216", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class MainWindowDesign: public Ui_MainWindowDesign {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAIN_WINDOW_H
