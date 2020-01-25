/**
 * @file /include/hero_interface/main_window.hpp
 *
 * @brief Qt based gui for hero_interface.
 *
 * @date November 2010
 **/
#ifndef hero_interface_MAIN_WINDOW_H
#define hero_interface_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
#include "qnode.hpp"
#include <QTimer>
#include <QPainter>
#include "battleview.h"

/*****************************************************************************
** Namespace
*****************************************************************************/

namespace hero_interface {

class MainWindow : public QMainWindow {
Q_OBJECT

public:
	MainWindow(int argc, char** argv, QWidget *parent = 0);
	~MainWindow();

	void ReadSettings(); // Load up qt program settings at startup
	void WriteSettings(); // Save qt program settings when closing
	void closeEvent(QCloseEvent *event); // Overloaded function
    virtual void paintEvent(QPaintEvent *event);

public Q_SLOTS:


    void timer_timeout(); //定时溢出处理槽函数

    void on_pushButtonReset_clicked();

private:
	Ui::MainWindowDesign ui;
	QNode qnode;
    BattleView battleView;
    QImage          image;
    QTimer *fTimer;//定时器
};

}  // namespace hero_interface

#endif // hero_interface_MAIN_WINDOW_H
