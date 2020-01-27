/**
 * @file /src/main_window.cpp
 *
 * @brief Implementation for the qt gui.
 *
 * @date February 2011
 **/
/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QMessageBox>
#include <iostream>
#include "../include/hero_interface/main_window.hpp"



namespace hero_interface {

using namespace Qt;


#define MAP_OFFSET_X 10
#define MAP_OFFSET_Y 30


MainWindow::MainWindow(int argc, char** argv, QWidget *parent)
	: QMainWindow(parent)
    , qnode(argc,argv,&battleView),
      battleView(&qnode)
{
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
    setAutoFillBackground(false);  //这个不设置的话就背景变黑

    setAttribute(Qt::WA_TranslucentBackground,true);

    QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application
	setWindowIcon(QIcon(":/images/icon.png"));
    QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));

    image = QImage(this->size(), QImage::Format_RGB32);
    image.fill(Qt::white);

    fTimer=new QTimer(this);
    connect(fTimer,SIGNAL(timeout()),this,SLOT(timer_timeout()));
    fTimer->start(20);
    battleView.AddRobot(new Robot("robot_0","blue"));
    battleView.AddRobot(new Robot("robot_1","blue"));
    battleView.AddRobot(new Robot("robot_2","red"));
    battleView.AddRobot(new Robot("robot_3","red"));
    qnode.init();
}

MainWindow::~MainWindow() {}

void MainWindow::paintEvent(QPaintEvent *event)
{
    QPainter canvasPainter(this);

    canvasPainter.drawImage(this->rect(), image, image.rect());
}

void MainWindow::closeEvent(QCloseEvent *event)
{
	QMainWindow::closeEvent(event);
}

void MainWindow::ShowJudgeSysInfo()
{
    ui.progressBarHealth->setValue(qnode.GetRoboStatus(0).remain_hp);
    ui.progressBarHeat->setValue(qnode.GetRoboHeat(0).shooter_heat);
    ui.progressBarAmmo->setValue(qnode.GetRoboStatus(0).remain_ammo);

    ui.progressBarHealth_1->setValue(qnode.GetRoboStatus(1).remain_hp);
    ui.progressBarHeat_1->setValue(qnode.GetRoboHeat(1).shooter_heat);
    ui.progressBarAmmo_1->setValue(qnode.GetRoboStatus(1).remain_ammo);

    ui.progressBarHealth_3->setValue(qnode.GetRoboStatus(2).remain_hp);
    ui.progressBarHeat_3->setValue(qnode.GetRoboHeat(2).shooter_heat);
    ui.progressBarAmmo_3->setValue(qnode.GetRoboStatus(2).remain_ammo);

    ui.progressBarHealth_4->setValue(qnode.GetRoboStatus(3).remain_hp);
    ui.progressBarHeat_4->setValue(qnode.GetRoboHeat(3).shooter_heat);
    ui.progressBarAmmo_4->setValue(qnode.GetRoboStatus(3).remain_ammo);
}

void MainWindow::timer_timeout()
{
    battleView.GetBattleView(&image);
    ShowJudgeSysInfo();
    this->update();
}

}  // namespace hero_interface



void hero_interface::MainWindow::on_pushButtonKill_clicked()
{
    qnode.KillRobot("robot_0");
}

void hero_interface::MainWindow::on_pushButtonRevive_clicked()
{
    qnode.ReviveRobot("robot_0");
}

void hero_interface::MainWindow::on_pushButtonReload_clicked()
{
    qnode.ReloadRobot("robot_0");
}

void hero_interface::MainWindow::on_pushButtonDisarm_clicked()
{
    qnode.DisarmRobot("robot_0");
}



void hero_interface::MainWindow::on_pushButtonKill_1_clicked()
{
    qnode.KillRobot("robot_1");
}

void hero_interface::MainWindow::on_pushButtonRevive_1_clicked()
{
    qnode.ReviveRobot("robot_1");
}

void hero_interface::MainWindow::on_pushButtonReload_1_clicked()
{
    qnode.ReloadRobot("robot_1");
}

void hero_interface::MainWindow::on_pushButtonDisarm_1_clicked()
{
    qnode.DisarmRobot("robot_1");
}

void hero_interface::MainWindow::on_pushButtonKill_3_clicked()
{
    qnode.KillRobot("robot_2");
}

void hero_interface::MainWindow::on_pushButtonRevive_3_clicked()
{
    qnode.ReviveRobot("robot_2");
}

void hero_interface::MainWindow::on_pushButtonReload_3_clicked()
{
    qnode.ReloadRobot("robot_2");
}

void hero_interface::MainWindow::on_pushButtonDisarm_3_clicked()
{
    qnode.DisarmRobot("robot_2");
}

void hero_interface::MainWindow::on_pushButtonKill_4_clicked()
{
    qnode.KillRobot("robot_3");
}

void hero_interface::MainWindow::on_pushButtonRevive_4_clicked()
{
    qnode.ReviveRobot("robot_3");
}

void hero_interface::MainWindow::on_pushButtonReload_4_clicked()
{
    qnode.ReloadRobot("robot_3");
}

void hero_interface::MainWindow::on_pushButtonDisarm_4_clicked()
{
    qnode.DisarmRobot("robot_3");
}
