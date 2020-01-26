#include "battleview.h"
#include "rotatedrect.h"

namespace hero_interface {

BattleView::BattleView()
{
    background.load("/home/ycz/ICRA_HERO_ws/src/hero_interface/resources/images/map.png");
    background = background.scaled(554,854);
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
    offset_x=roboPic.size().width()/2;
    offset_y=roboPic.size().height()/2;
    y=pose.x * battleSize.height() / BATTLEFIELD_W - offset_x;
    x=pose.y * battleSize.width() / BATTLEFIELD_H - offset_y;
    x=x>=0?x:0;
    y=y>=0?y:0;
    return QPoint(x,y);
}


float PoseToAngle(float yaw)
{
    return yaw + 180;
}

void BattleView::DrawRobot(QImage *qImage)
{
    QPainter painter(qImage);
    QColor robotColor;
    QPointF roboPoint[4];
    QImage robotImage = QImage(QSize(ROBOT_WIDTH_PIX*1.4,ROBOT_HEIGHT_PIX*1.4), QImage::Format_ARGB32);
    robotImage.fill(Qt::transparent);
    QPainter painterRobot(&robotImage);

    painter.drawImage( QPoint(0, 0), background);
    int pix_h, pix_w;
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
        painterRobot.setPen(QPen(robotColor, 2, Qt::SolidLine,
                                Qt::RoundCap, Qt::RoundJoin));
        painter.setPen(QPen(robotColor, 2, Qt::SolidLine,
                            Qt::RoundCap, Qt::RoundJoin));
        //painterRobot.drawRect(robotImage.rect());
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.2,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX,ROBOT_HEIGHT_PIX,robotColor);
        painterRobot.fillRect(ROBOT_WIDTH_PIX*0.6,ROBOT_HEIGHT_PIX*0.2,ROBOT_WIDTH_PIX*0.2,ROBOT_HEIGHT_PIX*0.5,Qt::gray);
        MeterToPix(&pix_h,&pix_w,ROBOT_HEIGHT*1.4,ROBOT_WIDTH*1.4,background.size());
        QMatrix matrix;
        matrix.rotate(PoseToAngle((*it)->pose.yaw));
        painter.drawImage(PoseToMapPoint((*it)->pose,background.size(),robotImage.scaled(pix_w,pix_h).transformed(matrix)), robotImage.scaled(pix_w,pix_h).transformed(matrix));
        }
    }

}

