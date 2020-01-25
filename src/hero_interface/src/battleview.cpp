#include "battleview.h"
#include "qrotatedrect.h"

namespace hero_interface {

BattleView::BattleView()
{
    background.load("/home/ycz/ICRA_HERO_ws/src/hero_interface/resources/images/map.png");
}

void BattleView::GetBattleView(QImage *qImage)
{
    QPainter painter(qImage);
    painter.drawImage( QPoint(0, 0), background);
    DrawRobot(qImage);

}

void BattleView::DrawRobot(QImage *qImage)
{
    QColor robotColor;
    QPainter painter(qImage);
    QImage robotImage = QImage(QSize(ROBOT_HEIGHT*1.41,ROBOT_HEIGHT*1.41), QImage::Format_RGB32);
    QPainter painterRobot(&robotImage);
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->color=="red")
            robotColor=Qt::red;
        else if((*it)->color=="blue")
            robotColor=Qt::blue;
        else
            robotColor=Qt::black;
        //QRotatedRect robotRect((*it)->pose.y*POSE_TO_PIX,(*it)->pose.x*POSE_TO_PIX,ROBOT_WIDTH,ROBOT_HEIGHT,(*it)->pose.yaw);
        //painter.drawPolygon(robotRect.points(),);
        painterRobot.setPen(QPen(robotColor, 2, Qt::SolidLine,
                            Qt::RoundCap, Qt::RoundJoin));
        painterRobot.drawRect(ROBOT_WIDTH*0.1,ROBOT_HEIGHT*0.1,ROBOT_WIDTH*0.9,ROBOT_HEIGHT*0.9);
        painter.drawImage( QPoint((*it)->pose.y*POSE_TO_PIX, (*it)->pose.x*POSE_TO_PIX), robotImage);

        printf("draw: robot:%s\n",(*it)->name.c_str());
        }
    }

}

