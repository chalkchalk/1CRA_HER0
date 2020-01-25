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
	, qnode(argc,argv)
{
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
    QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application
	setWindowIcon(QIcon(":/images/icon.png"));
    QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));

    image = QImage(this->size(), QImage::Format_RGB32);
    image.fill(Qt::white);

    fTimer=new QTimer(this);
    connect(fTimer,SIGNAL(timeout()),this,SLOT(timer_timeout()));
    fTimer->start(100);
    battleView.AddRobot(new Robot("Robot_0","red"));
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


void MainWindow::timer_timeout()
{
    battleView.GetBattleView(&image);
    this->update();
}

}  // namespace hero_interface

void hero_interface::MainWindow::on_pushButtonReset_clicked()
{

    //QImage tux;
    //QPainter painter(&image);
    //tux.load(qApp->applicationDirPath() + "/tux.png");
   // tux.load("/home/ycz/ICRA_HERO_ws/src/hero_interface/resources/images/map.png");
    //painter.drawImage(QPoint(MAP_OFFSET_X, MAP_OFFSET_Y), tux);
    printf("draw!\n");
    battleView.GetBattleView(&image);
    this->update();
}
