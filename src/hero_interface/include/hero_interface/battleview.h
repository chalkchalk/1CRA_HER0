#ifndef BATTLEVIEW_H
#define BATTLEVIEW_H

#include <vector>
#include <QtGui>

namespace hero_interface {


#define ROBOT_WIDTH 0.5
#define ROBOT_HEIGHT 0.6

#define ROBOT_WIDTH_PIX 50
#define ROBOT_HEIGHT_PIX 60

#define BATTLEFIELD_W 8.15
#define BATTLEFIELD_H 5.15

typedef struct
{
    float x;
    float y;
    float yaw;

}Pose;

class Robot
{
public:
    Robot(){
        health = 2000;
        heat = 0;
    };
    Robot(std::string robot_name, std::string robot_color){
        health = 2000;
        heat = 0;
        color = robot_color;
        name = robot_name;
    };
    std::string color;
    std::string name;
    int health;
    int heat;
    Pose pose;
};


class BattleView
{
public:
    BattleView();
    void AddRobot(Robot*  robot)
    {
         robots_.push_back(robot);
    }
    void GetBattleView(QImage *qImage);
    bool SetRobotPose(std::string robot_num,float x, float y, float yaw);

 private:
    std::vector<Robot* > robots_;
    void DrawRobot(QImage *qImage);
    QImage background;
    QPainter painter;
};

}
#endif // BATTLEVIEW_H
