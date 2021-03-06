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
      battleView(&qnode),
      w_s_speed(0),
      a_d_speed(0)
{
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
    setAutoFillBackground(false);  //这个不设置的话就背景变黑

    setAttribute(Qt::WA_TranslucentBackground,true);

    QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application
	setWindowIcon(QIcon(":/images/icon.png"));
    QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));

    image = QImage(this->size(), QImage::Format_RGB32);
    image.fill(Qt::white);

    //this->grabKeyboard();
    // setMouseTracking(true);
    //QMainWindow::setMouseTracking(true);
    //QMainWindow::centralWidget()->setMouseTracking(true);
   // ui->openGLWidget->setMouseTracking(true);
     //this->setMouseTracking(true);
    //ui.centralwidget->setMouseTracking(true);
    //ui.horizontalLayoutWidget->setMouseTracking(true);

    ui.radioButton_ctrl_rts->setChecked(true);
    fTimer=new QTimer(this);
    fTimer->start(50);
    battleView.AddRobot(new Robot("robot_0","blue"));
    battleView.AddRobot(new Robot("robot_1","blue"));
    battleView.AddRobot(new Robot("robot_2","red"));
    battleView.AddRobot(new Robot("robot_3","red"));

    for(int i =0; i< 6;i++)
    {
        qnode.RFID_F_x[i] = 0;
        qnode.RFID_F_y[i] = 0;
    }
    qnode.RFID_height = 0.4;
    qnode.RFID_width = 0.4;

    qnode.init();

    connect(fTimer,SIGNAL(timeout()),this,SLOT(timer_timeout()));
}

MainWindow::~MainWindow() {}

void MainWindow::DisplayCountDown(int sec)
{
     QTime time;
     time.setHMS(0,sec/60,sec%60,0);
     ui.lcdNumberTime->display(time.toString("mm:ss"));
}
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

void MainWindow::ShowGameStatus()
{
    if(qnode.GetGameStatus()->game_status == qnode.GetGameStatus()->PRE_MATCH)
         ui.labelStatus->setText("Status: Prepration");
    else if(qnode.GetGameStatus()->game_status == qnode.GetGameStatus()->ROUND)
        ui.labelStatus->setText("Status: Start");
    else if(qnode.GetGameStatus()->game_status == qnode.GetGameStatus()->CALCULATION)
         ui.labelStatus->setText("Status: End");
}
void MainWindow::timer_timeout()
{
    battleView.GetBattleView(&image);
    ShowJudgeSysInfo();
    DisplayCountDown(qnode.GetGameStatus()->remaining_time);
    ShowGameStatus();
    if(ui.radioButton_ctrl_act->isChecked())
    {
      qnode.MoveRobot0(w_s_speed,a_d_speed);
    }
    battleView.isACT = ui.radioButton_ctrl_act->isChecked();
    battleView.isRTS = ui.radioButton_ctrl_rts->isChecked();
    battleView.AimPointRobot0(this->mapFromGlobal(QCursor::pos()).x(),this->mapFromGlobal(QCursor::pos()).y());
    //printf("[]%d , %d\n",this->mapFromGlobal(QCursor::pos()).x(),this->mapFromGlobal(QCursor::pos()).y());
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

void hero_interface::MainWindow::on_pushButtonRFID_Rfresh_clicked()
{
    qnode.SendJudgeSysCall(hero_common::JudgeSysCommand::REFRESH_RFID,"null");
}

void hero_interface::MainWindow::on_pushButtonRFID_KillAll_clicked()
{
    qnode.SendJudgeSysCall(hero_common::JudgeSysCommand::KILL_ALL,"null");
}

void hero_interface::MainWindow::on_pushButtonGamePrep_clicked()
{
    qnode.SendJudgeSysCall(hero_common::JudgeSysCommand::GAME_PERP,"null");
    qnode.ResetPosition();
}

void hero_interface::MainWindow::on_pushButtonGameStart_clicked()
{
    qnode.SendJudgeSysCall(hero_common::JudgeSysCommand::GAME_START,"null");
}

void hero_interface::MainWindow::on_pushButtonGameStop_clicked()
{
    qnode.SendJudgeSysCall(hero_common::JudgeSysCommand::GAME_END,"null");
}


void hero_interface::MainWindow::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        //printf("%d,%d\n",event->pos().x(),event->pos().y());

        battleView.LeftButtonPress(event->pos().x(),event->pos().y());
                //SetRobotGoalPoint(event->pos().x(),event->pos().y());

    }
    if(event->button()==Qt::RightButton)
    {
        battleView.RightButtonPress(event->pos().x(),event->pos().y());
    }
    else if(event->button()==Qt::MidButton)
    {

    }

}


void hero_interface::MainWindow::mouseMoveEvent(QMouseEvent *event)
{
    if ((event->buttons() == Qt::LeftButton))
    {
        battleView.LeftButtonDrag(event->pos().x(),event->pos().y());
    }

}

void hero_interface::MainWindow::mouseReleaseEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        battleView.LeftButtonRelease(event->pos().x(),event->pos().y());
    }

}

void hero_interface::MainWindow::keyPressEvent(QKeyEvent *ev)
{
    if(ev->isAutoRepeat())// otherwise this event will be trigered repeatedly
      return;
    switch(ev->key())
    {
    case Qt::Key_W:
      w_s_speed -= 1;
      break;
    case Qt::Key_S:
      w_s_speed += 1;
      break;
    case Qt::Key_A:
      a_d_speed -= 1;
      break;
    case Qt::Key_D:
      a_d_speed += 1;
      break;
    default:
      break;

    }
    //printf("press!\n");


    //QWidget::keyPressEvent(ev);
}

void hero_interface::MainWindow::keyReleaseEvent(QKeyEvent *ev)
{
  if(ev->isAutoRepeat())// otherwise this event will be trigered repeatedly
    return;
  switch(ev->key())
  {
  case Qt::Key_W:
    w_s_speed += 1;
    break;
  case Qt::Key_S:
    w_s_speed -= 1;
    break;
  case Qt::Key_A:
    a_d_speed += 1;
    break;
  case Qt::Key_D:
    a_d_speed -= 1;
    break;
  default:
    break;

  }
  //printf("release!\n");


 // QWidget::keyReleaseEvent(ev);
}

