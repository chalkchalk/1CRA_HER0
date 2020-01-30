#include "battleview.h"
#include "rotatedrect.h"
#include <ros/package.h>

namespace hero_interface {

BattleView::BattleView(QNode *qNode)
{
    std::string full_path = ros::package::getPath("hero_interface") + "/resources/images/map.png";
    background.load(full_path.c_str());
    background = background.scaled(554,854);
    qNode_ = qNode;
}

bool BattleView::SetRobotPose(std::string robot_num,float x, float y, float yaw)
{
    bool val = false;
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->name == robot_num)
        {
            (*it)->pose.x = x;
            (*it)->pose.y = y;
            (*it)->pose.yaw = yaw;
            val = true;
           // printf("set pose: %s, x:%f,y:%f,yaw:%f\n",x,y,yaw);
        }
    }
    return val;
}

void MeterToPix(int *pix_h, int *pix_w,float real_h, float real_w, QSize battleSize)
{
    if(pix_h!=nullptr)
    {
        *pix_h = real_h * battleSize.height() / BATTLEFIELD_W;
    }
    if(pix_w!=nullptr)
    {
        *pix_w = real_w * battleSize.height() / BATTLEFIELD_W;
    }
}

void BattleView::GetBattleView(QImage *qImage)
{

    DrawRobot(qImage);

}

QPoint PoseToMapPoint(Pose pose, QSize battleSize,QImage roboPic)
{
    int offset_x,offset_y;
    int x,y;
    offset_y=roboPic.size().width()/2;
    offset_x=roboPic.size().height()/2;
    y=pose.x * battleSize.height() / BATTLEFIELD_W - offset_x;
    x=pose.y * battleSize.width() / BATTLEFIELD_H - offset_y;
    x=x>=0?x:0;
    y=y>=0?y:0;
    return QPoint(x,y);
}

QPoint PoseToMapPoint(Pose pose, QSize battleSize)
{
    int offset_x,offset_y;
    int x,y;
    y=pose.x * battleSize.height() / BATTLEFIELD_W;
    x=pose.y * battleSize.width() / BATTLEFIELD_H ;
    x=x>=0?x:0;
    y=y>=0?y:0;
    return QPoint(x,y);
}


float PoseToAngle(float yaw)
{
    return yaw + 180;
}


void BattleView::UpdateHealthHeat()
{
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
     if((*it)->name=="robot_0")
     {
         (*it)->health = qNode_->GetRoboStatus(0).remain_hp;
         (*it)->heat = qNode_->GetRoboHeat(0).shooter_heat;
     }
     else if((*it)->name=="robot_1")
     {
         (*it)->health = qNode_->GetRoboStatus(1).remain_hp;
         (*it)->heat = qNode_->GetRoboHeat(1).shooter_heat;
     }
     else if((*it)->name=="robot_2")
     {
         (*it)->health = qNode_->GetRoboStatus(2).remain_hp;
         (*it)->heat = qNode_->GetRoboHeat(2).shooter_heat;
     }
     else if((*it)->name=="robot_3")
     {
         (*it)->health = qNode_->GetRoboStatus(3).remain_hp;
         (*it)->heat = qNode_->GetRoboHeat(3).shooter_heat;
     }
    }
}

void BattleView::DrawRobot(QImage *qImage)
{
    QPainter painter(qImage);
    QColor robotColor;
    QImage robotImage = QImage(QSize(ROBOT_WIDTH_PIX*1.4,ROBOT_HEIGHT_PIX*1.4), QImage::Format_ARGB32);
    QImage bulletImage = QImage(QSize(BULLET_RADIUS_PIX,BULLET_RADIUS_PIX), QImage::Format_ARGB32);
    bulletImage.fill(Qt::transparent);
    robotImage.fill(Qt::transparent);
    qImage->fill(Qt::white);
    QPainter painterRobot(&robotImage);

    painter.drawImage( QPoint(0, 0), background);
    int pix_h, pix_w;
    UpdateHealthHeat();
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->color=="red")
            robotColor=Qt::red;
        else if((*it)->color=="blue")
            robotColor=Qt::blue;
        else
        {
            robotColor=Qt::gray;
            printf("color error! %s\n",(*it)->color.c_str());
        }
        //(*it)->pose.x+=0.01;
        painterRobot.setPen(QPen(Qt::black, 1, Qt::SolidLine,
                                Qt::RoundCap, Qt::RoundJoin));
        //painterRobot.drawRect(robotImage.rect());
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.2,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX,ROBOT_HEIGHT_PIX,robotColor);



        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.72,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.72,ROBOT_WIDTH_PIX*0.8 * (*it)->health / 2000,ROBOT_HEIGHT_PIX*0.15,robotColor);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.72,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15);//health

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8 * (*it)->heat / 240,ROBOT_HEIGHT_PIX*0.15,Qt::yellow);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15);//heat

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*0.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*1.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05,Qt::white);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*0.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*1.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05);

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*1.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3,Qt::white);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*1.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3);

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.6,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX*0.15,ROBOT_HEIGHT_PIX*0.45,Qt::gray);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.6,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX*0.15,ROBOT_HEIGHT_PIX*0.45);//barrel

        MeterToPix(&pix_h,&pix_w,ROBOT_HEIGHT*1.4,ROBOT_WIDTH*1.4,background.size());
        QMatrix matrix;
        matrix.rotate(PoseToAngle((*it)->pose.yaw));
        painter.drawImage(PoseToMapPoint((*it)->pose,background.size(),robotImage.scaled(pix_w,pix_h).transformed(matrix)), robotImage.scaled(pix_w,pix_h).transformed(matrix));
        }

    /***************************Draw bullets********************************************************************************/

    for(int i=0;i<qNode_->GetBulletsInfo()->bullet_num;i++)
    {
         qNode_->bulletInfo_lock.lock();
        painter.setPen(QPen(Qt::black, 2, Qt::SolidLine,
                            Qt::RoundCap, Qt::RoundJoin));
        painter.drawEllipse(PoseToMapPoint(Pose(qNode_->GetBulletsInfo()->bullets.at(i).x_last,qNode_->GetBulletsInfo()->bullets.at(i).y_last,0),background.size()),BULLET_RADIUS_PIX*0.5,BULLET_RADIUS_PIX*0.5);
        painter.setPen(QPen(Qt::green, BULLET_RADIUS_PIX*0.5, Qt::SolidLine,
                            Qt::RoundCap, Qt::RoundJoin));
        painter.drawEllipse(PoseToMapPoint(Pose(qNode_->GetBulletsInfo()->bullets.at(i).x_last,qNode_->GetBulletsInfo()->bullets.at(i).y_last,0),background.size()),BULLET_RADIUS_PIX*0.3,BULLET_RADIUS_PIX*0.3);
        qNode_->bulletInfo_lock.unlock();
    }

    }

}

