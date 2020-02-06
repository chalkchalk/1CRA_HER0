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
    void DisplayCountDown(int sec);
    void ShowGameStatus();
    virtual void mousePressEvent(QMouseEvent *event);
    virtual void mouseMoveEvent(QMouseEvent *event);
    virtual void mouseReleaseEvent(QMouseEvent *event);
    virtual void keyPressEvent(QKeyEvent *ev);
    virtual void keyReleaseEvent(QKeyEvent *ev);
public Q_SLOTS:


    void timer_timeout(); //定时溢出处理槽函数
    void on_pushButtonKill_clicked();
    void on_pushButtonRevive_clicked();
    void on_pushButtonReload_clicked();
    void on_pushButtonDisarm_clicked();
    void on_pushButtonDisarm_4_clicked();
    void on_pushButtonReload_4_clicked();
    void on_pushButtonRevive_4_clicked();
    void on_pushButtonKill_4_clicked();
    void on_pushButtonDisarm_3_clicked();
    void on_pushButtonReload_3_clicked();
    void on_pushButtonRevive_3_clicked();
    void on_pushButtonKill_3_clicked();
    void on_pushButtonDisarm_1_clicked();
    void on_pushButtonReload_1_clicked();
    void on_pushButtonRevive_1_clicked();
    void on_pushButtonKill_1_clicked();
    void on_pushButtonRFID_Rfresh_clicked();
    void on_pushButtonGameStop_clicked();
    void on_pushButtonGameStart_clicked();
    void on_pushButtonGamePrep_clicked();
    void on_pushButtonRFID_KillAll_clicked();

private:
	Ui::MainWindowDesign ui;
	QNode qnode;
    BattleView battleView;
    QImage          image;
    QTimer *fTimer;//定时器

    int w_s_speed;
    int a_d_speed;


    void ShowJudgeSysInfo();
};

}  // namespace hero_interface

#endif // hero_interface_MAIN_WINDOW_H
