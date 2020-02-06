#include "battleview.h"
#include "rotatedrect.h"
#include <ros/package.h>
#include "hero_math/math.h"

namespace hero_interface {


BattleView::BattleView(QNode *qNode)
{
    std::string full_path = ros::package::getPath("hero_interface") + "/resources/images/map.png";
    background.load(full_path.c_str());
    background = background.scaled(BATTLEFIELD_PIX_W,BATTLEFIELD_PIX_H);
    qNode_ = qNode;
    buffImage[0].load((ros::package::getPath("hero_interface") + "/resources/images/heal_red.png").c_str());
    buffImage[1].load((ros::package::getPath("hero_interface") + "/resources/images/heal_blue.png").c_str());
    buffImage[2].load((ros::package::getPath("hero_interface") + "/resources/images/reload_red.png").c_str());
    buffImage[3].load((ros::package::getPath("hero_interface") + "/resources/images/reload_blue.png").c_str());
    buffImage[4].load((ros::package::getPath("hero_interface") + "/resources/images/move_debuff.png").c_str());
    buffImage[5].load((ros::package::getPath("hero_interface") + "/resources/images/shoot_debuff.png").c_str());

    isDraging = false;
    isMousePressed = false;
}

bool BattleView::inImageScope(int x, int y)
{
  return x>=0&&x<=BATTLEFIELD_PIX_W&&y>=0&&y<=BATTLEFIELD_PIX_H;
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

void MeterToPix(int *pix_h, int *pix_w,double real_h, double real_w, QSize battleSize)
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
    int x,y;
    y=pose.x * battleSize.height() / BATTLEFIELD_W;
    x=pose.y * battleSize.width() / BATTLEFIELD_H ;
    x=x>=0?x:0;
    y=y>=0?y:0;
    return QPoint(x,y);
}

void BattleView::ImageToPosePoint(double *pose_x, double *pose_y, int image_x, int image_y)
{
    *pose_y=image_x * BATTLEFIELD_W/ background.height();
    *pose_x=image_y * BATTLEFIELD_H /background.width();
}

void BattleView::LeftButtonPress(int x, int y)
{


    isMousePressed = true;
    lastPoint = QPoint(x,y);
    if(isACT&&inImageScope(x,y))
    {
      //qNode_->RobotShoot("robot_0");
      qNode_->isShooting = true;
    }
     //printf("left press\n");

}

void BattleView::LeftButtonDrag(int x, int y)
{
    if(hero_common::PointDistance(lastPoint.x(),lastPoint.y(),x,y) > 10)
    {
        isDraging = true;
    }

    if(isDraging)
    {
        dragingPoint = QPoint(x,y);
    }
    //printf("x=%d,y=%d\n",x,y);


}

void BattleView::AimPointRobot0(int x, int y)
{
  if(isACT&&inImageScope(x,y))
  {
    double x_target;
    double y_target;
    ImageToPosePoint(&x_target,&y_target,x, y);

      //ROS_INFO("*set yaw :%f",-std::atan2(y - FindRobot("robot_0")->pose.y,x - FindRobot("robot_0")->pose.x));
      qNode_->SetRobot0Yaw(-std::atan2(y_target - FindRobot("robot_0")->pose.y,x_target - FindRobot("robot_0")->pose.x));
     // printf("set yaw :%f\n",std::atan2(y - FindRobot("robot_0")->pose.y,x - FindRobot("robot_0")->pose.x));

  }
}

void BattleView::LeftButtonRelease(int x, int y)
{
   isMousePressed = false;
   qNode_->isShooting = false;
    if(isDraging)
    {
        isDraging = false;
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            (*it)->selected = hero_common::PointInRect(PoseToMapPoint((*it)->pose,background.size()).x(),PoseToMapPoint((*it)->pose,background.size()).y(),
                        lastPoint.x(),lastPoint.y(),x,y);
        }
    }
    else
    {
        SetRobotGoalPoint(x,y);
    }
    //printf("release\n");
}

void BattleView::RightButtonPress(int x, int y)
{
    isDraging = false;
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        (*it)->selected = false;
    }
    //printf("right press\n");
}

void BattleView::SetRobotGoalPoint(int image_x, int image_y)
{
    if(image_x > BATTLEFIELD_PIX_W || image_y > BATTLEFIELD_PIX_H)
        return;
    double x_target;
    double y_target;



    ImageToPosePoint(&x_target,&y_target,image_x,image_y);
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->selected)
        {
            double yaw_target = std::atan2(y_target - (*it)->pose.y,x_target - (*it)->pose.x);
            //double yaw_target = (*it)->pose.yaw;
            qNode_->SendGoalPoint((*it)->index,x_target,y_target,yaw_target);
            (*it)->SetDest.x = x_target;
            (*it)->SetDest.y = y_target;

        }
    }

}
float PoseToAngle(float yaw)
{
    return yaw + 3.14159;
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

Robot* BattleView::FindRobot(std::string robot_name)
{
  for (auto it = robots_.begin(); it != robots_.end(); ++it) {
      if((*it)->name == robot_name)
      {
          return (*it);
      }
  }
  return nullptr;
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
        robotImage.fill(Qt::transparent);
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
        painterRobot.setPen(QPen(Qt::black, 8, Qt::SolidLine,
                                Qt::RoundCap, Qt::RoundJoin));
        //painterRobot.drawRect(robotImage.rect());
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.2,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX,ROBOT_HEIGHT_PIX,robotColor);
        if((*it)->selected)
            painterRobot.drawRect(ROBOT_WIDTH_PIX*0.2,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX,ROBOT_HEIGHT_PIX);

        painterRobot.setPen(QPen(Qt::black, 1, Qt::SolidLine,
                                Qt::RoundCap, Qt::RoundJoin));

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.72,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.72,ROBOT_WIDTH_PIX*0.8 * (*it)->health / 2000,ROBOT_HEIGHT_PIX*0.15,robotColor);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.72,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15);//health

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15,Qt::white);
        if((*it)->heat<240)
            painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8 * (*it)->heat / 240,ROBOT_HEIGHT_PIX*0.15,Qt::yellow);
        else {
            painterRobot.fillRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15,Qt::darkCyan);
        }
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.9,ROBOT_WIDTH_PIX*0.8,ROBOT_HEIGHT_PIX*0.15);//heat

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*0.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*1.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05,Qt::white);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*0.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.55,ROBOT_HEIGHT_PIX*1.175,ROBOT_WIDTH_PIX*0.3,ROBOT_HEIGHT_PIX*0.05);

        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3,Qt::white);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*1.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3,Qt::white);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*0.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3);
        painterRobot.drawRect(ROBOT_WIDTH_PIX*1.175,ROBOT_HEIGHT_PIX*0.55,ROBOT_HEIGHT_PIX*0.05,ROBOT_WIDTH_PIX*0.3);

        //painterRobot.fillRect(ROBOT_WIDTH_PIX*0.6,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX*0.15,ROBOT_HEIGHT_PIX*0.45,Qt::gray);
        //painterRobot.drawRect(ROBOT_WIDTH_PIX*0.6,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX*0.15,ROBOT_HEIGHT_PIX*0.45);//barrel
        hero_common::Point2D gimbalMid(ROBOT_WIDTH_PIX*0.7,ROBOT_HEIGHT_PIX*0.7);
        hero_common::Point2D gimbalEndNormal(ROBOT_WIDTH_PIX*0.7,ROBOT_HEIGHT_PIX*0.15);
        hero_common::Point2D gimbalEndRotated = hero_common::PointRotateAroundPoint(gimbalEndNormal, gimbalMid, - qNode_->GetGimbalYaw((*it)->index));
        painterRobot.setPen(QPen(Qt::gray, 20, Qt::SolidLine, Qt::FlatCap, Qt::RoundJoin));
        painterRobot.drawLine(ROBOT_WIDTH_PIX*0.7,ROBOT_HEIGHT_PIX*0.7,gimbalEndRotated.X(),gimbalEndRotated.Y());

        MeterToPix(&pix_h,&pix_w,ROBOT_HEIGHT*1.4,ROBOT_WIDTH*1.4,background.size());
        QMatrix matrix;
        matrix.rotate(PoseToAngle((*it)->pose.yaw) *180.0 / 3.1415);
        painter.drawImage(PoseToMapPoint((*it)->pose,background.size(),robotImage.scaled(pix_w,pix_h).transformed(matrix)), robotImage.scaled(pix_w,pix_h).transformed(matrix));

        if((*it)->selected && !((*it)->SetDest.x==0&&(*it)->SetDest.y==0))
        {
            if(hero_common::PointDistance((*it)->pose.x,(*it)->pose.y,(*it)->SetDest.x, (*it)->SetDest.y) > 0.4)
            {
                painter.setPen(QPen(Qt::green, 2, Qt::SolidLine,
                                        Qt::RoundCap, Qt::RoundJoin));
                painter.drawLine(PoseToMapPoint((*it)->pose,background.size()),PoseToMapPoint((*it)->SetDest,background.size()));
                painter.setPen(QPen(Qt::green, 5, Qt::SolidLine,
                                        Qt::SquareCap, Qt::RoundJoin));
                painter.drawPoint(PoseToMapPoint((*it)->pose,background.size()));
                painter.drawPoint(PoseToMapPoint((*it)->SetDest,background.size()));
            }
        }

    }

    /***************************Draw bullets********************************************************************************/

    qNode_->bulletInfo_lock.lock();
    for(int i=0;i<qNode_->GetBulletsInfo()->bullet_num;i++)
    {
        if(qNode_->GetBulletsInfo()->bullets.at(i).covered_distance > ROBOT_HEIGHT*1.5 )
        {
            painter.setPen(QPen(Qt::black, 2, Qt::SolidLine,
                                Qt::RoundCap, Qt::RoundJoin));
            painter.drawEllipse(PoseToMapPoint(Pose(qNode_->GetBulletsInfo()->bullets.at(i).x_last,qNode_->GetBulletsInfo()->bullets.at(i).y_last,0),background.size()),BULLET_RADIUS_PIX*0.5,BULLET_RADIUS_PIX*0.5);
            painter.setPen(QPen(Qt::green, BULLET_RADIUS_PIX*0.5, Qt::SolidLine,
                                Qt::RoundCap, Qt::RoundJoin));
            painter.drawEllipse(PoseToMapPoint(Pose(qNode_->GetBulletsInfo()->bullets.at(i).x_last,qNode_->GetBulletsInfo()->bullets.at(i).y_last,0),background.size()),BULLET_RADIUS_PIX*0.3,BULLET_RADIUS_PIX*0.3);
        }

    }
     qNode_->bulletInfo_lock.unlock();

     for(int i =0;i<qNode_->GetBuffInfo()->activated.size();i++)
     {
         if((!qNode_->GetBuffInfo()->activated[i]) && qNode_->GetBuffInfo()->buff_data[i] >=0 && qNode_->GetBuffInfo()->buff_data[i] < 6)
         {
            MeterToPix(&pix_h,&pix_w,qNode_->RFID_height,qNode_->RFID_width,background.size());
            painter.drawImage(PoseToMapPoint(Pose(qNode_->RFID_F_x[i] + qNode_->RFID_width*0.5 ,qNode_->RFID_F_y[i] + qNode_->RFID_height*0.5,0),
                                             background.size(),buffImage[qNode_->GetBuffInfo()->buff_data[i]].scaled(pix_w,pix_h)), buffImage[qNode_->GetBuffInfo()->buff_data[i]].scaled(pix_w,pix_h));
         }
     }

     if(isDraging)
     {
         painter.setPen(QPen(Qt::white, 2, Qt::SolidLine,
                             Qt::RoundCap, Qt::RoundJoin));
         painter.drawRect(lastPoint.x(),lastPoint.y(),dragingPoint.x()-lastPoint.x(),dragingPoint.y()-lastPoint.y());
     }



    }

}

